import tensorflow as tf
import pandas as pd
import numpy as np
import math 
from geopy.geocoders import Nominatim

from sklearn.metrics.pairwise import cosine_similarity
from scipy import sparse

class User:
    user_num = 0

    def __init__(self, id,workplace, cur_residence, age, gender, total_family, elderly, child,bookmark ):
        self.id = id
        self.workplace = workplace
        self.cur_residence = cur_residence
        self.age = age
        self.gender = gender
        self.total_family = total_family
        self.elderly = elderly
        self.child = child
        self.bookmark = bookmark
        User.user_num += 1


# calcuate distance 

## L1 
def manhattan_distance(user1, user2):
    return np.abs(user1 - user2).sum()


## L2
def euclidean_distance(user1, user2):
  distance = 0
  for i in range(len(user1)):
    distance += (user1[i] - user2[i]) ** 2
  return distance ** 0.5
  



def weighted_rating(v,m,R,C):
    '''
    Calculate the weighted rating
    
    Args:
    v -> average rating for each item (float)
    m -> minimum votes required to be classified as popular (float)
    R -> average rating for the item (pd.Series)
    C -> average rating for the whole dataset (pd.Series)
    
    Returns:
    pd.Series
    '''
    return ( (v / (v + m)) * R) + ( (m / (v + m)) * C )





def get_searched(searched:str):

    if '선택' in searched:
        searched = searched.replace("선택", '')
    
    return searched.strip()



# 편의시설(관공서, 병원, 백화점, 대형상가, 공원, 기타
# 복지시설 "관리사무소", "노인정", "보육시설", "문고", "주민공동시설", "어린이놀이터", "휴게시설", "유치원", "커뮤니티공간", "자전거보관소"
# 교육시설(초등학교, 중학교, 고등학교, 대학교
# def get_columns(user:User):
#     res_dict = {"managementOffice":0,"seniorCenter":0,"childCare":0,"library":0,\
#         "communityFacilities":0,"playGround":0,"restFacilities":0,"kindergarten":0,\
#              "communitySpace":0,"bicycleShed":0,"publicOffice":0,"policeOffice":0,\
#                 "hospital":0,"departmentStore":0,"mall":0,"park":0,"elementarySchool":0,\
#                     "middleSchool":0,"highSchool":0,"university":0}
#     if int(user.age) > 50:
#         res_dict["departmentStore"] = 1

#     elif int(user.age) < 35:
#         res_dict["mall"] = 1


#     if int(user.child) > 0:
#         res_dict["elementarySchool"] = 1
#         res_dict["middleSchool"] = 1
#         res_dict["highSchool"] = 1
    
#     if int(user.elderly) > 0:
#         res_dict["seniorCenter"] = 1
#         res_dict["hospital"] = 1
#         res_dict["park"] = 1

#     if user.gender == 0:
#         res_dict["policeOffice"] = 1

#     if user.age < 37 and user.child > 0: # young parents who have a child
#         res_dict["playground"] = 1  # playground , kindergarden, elementary school etc.
#         res_dict["kindergarden"] = 1
#         res_dict["elementarySchool"] = 1

#     return res_dict

def get_columns(user:User):
    res_list = []
    if int(user.age) > 50:
        res_list.append("departmentStore")

    elif int(user.age) < 35:
        res_list.append("mall") 


    if int(user.child) > 0:
        res_list.append("elementarySchool") 
        res_list.append("middleSchool") 
        res_list.append("highSchool") 
    
    if int(user.elderly) > 0:
        res_list.append("seniorCenter") 
        res_list.append("hospital") 
        #res_list.append("park") 

    if user.gender == 'f' and user.elderly == 0 and user.child == 0:
        res_list.append("policeOffice") 

    if user.age < 37 and user.child > 0: # young parents who have a child
        res_list.append("playGround")   # playground , kindergarden, elementary school etc.
        res_list.append("kindergarten") 
        res_list.append("elementarySchool") 

    return res_list



def make_dataset(df_len, user:User,user_log_df):
    dataset = pd.DataFrame(columns=[ x for x in range(df_len)])

    for index, row in user_log_df.iterrows():
        new_row = [0 for x in range(df_len)]
        new_row[0] = int(row['id'])
        result_list = []
        for bookmark in list(user_log_df['bookmarks']):
            if not np.isnan(bookmark) : 
                result_list.append(int(bookmark))
                
        for bookmark in result_list:
            if bookmark <= df_len:
                new_row[bookmark] = 1
    
        dataset.loc[len(dataset)] = new_row

    return dataset


 
def calculate_similarity(data_items):
    # use cosine similarity
    data_sparse = sparse.csr_matrix(data_items)
    similarities = cosine_similarity(data_sparse.transpose())
    sim = pd.DataFrame(data=similarities, index= data_items.columns, columns= data_items.columns)
    return sim



def recommendation(df:pd.DataFrame,df_sub:pd.DataFrame, column_list, searched, cold_start, user:User, user_log_df):
    # column_list --> return value from get_columns() 
    # input_data --> dataframe

    df = df.dropna(how='all',subset=['selling_price','chartered_price','monthly_price','transaction_price']) # 넷 중 하나라도 없는 데이터는 drop 함 
    print("part2")
    if cold_start:
        print(searched)
        target_sub = df_sub[df_sub['kaptAddr'].str.contains(searched)]
        target_df = df[df['kaptAddr'].str.contains(searched)]
        print("target_num: " , len(target_df.index))
        print("part3")
        for val in column_list:
            pre_df = target_df
            target_df = target_df[target_df[val] == 1]
            target_sub = target_sub[target_sub[val] == 1]
            if len(target_df.index) < 1 and len(pre_df.index) < 80:
                print("data is too small. return previous dataframe")
                return pre_df
            elif len(target_df.index) < 1 and len(pre_df.index) > 80:
                print("sub dataframe", len(target_sub.index))
                return target_sub

            print("new df len: ", len(target_df.index))

        return target_df
        
    else:
        
        data = make_dataset(len(df.index), user,user_log_df)
        data_items = data.drop('user_id', 1)
        magnitude = np.sqrt(np.square(data_items).sum(axis=1))
        data_items = data_items.divide(magnitude, axis='index')

        # Build the similarity matrix
        data_matrix = calculate_similarity(data_items)

        # top 10 similar residences for user liked 
        #print(data_matrix.loc[4115].nlargest(11))

        # USER-ITEM CALCULATIONS


        data_neighbours = pd.DataFrame(index=data_matrix.columns, columns=range(1,11))
        for i in range(0, len(data_matrix.columns)):
            data_neighbours.iloc[i,:10] = data_matrix.iloc[0:,i].sort_values(ascending=False)[:10].index

        # set user id.
        user_id = user.id
        user_index = data[data.user_id == user_id].index.tolist()[0]

        known_user_likes = data_items.iloc[user_index]
        known_user_likes = known_user_likes[known_user_likes >0].index.values

        most_similar_to_likes = data_neighbours.iloc[known_user_likes]
        similar_list = most_similar_to_likes.values.tolist()
        similar_list = list(set([item for sublist in similar_list for item in sublist]))
        neighbourhood = data_matrix[similar_list].iloc[similar_list]


        user_vector = data_items.iloc[user_index].iloc[similar_list]

        # Calculate the score
        score = neighbourhood.dot(user_vector).div(neighbourhood.sum(axis=1))

        score = score.drop(known_user_likes)

        # print (known_user_likes)
        # print (score.nlargest(20))

        return similar_list





def geocoding(address):
    geolocator = Nominatim(user_agent = 'South Korea', timeout=None)
    location = geolocator.geocode(address)
    if location is None:
        crd = [None, None]
    else:
        crd = [location.latitude, location.longitude]

    return crd





