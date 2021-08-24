function [wmo,status_code] = get_wmo(FLOAT_SERIAL_NO, PLATFORM_TYPE)
%% Get WMO from serial number and float type

api_call = sprintf('wmo?FLOAT_SERIAL_NO=%s&PLATFORM_TYPE=%s',...
    FLOAT_SERIAL_NO, PLATFORM_TYPE);
[response,status_code] = api_request(api_call);
wmo = response.WMO;
  
end
