% CAPE
clear all;
clc;

season = 'spring';
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_cape_data.mat');
load(strcat('/civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/ERA_12hr_season_filter_',season,'_cape.mat'));
cape_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data_full = squeeze(full_cape_data(:,i,j));
        data = data_full(seasonal_filter==1);
        cape_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        cape_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save(strcat('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/cape/seasonal/',season,'/cape_percentile.mat'), '-v7.3', 'cape_percentile');


% PW
clear all;
clc;

season = 'spring';
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_pw_data.mat');
load(strcat('/civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/ERA_6hr_season_filter_',season,'.mat'));
pw_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data_full = squeeze(full_pw_data(:,i,j));
        data = data_full(seasonal_filter==1);
        pw_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        pw_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save(strcat('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/pw/seasonal/',season,'/pw_percentile.mat'), '-v7.3', 'pw_percentile');


% wind
clear all;
clc;

season = 'spring';
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_wind_data.mat');
load(strcat('/civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/ERA_6hr_season_filter_',season,'.mat'));
wind_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data_full = squeeze(full_wind_data(:,i,j));
        data = data_full(seasonal_filter==1);
        wind_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        wind_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save(strcat('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/wind/seasonal/',season,'/wind_percentile.mat'), '-v7.3', 'wind_percentile');


%% RH
clear all;
clc;

season = 'spring';
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_rh_data.mat');
load(strcat('/civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/ERA_6hr_season_filter_',season,'.mat'));
rh_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data_full = squeeze(full_rh_data(:,i,j));
        data = data_full(seasonal_filter==1);
        rh_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        rh_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save(strcat('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/rh/seasonal/',season,'/rh_percentile.mat'), '-v7.3', 'rh_percentile');


%% Tavg
clear all;
clc;

season = 'spring';
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_tavg_data.mat');
load(strcat('/civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/ERA_6hr_season_filter_',season,'.mat'));
tavg_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data_full = squeeze(full_tavg_data(:,i,j));
        data = data_full(seasonal_filter==1);
        tavg_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        tavg_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save(strcat('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/tavg/seasonal/',season,'/tavg_percentile.mat'), '-v7.3', 'tavg_percentile');

%% Tdiff
clear all;
clc;

season = 'spring';
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_tdiff_data.mat');
load(strcat('/civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/ERA_6hr_season_filter_',season,'.mat'));
tdiff_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data_full = squeeze(full_tdiff_data(:,i,j));
        data = data_full(seasonal_filter==1);
        tdiff_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        tdiff_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save(strcat('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/tdiff/seasonal/',season,'/tdiff_percentile.mat'), '-v7.3', 'tdiff_percentile');
