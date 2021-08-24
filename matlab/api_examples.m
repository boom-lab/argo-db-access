%% Deployment API
% Get deployment metadata
% query = string of filters
% deployment_fields = string of output deployment table fields
% sensor_fields = string of output sensor table fields

% Base query example for one float: 'PLATFORM_NUMBER=1902303&PLATFORM_TYPE=NAVIS_EBR'
% Add additional filter parameters after adding '&'
    % Filter options
    % less than: '__lt'
    % greater than: '__gt'
    % range: '__range'
    % contains: '__contains'
    
% Output fields example:
    % 'fields=SENSORS,SENSOR_SERIAL_NO'
    
%Output all metadata fields for one float
[deployment_meta_all, sensors_all] = get_deployment_metadata('PLATFORM_NUMBER=1902303&PLATFORM_TYPE=NAVIS_EBR');

%Only output the following fields for one float
deployment_fields = 'AOML_ID,ADD_DATE,sensors'; %always need 'sensors' here if you want sensor data
sensor_fields = 'SENSOR,SENSOR_MAKER';
[deployment_meta, sensors] = get_deployment_metadata('PLATFORM_NUMBER=1902303&PLATFORM_TYPE=NAVIS_EBR', deployment_fields, sensor_fields);

%Complex query and output only select fields
deployment_fields = 'AOML_ID,ADD_DATE,ROM_VERSION';
sensor_fields = '';
[deployment_meta_2019, sensors_2019] = get_deployment_metadata('LAUNCH_DATE__gt=2019-01-01T00:00:00Z&LAUNCH_DATE__lt=2020-01-01T00:00:00Z', deployment_fields, sensor_fields);


%% Sensor API
% Get sensor metadata
% query = string of filters
% fields = comma seperated string of fields to output

% Get specified fields for all CHLA sensors
fields = 'SENSOR,SENSOR_SERIAL_NO,LAUNCH_LATITUDE';
[sensor_meta] = get_sensor_metadata('SENSOR=FLUOROMETER_CHLA', fields);

% Get specified fields for CHLA sensors SN in the range of 0286 to 0320
fields = 'SENSOR,SENSOR_SERIAL_NO,LAUNCH_LATITUDE';
[sensor_meta_SN] = get_sensor_metadata('SENSOR=FLUOROMETER_CHLA&SENSOR_SERIAL_NO__range=(0286,0320)', fields);

