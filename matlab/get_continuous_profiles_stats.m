function [continuous_data,api_call,status] = get_continuous_profiles_stats(PLATFORM_NUMBER)
%% Summary statistics for continuous sampling portion of cycle

PLATFORM_NUMBER = num2str(PLATFORM_NUMBER);
api_call = ['continuous_profile_stats?PLATFORM_NUMBER=',PLATFORM_NUMBER];
[data,api_call,status] = api_request(api_call);
continuous_data = struct2table(data);

