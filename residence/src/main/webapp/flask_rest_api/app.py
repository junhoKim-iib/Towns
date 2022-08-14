from flask import Flask  # 서버 구현을 위한 Flask 객체 import
from flask import request
from flask_restx import Api, Resource  # Api 구현을 위한 Api 객체 import
from flask_restful import reqparse
from flask_cors import CORS
from web.functions import recommendation as recom
import pandas as pd
import json
from urllib import parse

app = Flask(__name__)  # Flask 객체 선언, 파라미터로 어플리케이션 패키지의 이름을 넣어줌.
app.config['JSON_AS_ASCII'] = False
api = Api(app)  # Flask 객체에 Api 객체 등록
CORS(app)

@app.route('/recommend', methods=['GET'])
def recommend():
    path = "C:/Users/user/eclipse-workspace1/lastgr/src/main/webapp/flask_rest_api/"
    df = pd.read_excel(path + "web/functions/price_test.xlsx")
    df_loc = pd.read_json(path + "data/bjd_code.json")

    try:
        args = request.args
        print (args) # For debugging
        searched = args['searched']
        ag = int(args['age'])
        gen = args['gender']
        eld = int(args['elderly'])
        chd = int(args['child'])
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
        # user = recom.User(workplace = '삼성동',cur_residence = '용산',age='42',gender='f', total_family=5,elderly= 2,child=1)
        # user_searched = input('지역 검색: ')
        # user_searched = "강남구 삼성동"
        user_searched = searched
        user = recom.User(workplace='삼성동', cur_residence='용산', age=ag, gender=gen, total_family=eld+chd, elderly=eld, child=chd)
        search_result = df_loc[df_loc['location'].str.contains(user_searched)]
        choose_district = search_result.iloc[[0],:]
        
        target_loc = str(int(choose_district['bjdcode']))
        needed_dict = recom.get_needed_dict(user)
        res_list = recom.get_recommendation(target_loc,needed_dict,df)

        weighted_list = recom.set_weight(res_list) # recommendation list 
        recom_json = weighted_list.to_json(force_ascii=False)
        #recom_json = json.dumps(recom_json, indent=4, ensure_ascii=False)
        #recom_json = parse.unquote(recom_json,encoding='utf8')
        print('끝')
        return res_list.to_json(force_ascii=False)

    except Exception as e:
        app.logger.error(e)
        return {'error':str(e)}
            
if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=8080)