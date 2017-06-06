function control_map=calc_seasonal_dominant_3factor(season, ne, percentilec, percentc)

if strcmp(season, 'annual')==1
    load('../global_grid_top50_data/grid_top50_cape_results.mat');
    load('../global_grid_top50_data/grid_top50_pw_results.mat');
    load('../global_grid_top50_data/grid_top50_wind_results.mat');
else
    load(strcat('../global_grid_top50_data/seasonal/',season,'/grid_top50_cape_results_',season,'.mat'));
    load(strcat('../global_grid_top50_data/seasonal/',season,'/grid_top50_pw_results_',season,'.mat'));
    load(strcat('../global_grid_top50_data/seasonal/',season,'/grid_top50_wind_results_',season,'.mat'));
end

grid_top50_wind_percentile_fliped = grid_top50_wind_percentile;
clear grid_top50_wind_percentile;
grid_top50_wind_percentile = 1-grid_top50_wind_percentile_fliped;
clear grid_top50_wind_percentile_fliped;

nx = 256;
ny = 512;

% CAPE
cape_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        percentile_data = squeeze(grid_top50_cape_percentile(x,y,:,:));
        cape_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
    end
end

% PW
pw_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        percentile_data = squeeze(grid_top50_pw_percentile(x,y,:,:));
        pw_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
    end
end

% Wind
wind_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        percentile_data = squeeze(grid_top50_wind_percentile(x,y,:,:));
        wind_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
    end
end

control_map = ones(nx,ny)*0;

for x=1:nx
    for y=1:ny
        if cape_control_map(x,y)>=pw_control_map(x,y) && cape_control_map(x,y)>=wind_control_map(x,y)
            control_map(x,y)=3;
        end
        if pw_control_map(x,y)>=cape_control_map(x,y) && pw_control_map(x,y)>=wind_control_map(x,y)
            control_map(x,y)=2;
        end
        if wind_control_map(x,y)>=cape_control_map(x,y) && wind_control_map(x,y)>=pw_control_map(x,y)
            control_map(x,y)=1;
        end
    end
end

control_map(control_map==0)=nan;