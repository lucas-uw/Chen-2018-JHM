function [control_map, control_map2]=calc_seasonal_dominant_4factor(season, ne, percentilec, percentc)

load('../CONUS_Eta221_32km_landmask.mat');

if strcmp(season, 'annual')==1
    load('../grid_top50_results/grid_top50_rh_results.mat');
    load('../grid_top50_results/grid_top50_tavg_results.mat');
    load('../grid_top50_results/grid_top50_tdiff_results.mat');
    load('../grid_top50_results/grid_top50_wind_results.mat');
else
    load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_rh_results.mat'));
    load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_tavg_results.mat'));
    load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_tdiff_results.mat'));
    load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_wind_results.mat'));
end

grid_top50_wind_percentile_fliped = grid_top50_wind_percentile;
clear grid_top50_wind_percentile;
grid_top50_wind_percentile = 1-grid_top50_wind_percentile_fliped;
clear grid_top50_wind_percentile_fliped;

nx = 131;
ny = 201;

% Wind
wind_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        percentile_data = squeeze(grid_top50_wind_percentile(x,y,:,:));
        percentile_data(isnan(percentile_data))=0;
        wind_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
    end
end

% RH
rh_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        percentile_data = squeeze(grid_top50_rh_percentile(x,y,:,:));
        percentile_data(isnan(percentile_data))=0;
        rh_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
    end
end

% Tavg
tavg_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        percentile_data = squeeze(grid_top50_tavg_percentile(x,y,:,:));
        percentile_data(isnan(percentile_data))=0;
        tavg_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
    end
end

% Tdiff
tdiff_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        percentile_data = squeeze(grid_top50_tdiff_percentile(x,y,:,:));
        percentile_data(isnan(percentile_data))=0;
        tdiff_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
    end
end


% 4factor control map
control_map = ones(nx,ny)*0;

for x=1:nx
    for y=1:ny
        if rh_control_map(x,y)>=tavg_control_map(x,y) && rh_control_map(x,y)>=wind_control_map(x,y) && rh_control_map(x,y)>=tdiff_control_map(x,y)
            control_map(x,y)=2;
        end
        if tavg_control_map(x,y)>=rh_control_map(x,y) && tavg_control_map(x,y)>=wind_control_map(x,y) && tavg_control_map(x,y)>=tdiff_control_map(x,y)
            control_map(x,y)=3;
        end
        if tdiff_control_map(x,y)>=wind_control_map(x,y) && tdiff_control_map(x,y)>=rh_control_map(x,y) && tdiff_control_map(x,y)>=tavg_control_map(x,y)
            control_map(x,y)=4;
        end
        if wind_control_map(x,y)>=rh_control_map(x,y) && wind_control_map(x,y)>=tavg_control_map(x,y) && wind_control_map(x,y)>=tdiff_control_map(x,y)
            control_map(x,y)=1;
        end
    end
end

control_map(control_map==0)=nan;
control_map(landmask==0)=nan;


% excluding RH
control_map2 = ones(nx,ny)*0;

rh_control_map = zeros(nx, ny);
for x=1:nx
    for y=1:ny
        if rh_control_map(x,y)>=tavg_control_map(x,y) && rh_control_map(x,y)>=wind_control_map(x,y) && rh_control_map(x,y)>=tdiff_control_map(x,y)
            control_map2(x,y)=0;
        end
        if tavg_control_map(x,y)>=rh_control_map(x,y) && tavg_control_map(x,y)>=wind_control_map(x,y) && tavg_control_map(x,y)>=tdiff_control_map(x,y)
            control_map2(x,y)=2;
        end
        if tdiff_control_map(x,y)>=wind_control_map(x,y) && tdiff_control_map(x,y)>=rh_control_map(x,y) && tdiff_control_map(x,y)>=tavg_control_map(x,y)
            control_map2(x,y)=3;
        end
        if wind_control_map(x,y)>=rh_control_map(x,y) && wind_control_map(x,y)>=tavg_control_map(x,y) && wind_control_map(x,y)>=tdiff_control_map(x,y)
            control_map2(x,y)=1;
        end
    end
end

control_map2(control_map2==0)=nan;
control_map2(landmask==0)=nan;
