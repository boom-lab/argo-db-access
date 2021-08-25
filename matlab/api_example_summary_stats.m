% Discrete and continuous profiles summary statistics
discrete_stats = get_discrete_profiles_stats('4903365');
continuous_stats = get_continuous_profiles_stats('4903365');

%Cycle Metadata
output_fields = 'ProfileId,GpsFixDate,GpsLong,GpsLat,TimeStartProfile,QuiescentVolts';
cycle_meta = get_cycle_metadata('DEPLOYMENT__PLATFORM_NUMBER=4903365', output_fields);

%% Table management and combine
%Convert struct to table
cycle_meta_table = struct2table(cycle_meta);

%reformat profile ID column and rename columns
for k = 1 : size(continuous_stats, 1)
  crtString = cell2mat(continuous_stats{k,1});
  t = strsplit(crtString,'.');
  continuous_stats{k, 1} = (t(2));
end

continuous_stats.Properties.VariableNames = {'Profile','Continuous Profile PRES Max','Continuous Profile N Samples'};

for k = 1 : size(discrete_stats, 1)
  crtString = cell2mat(discrete_stats{k,1});
  t = strsplit(crtString,'.');
  discrete_stats{k, 1} = t(2);
end

discrete_stats.Properties.VariableNames = {'Profile','Discrete Profile PRES Max','Discrete Profile N Samples'};


cycle_meta_table.ProfileIdN = cellstr(num2str(cycle_meta_table.ProfileId,'%03.f'));
cycle_meta_table = removevars(cycle_meta_table, {'ProfileId'});
cycle_meta_table.Properties.VariableNames = {'Lon','Lat','Battery Volts','GPS Fix Date','Time Start Profile','Profile'};

%Merge stats tables
profile_stats = join(continuous_stats, discrete_stats);
stats = outerjoin(profile_stats, cycle_meta_table, 'MergeKeys',true);

clear continuous_stats discrete_stats output_fields profile_stats t k cycle_meta_table cycle_meta crtString ans