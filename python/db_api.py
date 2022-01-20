import requests
import json
import pandas as pd


BASE_URL = "https://db.whoifloatgroup.org"
headers = {'Content-Type':'application/json'}

#-----------Metadata------------------------------------------------------#
def get_deployment_meta(parameters):
    response = requests.get(BASE_URL+"/api/deployment_metadata",headers=headers,
        params=parameters)

    if response.status_code==200:
        return pd.DataFrame(json.loads(response.content))
    raise Exception('ERROR: ', response.status_code)


#-------------Environment Data ---------------------------------------------#
def get_discrete_one_float(PLATFORM_NUMBER, output_fields):
    """Requests all discrete data for one float
    PLATFORM_NUMBER = string, WMO number
    output_fields = string, comma seperated field names to output. See bgc-database django application for field names"""

    response = requests.get(BASE_URL+"/api/discrete_data_get", headers=headers, 
        params={"DEPLOYMENT__PLATFORM_NUMBER":PLATFORM_NUMBER, "output_fields":output_fields})

    if response.status_code==200:
        return pd.DataFrame(json.loads(response.content))
    raise Exception('ERROR: ', response.status_code)

def get_discrete_one_profile(PROFILE_ID, output_fields):
    """Requests discrete data of one profile
    PROFILE_ID = string, in the format WWWWW.PPP where W is the WMO number and P is the cycle
    output_fields = string, comma seperated field names to output. See bgc-database django application for field names
    returns pandas dataframe"""

    response = requests.get(BASE_URL+"/api/discrete_data_get", headers=headers, 
        params={"PROFILE_ID":PROFILE_ID, "output_fields":output_fields})

    if response.status_code==200:
        return pd.DataFrame(json.loads(response.content))
    raise Exception('ERROR: ', response.status_code)

def get_continuous_one_float(PLATFORM_NUMBER, output_fields):
    """Requests all continuous data for one float
    PLATFORM_NUMBER = string, WMO number
    output_fields = string, comma seperated field names to output. See bgc-database django application for field names
    returns pandas dataframe"""   

    response = requests.get(BASE_URL+"/api/continuous_data_get", headers=headers, 
        params={"DEPLOYMENT__PLATFORM_NUMBER":PLATFORM_NUMBER, "output_fields":output_fields})

    if response.status_code==200:
        return pd.DataFrame(json.loads(response.content))
    raise Exception('ERROR: ', response.status_code)

def get_continuous_one_profile(PROFILE_ID, output_fields):
    """Requests continuous data of one profile
    PROFILE_ID = string, in the format WWWWW.PPP where W is the WMO number and P is the cycle
    output_fields = string, comma seperated field names to output. See bgc-database django application for field names
    returns pandas dataframe"""  
    
    response = requests.get(BASE_URL+"/api/continuous_data_get", headers=headers, 
        params={"PROFILE_ID":PROFILE_ID, "output_fields":output_fields})

    if response.status_code==200:
        return pd.DataFrame(json.loads(response.content))
    raise Exception('ERROR: ', response.status_code)


if __name__ == "__main__":
    #discrete_one_float = get_discrete_one_float("1902304", "DEPLOYMENT,PROFILE_ID,PRES,TEMP,PSAL")
    #print(discrete_one_float)

    #discrete_one_profile = get_discrete_one_profile("1902304.001", "DEPLOYMENT,PROFILE_ID,PRES,TEMP,PSAL")
    #print(discrete_one_profile)

    #coninuous_one_float = get_continuous_one_float("1902304", "DEPLOYMENT,PROFILE_ID,PRES,TEMP,PSAL")
    #print(coninuous_one_float)

    coninuous_one_profile = get_continuous_one_profile("1902304.001", "DEPLOYMENT,PROFILE_ID,PRES,TEMP,PSAL")
    print(coninuous_one_profile)