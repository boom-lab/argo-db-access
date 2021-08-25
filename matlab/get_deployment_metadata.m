function [deployment_meta, sensors, api_call,status] = get_deployment_metadata(filt,varargin)
% GET_DEPLOYMENT_METADATA Retrieve deployment metadata by float WMO number
%
% Required input
% ------------------
% filt: either a WMO number or string query
%
% Optional Name,Value pairs
% ------------------
% deployment_fields
% sensor_fields
%
% Example usage:
% [deployment_meta,sensors] = get_deployment_metadata('1902304');
% [deployment_meta_2019, sensors_2019] = ...get_deployment_metadata('LAUNCH_DATE__gt=2019-07-01T00:00:00Z&LAUNCH_DATE__lt=2020-01-01T00:00:00Z', 'deployment_fields','AOML_ID,ADD_DATE,ROM_VERSION,sensors');



%% parse inputs
p = inputParser;

defaultFields = '';

addParameter(p,'deployment_fields',defaultFields,@ischar);
addParameter(p,'sensor_fields',defaultFields,@ischar);

parse(p,varargin{:});
deployment_fields = p.Results.deployment_fields;
sensor_fields = p.Results.sensor_fields;


% check if it is numeric (wmo = nan if not)
filt_str = num2str(filt);
wmo = str2double(filt_str);
%% construct api call
if ~isnan(wmo)
    api_call = ['deployment_metadata?PLATFORM_NUMBER=',filt_str];
% filter is ignored if wmo is specified
else
    api_call = ['deployment_metadata?',filt];
end

if ~isempty(deployment_fields)
    api_call = sprintf('%s&deployment_fields=%s',api_call,deployment_fields);
end
if ~isempty(sensor_fields)
    api_call = sprintf('%s&sensor_fields=%s',api_call,sensor_fields);
end

%% request and parse
[deployment_meta,api_call,status] = api_request(api_call);
if isfield(deployment_meta,'sensors')
    sensors = extractfield(deployment_meta,'sensors');
    deployment_meta = rmfield(deployment_meta,'sensors');
else
    sensors = '';
end
