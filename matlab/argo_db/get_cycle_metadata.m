function [cycle_meta, api_call, status] = get_cycle_metadata(query, output_fields)
% Query - string of filtering terms
% deployment_fields = comma seperated string of fields to return from
% cycle metadata table

if nargin == 1
    output_fields = '';
end
api_call = sprintf('cycle_meta_get?%s&output_fields=%s', query, output_fields);
[cycle_meta,api_call,status] = api_request(api_call);
