function data = get_discrete_profiles_stats(PLATFORM_NUMBER)
    %%   
    WHOI_domain = 'https://db.whoifloatgroup.org/';

    request = matlab.net.http.RequestMessage();
    request.Method = 'GET';
    api_call = sprintf('%sapi/discrete_profile_stats?PLATFORM_NUMBER=%s', ...
        WHOI_domain, PLATFORM_NUMBER);
    response = request.send( api_call );

    if response.StatusCode == 200
        display(response.Body.Data);
        data = struct2table(response.Body.Data);
    end
end