function cycle_meta = get_cycle_metadata(query, output_fields)
    % Query - string of filtering terms
    % deployment_fields = comma seperated string of fields to return from
       % cycle metadata table 
       
    WHOI_domain = 'https://db.whoifloatgroup.org/';

    %Request from API
    request = matlab.net.http.RequestMessage();
    request.Method = 'GET';
    
    if (exist('output_fields','var') == 1)
        api_call = sprintf('%sapi/cycle_meta_get?%s&output_fields=%s', ...
            WHOI_domain, query, output_fields);
    else
        api_call = sprintf('%sapi/cycle_meta_get?%s', ...
            WHOI_domain, query);       
    end
    
    meta_response = request.send( api_call );

    %Check response status
    if meta_response.StatusCode == 200

        cycle_meta = (meta_response.Body.Data);
    end
end