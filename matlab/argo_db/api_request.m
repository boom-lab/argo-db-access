function [data,api_call,status_code] = api_request(api_call)

WHOI_domain = 'https://db.whoifloatgroup.org/api/';

%Request from API
request = matlab.net.http.RequestMessage();
request.Method = 'GET';
api_call = [WHOI_domain,api_call];
response = request.send( api_call);
status_code = response.StatusCode;

%Check response status
if strcmpi(status_code,'OK')
    data = response.Body.Data;
else
    data = '';
end
    
end


