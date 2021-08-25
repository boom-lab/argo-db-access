function [discrete_data,api_call,status] = get_discrete_profiles_stats(PLATFORM_NUMBER)
%% Summary statistics for discrete sampling portion of cycle

PLATFORM_NUMBER = num2str(PLATFORM_NUMBER);
api_call = ['discrete_profile_stats?PLATFORM_NUMBER=',PLATFORM_NUMBER];
[data,api_call,status] = api_request(api_call);
discrete_data = struct2table(data);

