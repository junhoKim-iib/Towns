from collections import UserList
import pandas as pd
import numpy as np
import math 
from geopy.geocoders import Nominatim



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
  
#print(euclidean_distance(A=[1, 5, 7, 9], B=[2, 3, 6, 15]))



def vectorize_user(user_list):
    for user in user_list:
        pass


def get_user_similarity(user):
    pass



# user info similarity
#if there is no bookmark data:
def cold_start(user):

    pass





class User:
    user_num = 0

    def __init__(self,workplace, cur_residence, age, gender, total_family, elderly, child ):
        self.workplace = workplace
        self.cur_residence = cur_residence
        self.age = age
        self.gender = gender
        self.total_family = total_family
        self.elderly = elderly
        self.child = child
        User.user_num += 1



def get_needed_dict(user):
    
    elderly = user.elderly
    child = user.child
    needed_dict = {'convenientFacility':[], 'educationFacility':[]}
    if elderly > 0:
        needed_dict['convenientFacility'].append('보건소') 
        needed_dict['convenientFacility'].append('병원')
        
    if child > 0:
        needed_dict['educationFacility'].append('초등학교')
        needed_dict['educationFacility'].append('중학교')
    
    return needed_dict
    
    
def get_recommendation(target_loc,needed_dict, df):
    df = df[df['bjdCode'] == int(target_loc)]
    df = df.dropna(subset=['convenientFacility','educationFacility'])
    df = df[df['convenientFacility'].str.contains(needed_dict['convenientFacility'][1])]
    df = df[df['educationFacility'].str.contains(needed_dict['educationFacility'][0])]
    
    return df
    

def set_weight(df):
    conditions = [(df['convenientFacility'].str.contains('백화점')) &(df['convenientFacility'].str.contains('대형상가'))
                  &(df['convenientFacility'].str.contains('관공서'))&(df['convenientFacility'].str.contains('공원'))
                  &(df['convenientFacility'].str.contains('병원')),
                  
                 (df['convenientFacility'].str.contains('병원'))&(df['convenientFacility'].str.contains('대형상가'))
                  &(df['convenientFacility'].str.contains('관공서'))&(df['convenientFacility'].str.contains('공원')),
                  
                 (df['convenientFacility'].str.contains('병원'))&(df['convenientFacility'].str.contains('대형상가'))
                  &(df['convenientFacility'].str.contains('공원')),
                  
                 (df['convenientFacility'].str.contains('병원'))&(df['convenientFacility'].str.contains('대형상가')),
                  
                 (df['convenientFacility'].str.contains('대형상가'))]
   
    choices = [5,4,3,2,1]
    df['score'] = np.select(conditions, choices, default = 0)
    df = df.sort_values(by=['score'], ascending=[False])
    
    return df

def geocoding(address):
    geolocator = Nominatim(user_agent = 'South Korea', timeout=None)
    location = geolocator.geocode(address)
    if location is None:
        crd = ['NaN', 'NaN']
    else:
        crd = [location.latitude, location.longitude]

    return crd



def result_list():
    df = pd.read_json("C:\\Users\\kimjunho\\Desktop\\flask_rest_api\\data\\location_data2.json")
    df_loc = pd.read_json("C:\\Users\\kimjunho\\Desktop\\flask_rest_api\\data\\bjd_code.json")
    user_log_df = pd.read_json("C:\\Users\\kimjunho\\Desktop\\flask_rest_api\\data\\MOCK_search_log.json")
    user_info = pd.read_json("C:\\Users\\kimjunho\\Desktop\\flask_rest_api\\data\\MOCK_USER_DATA.json")

   
    user = User(workplace = '삼성동',cur_residence = '용산',age='42',gender='f', total_family=5,elderly= 2,child=1)
    #user_searched = input('지역 검색: ')
    user_searched = "강남구 삼성동"
    search_result = df_loc[df_loc['location'].str.contains(user_searched)]
    choose_district = search_result.iloc[[0],:]
    target_loc = str(int(choose_district['bjdcode']))
    needed_dict = get_needed_dict(user)
    res_list = get_recommendation(target_loc,needed_dict,df)

    weighted_list = set_weight(res_list) # recommendation list 
