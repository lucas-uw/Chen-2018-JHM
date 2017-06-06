clear all;
clc;

load('../CONUS_Eta221_32km_landmask.mat');

% year-round
load('../grid_top50_results/grid_top50_cape_results.mat');
load('../grid_top50_results/grid_top50_pw_results.mat');
load('../grid_top50_results/grid_top50_wind_results.mat');

% seasonal
%season = 'winter';
%load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_cape_results.mat'));
%load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_pw_results.mat'));
%load(strcat('../grid_top50_results/seasonal/',season,'/grid_top50_wind_results.mat'));

grid_top50_wind_percentile_fliped = grid_top50_wind_percentile;
clear grid_top50_wind_percentile;
grid_top50_wind_percentile = 1-grid_top50_wind_percentile_fliped;
clear grid_top50_wind_percentile_fliped;

nx = 131;
ny = 201;

%%
%clf(4);

ne = 50;

% CAPE
% params
% the percentile above which the factor is considered as controlling the
% event. Vary: 0-1
percentilec = 0.95; % 0.95
% the percentage of extreme condition (>perc) in the 72hour duration.
percentc = 0.15;  % 0.15
threshold = 0.33;  % 0.33

cape_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        if landmask(x,y)==1
            percentile_data = squeeze(grid_top50_cape_percentile(x,y,:,:));
            cape_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
        end
        if landmask(x,y)==0
            cape_control_map(x,y) = nan;
        end
    end
end

% figure(1);
% clf;
% subplot(2,3,1);
% pcolor(cape_control_map);
% shading flat;
% %shading interp;
% ax = gca;
% ax.YDir = 'normal';
% title('CAPE control share');
% colorbar;

% PW
pw_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        if landmask(x,y)==1
            percentile_data = squeeze(grid_top50_pw_percentile(x,y,:,:));
            pw_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
            
        end
        if landmask(x,y)==0
            pw_control_map(x,y) = nan;
        end
    end
end

% subplot(2,3,2);
% pcolor(pw_control_map);
% shading flat;
% %shading interp;
% ax = gca;
% ax.YDir = 'normal';
% title('PW control share');
% colorbar;

% Wind
wind_control_map = ones(nx,ny)*-9999;

for x=1:nx
    %x
    for y=1:ny
        if landmask(x,y)==1
            percentile_data = squeeze(grid_top50_wind_percentile(x,y,:,:));
            wind_control_map(x,y) = calc_climate_control2(percentile_data, ne, percentilec, percentc);
        end
        if landmask(x,y)==0
            wind_control_map(x,y) = nan;
        end
    end
end

% subplot(2,3,3);
% pcolor(wind_control_map);
% shading flat;
% %shading interp;
% ax = gca;
% ax.YDir = 'normal';
% title('Wind control share');
% colorbar;

% % control factors
cape_control_area = cape_control_map;
cape_control_area(cape_control_area>=threshold)=1;
cape_control_area(cape_control_area<threshold)=0;

pw_control_area = pw_control_map;
pw_control_area(pw_control_area>=threshold)=1;
pw_control_area(pw_control_area<threshold)=0;

wind_control_area = wind_control_map;
wind_control_area(wind_control_area>=threshold)=1;
wind_control_area(wind_control_area<threshold)=0;

% subplot(2,3,4);
% pcolor(cape_control_area);
% shading flat;
% ax = gca;
% ax.YDir = 'normal';
% title('CAPE control area');
% 
% subplot(2,3,5);
% pcolor(pw_control_area);
% shading flat;
% ax = gca;
% ax.YDir = 'normal';
% title('PW control area');
% 
% subplot(2,3,6);
% pcolor(wind_control_area);
% shading flat;
% ax = gca;
% ax.YDir = 'normal';
% title('Wind control area');


% note save data (*_control_area and *_control_map) to
% /raid/xiaodong.chen/lulcc/data/reanalysis_data/NARR/grid_top50_data/grid_top50_climatecontrol_099_06.mat
%
control_map = ones(nx,ny)*0;
control_map(landmask==0)=nan;

for x=1:nx
    for y=1:ny
        if cape_control_map(x,y)>pw_control_map(x,y) && cape_control_map(x,y)>wind_control_map(x,y)
            control_map(x,y)=3;
        end
        if pw_control_map(x,y)>cape_control_map(x,y) && pw_control_map(x,y)>wind_control_map(x,y)
            control_map(x,y)=2;
        end
        if wind_control_map(x,y)>cape_control_map(x,y) && wind_control_map(x,y)>pw_control_map(x,y)
            control_map(x,y)=1;
        end
    end
end

control_map(control_map==0)=nan;

figure(4);
%subplot(2,2,4);
pcolor(control_map);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Climate controls (3 factors) (correct wind direction)');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind', 'PW', 'CAPE'};