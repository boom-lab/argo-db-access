function [sensor_meta,api_call,status_code] = get_sensor_metadata(query, fields)
 % GET_SENSOR_METADATA
 % 
 % INPUTS:
 % query:   string of filtering terms
 % [optional]
 % fields: comma seperated string of fields to return from deployment table 

if nargin == 1
    fields = '';
end
call = sprintf('sensor_metadata?%s&fields=%s',query, fields);
[sensor_meta,api_call,status_code] = api_request(call);

end