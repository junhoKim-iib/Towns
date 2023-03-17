from flask import Flask  # 서버 구현을 위한 Flask 객체 import
from flask import request
from flask_restx import Api, Resource  # Api 구현을 위한 Api 객체 import
from flask_restful import reqparse
from flask_cors import CORS
from web.functions import recommendation as recom
import pandas as pd
import json
from urllib import parse
import sys

app = Flask(__name__)  # Flask 객체 선언, 파라미터로 어플리케이션 패키지의 이름을 넣어줌.
app.config['JSON_AS_ASCII'] = False
api = Api(app)  # Flask 객체에 Api 객체 등록
CORS(app)

path = "data path here"
df = pd.read_excel(path + "web/functions/dataset.xlsx", index_col=0)
df_sub = pd.read_excel(path + "web/functions/sub_dataset.xlsx",index_col=0)
df_loc = pd.read_json(path + "data/bjd_code.json")
user_log_df = []


@app.route('/recommend', methods=['GET'])
def recommend():
    # path = "C:/Users/kimjunho/eclipse-workspace/residence/src/main/webapp/flask_rest_api/"
    # df = pd.read_excel(path + "web/functions/seoul_done.xlsx", index_col=0)
    # df_loc = pd.read_json(path + "data/bjd_code.json")

    try:
        args = request.args
        print (args) # For debugging
        searched = args['searched']
        ag = int(args['age'])
        gen = args['gender']
        eld = int(args['elderly'])
        chd = int(args['child'])
        workplace = ''
        residence = ''
        """
        parser = reqparse.RequestParser()
        parser.add_argument('searched',type=str)
        parser.add_argument('age', type=str)
        parser.add_argument('gender', type=str)
        parser.add_argument('elderly', type=str)
        parser.add_argument('child', type=str)
        args = parser.parse_args()
        
        searched = args['searched']
        age = args['age']
        gen = args['gender']
        eld = args['elderly']
        chd = args['child']
        """
        id = 1

        user_searched = recom.get_searched(searched)
        user = recom.User(id=id ,workplace=workplace, cur_residence=residence, age=ag, gender=gen, total_family=eld+chd, elderly=eld, child=chd, bookmark=[])
        
        print("gender : ", user.gender)

        column_list = recom.get_columns(user)
        print(column_list)
        cold_start = 1
        print("part1") 
        #print(df.head())
        res_list = recom.recommendation(df,df_sub,column_list,user_searched,cold_start, user, user_log_df)

      
        print(res_list)
        print('Done')
        return res_list.to_json(force_ascii=False)

    except Exception as e:
        app.logger.error(e)
        return {'error':str(e)}

            
if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5000)