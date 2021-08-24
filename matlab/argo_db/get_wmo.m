function wmo = get_wmo(FLOAT_SERIAL_NO, PLATFORM_TYPE)
    %% Get WMO from serial number and float type    
    WHOI_domain = 'https://db.whoifloatgroup.org/';

    request = matlab.net.http.RequestMessage();
    request.Method = 'GET';
    api_call = sprintf('%sapi/wmo?FLOAT_SERIAL_NO=%s&PLATFORM_TYPE=%s', ...
        WHOI_domain, FLOAT_SERIAL_NO, PLATFORM_TYPE);
    wmo_response = request.send( api_call );

    if wmo_response.StatusCode == 200
        display(wmo_response.Body.Data);
        wmo = wmo_response.Body.Data.WMO;
    end
end