[meta,api_call,status_code] = api_request('wmo_assigned?PLATFORM_TYPE=NAVIS_EBR');

wmos = meta.PLATFORM_NUMBER;
figure;
worldmap("World");
land = readgeotable("landareas.shp");
geoshow(land,'FaceColor',[0.5,0.5,0.5]);
for ii = 1:length(wmos)
    [meta,api_call,status_code] = api_request(['locations?PLATFORM_NUMBER=',wmos{ii}]);
    if ~isempty(meta.GpsLat)
        % api return is not ordered - need to sort by date
        meta = sortrows(struct2table(meta));
        plotm(meta.GpsLat,meta.GpsLong,'Color',[0.3,0.3,0.3],'LineWidth',1);
        plotm(meta.GpsLat(end),meta.GpsLong(end),'.','MarkerSize',20);
    end
end
