clear all;
clc;

load('../../NARR_ERA_landmask_latlon.mat');

% year-round
load('../grid_top50_results/grid_top50_rh_results.mat');
load('../grid_top50_results/grid_top50_tavg_results.mat');
load('../grid_top50_results/grid_top50_tdiff_results.mat');
load('../grid_top50_results/grid_top50_wind_results.mat');

% seasonal
%season = 'winter';
%load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_rh_results.mat'));
%load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_tavg_results.mat'));
%load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_tdiff_results.mat'));
%load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_wind_results.mat'));

grid_top50_wind_percentile_fliped = grid_top50_wind_percentile;
clear grid_top50_wind_percentile;
grid_top50_wind_percentile = 1-grid_top50_wind_percentile_fliped;
clear grid_top50_wind_percentile_fliped;

nx = 131;
ny = 201;

%%
% figure(2);
% clf(2);

% candidates:
% 10/5   0.99  0.15  0.25


% params
ne = 50;
% the percentile above which the factor is considered as controlling the
% event. Vary: 0-1
percentilec = 0.95; % 0.95
% the percentage of extreme condition (>perc) in the 72hour duration.
percentc = 0.15;  % 0.15
threshold = 0.25;  % 0.33

% Wind
wind_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        if NARR_landmask(x,y)==1
            percentile_data = squeeze(grid_top50_wind_percentile(x,y,:,:));
            wind_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
        end
        if NARR_landmask(x,y)==0
            wind_control_map(x,y) = nan;
        end
    end
end

% subplot(2,2,1);
% pcolor(wind_control_map);
% caxis([0 1]);
% colormap(parula(10));
% shading flat;
% %shading interp;
% ax = gca;
% ax.YDir = 'normal';
% title('Wind control share');
% colorbar;

% RH
rh_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        if NARR_landmask(x,y)==1
            percentile_data = squeeze(grid_top50_rh_percentile(x,y,:,:));
            %rh_control_map(x,y) = calc_climate_control2(percentile_data, ne, 0.97, 0.15);
            rh_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
        end
        if NARR_landmask(x,y)==0
            rh_control_map(x,y) = nan;
        end
    end
end


% subplot(2,2,2);
% pcolor(rh_control_map);
% caxis([0 1]);
% colormap(parula(10));
% shading flat;
% %shading interp;
% ax = gca;
% ax.YDir = 'normal';
% title('RH control share');
% colorbar;

% Tavg
tavg_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        if NARR_landmask(x,y)==1
            percentile_data = squeeze(grid_top50_tavg_percentile(x,y,:,:));
            tavg_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
            
        end
        if NARR_landmask(x,y)==0
            tavg_control_map(x,y) = nan;
        end
    end
end

% subplot(2,2,3);
% pcolor(tavg_control_map);
% caxis([0 1]);
% colormap(parula(10));
% shading flat;
% %shading interp;
% ax = gca;
% ax.YDir = 'normal';
% title('Tavg control share');
% colorbar;

% Tdiff
tdiff_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        if NARR_landmask(x,y)==1
            percentile_data = squeeze(grid_top50_tdiff_percentile(x,y,:,:));
            tdiff_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
            
        end
        if NARR_landmask(x,y)==0
            tdiff_control_map(x,y) = nan;
        end
    end
end

% subplot(2,2,4);
% pcolor(tdiff_control_map);
% caxis([0 1]);
% colormap(parula(10));
% shading flat;
% %shading interp;
% ax = gca;
% ax.YDir = 'normal';
% title('Tdiff control share');
% colorbar;


% % control factors
% rh_control_area = rh_control_map;
% rh_control_area(rh_control_area>=threshold)=1;
% rh_control_area(rh_control_area<threshold)=0;
% 
% tavg_control_area = tavg_control_map;
% tavg_control_area(tavg_control_area>=threshold)=1;
% tavg_control_area(tavg_control_area<threshold)=0;
% 
% tdiff_control_area = tdiff_control_map;
% tdiff_control_area(tdiff_control_area>=threshold)=1;
% tdiff_control_area(tdiff_control_area<threshold)=0;
% 
% wind_control_area = wind_control_map;
% wind_control_area(wind_control_area>=threshold)=1;
% wind_control_area(wind_control_area<threshold)=0;
% 
% subplot(2,4,5);
% pcolor(wind_control_area);
% shading flat;
% ax = gca;
% ax.YDir = 'normal';
% title('Wind control area');
% 
% subplot(2,4,6);
% pcolor(rh_control_area);
% shading flat;
% ax = gca;
% ax.YDir = 'normal';
% title('RH control area');
% 
% subplot(2,4,7);
% pcolor(tavg_control_area);
% shading flat;
% ax = gca;
% ax.YDir = 'normal';
% title('Tavg control area');
% 
% subplot(2,4,8);
% pcolor(tdiff_control_area)
% shading flat;
% ax = gca;
% ax.YDir = 'normal';
% title('Tdiff control area');

%
control_map4 = ones(nx,ny)*0;
control_map4(NARR_landmask==0)=nan;

for x=1:nx
    for y=1:ny
        if rh_control_map(x,y)>tavg_control_map(x,y) && rh_control_map(x,y)>wind_control_map(x,y) && rh_control_map(x,y)>tdiff_control_map(x,y)
            control_map4(x,y)=2;
        end
        if tavg_control_map(x,y)>rh_control_map(x,y) && tavg_control_map(x,y)>wind_control_map(x,y) && tavg_control_map(x,y)>tdiff_control_map(x,y)
            control_map4(x,y)=3;
        end
        if tdiff_control_map(x,y)>wind_control_map(x,y) && tdiff_control_map(x,y)>rh_control_map(x,y) && tdiff_control_map(x,y)>tavg_control_map(x,y)
            control_map4(x,y)=4;
        end
        if wind_control_map(x,y)>rh_control_map(x,y) && wind_control_map(x,y)>tavg_control_map(x,y) && wind_control_map(x,y)>tdiff_control_map(x,y)
            control_map4(x,y)=1;
        end
    end
end

control_map4(control_map4==0)=nan;

figure(2);
clf(2);
pcolor(control_map4);
caxis([0.5 4.5]);
colormap(jet(4));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Climate controls (correct wind direction)');
cbh = colorbar;
cbh.XTick = [1:4];
cbh.XTickLabel = {'wind','RH','Tavg','Tdiff'};

%%
% excluding RH
control_map3 = ones(nx,ny)*0;
control_map3(NARR_landmask==0)=nan;

rh_control_map = zeros(nx, ny);
for x=1:nx
    for y=1:ny
        if rh_control_map(x,y)>tavg_control_map(x,y) && rh_control_map(x,y)>wind_control_map(x,y) && rh_control_map(x,y)>tdiff_control_map(x,y)
            control_map3(x,y)=0;
        end
        if tavg_control_map(x,y)>rh_control_map(x,y) && tavg_control_map(x,y)>wind_control_map(x,y) && tavg_control_map(x,y)>tdiff_control_map(x,y)
            control_map3(x,y)=2;
        end
        if tdiff_control_map(x,y)>wind_control_map(x,y) && tdiff_control_map(x,y)>rh_control_map(x,y) && tdiff_control_map(x,y)>tavg_control_map(x,y)
            control_map3(x,y)=3;
        end
        if wind_control_map(x,y)>rh_control_map(x,y) && wind_control_map(x,y)>tavg_control_map(x,y) && wind_control_map(x,y)>tdiff_control_map(x,y)
            control_map3(x,y)=1;
        end
    end
end

control_map3(control_map3==0)=nan;


figure(3);
clf(3);
pcolor(control_map3);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Climate controls (correct wind direction)');
cbh = colorbar;
cbh.XTick = [1:4];
cbh.XTickLabel = {'wind','Tavg','Tdiff'};