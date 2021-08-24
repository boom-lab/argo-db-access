function [deployment_meta, sensors] = get_deployment_metadata(query, deployment_fields, sensor_fields)
    % Query - string of filtering terms
    % deployment_fields = comma seperated string of fields to return from
       % deployment table 
    % sensor_fields = comma seperated string of fields to return from
       % sensor table
       
    WHOI_domain = 'https://db.whoifloatgroup.org/';

    %Request from API
    request = matlab.net.http.RequestMessage();
    request.Method = 'GET';
    
    if (exist('deployment_fields','var') == 1) && (exist('sensor_fields','var') == 1)
        api_call = sprintf('%sapi/deployment_metadata?%s&deployment_fields=%s&sensor_fields=%s', ...
            WHOI_domain, query, deployment_fields, sensor_fields);
    elseif (exist('deployment_fields','var') == 1)
        api_call = sprintf('%sapi/deployment_metadata?%s&deployment_fields=%s', ...
            WHOI_domain, query, deployment_fields);
    else
        api_call = sprintf('%sapi/deployment_metadata?%s', ...
            WHOI_domain, query);       
    end
    
    meta_response = request.send( api_call );

    %Check response status
    if meta_response.StatusCode == 200

        deployment_meta = (meta_response.Body.Data);
        
        try
            %Split up results
            sensors = meta_response.Body.Data.sensors;
            deployment_meta = rmfield(deployment_meta, 'sensors');
        catch
            sensors = '';
        end
    end
end