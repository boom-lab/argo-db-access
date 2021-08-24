import requests
import json
import pandas as pd
BASE_URL = "https://db.whoifloatgroup.org"
#BASE_URL = "http://127.0.0.1:8000"

headers = {'Content-Type':'application/json'}

def get_deployment_meta(parameters):
    response = requests.get(BASE_URL+"/api/deployment_metadata",headers=headers, 
        params=parameters)

    if response.status_code==200:
        return pd.DataFrame(json.loads(response.content))
    raise Exception('ERROR: ', response.status_code)