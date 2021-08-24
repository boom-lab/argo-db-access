function [sensor_meta] = get_sensor_metadata(query, fields)
    % Query = string of filtering terms
    % fields = comma seperated string of fields to return from
       % deployment table 

       
    WHOI_domain = 'https://db.whoifloatgroup.org/';

    %Request from API
    request = matlab.net.http.RequestMessage();
    request.Method = 'GET';
    
    if exist('fields','var') == 1
        api_call = sprintf('%sapi/sensor_metadata?%s&fields=%s', ...
            WHOI_domain, query, fields);
    else
        api_call = sprintf('%sapi/sensor_metadata?%s', ...
            WHOI_domain, query);       
    end
    
    meta_response = request.send( api_call );

    %Check response status
    if meta_response.StatusCode == 200

        sensor_meta = (meta_response.Body.Data);
    end
end