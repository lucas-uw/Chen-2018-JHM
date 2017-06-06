%% CAPE
clear all;
clc;
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_cape_data.mat');
cape_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data = squeeze(full_cape_data(:,i,j));
        cape_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        cape_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/cape/cape_percentile.mat', '-v7.3', 'cape_percentile');

% PW
clear all;
clc;
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_pw_data.mat');
pw_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data = squeeze(full_pw_data(:,i,j));
        pw_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        pw_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/pw/pw_percentile.mat', '-v7.3', 'pw_percentile');


% wind
clear all;
clc;
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_wind_data.mat');
wind_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data = squeeze(full_wind_data(:,i,j));
        wind_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        wind_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/wind/wind_percentile.mat', '-v7.3', 'wind_percentile');

% RH
clear all;
clc;
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_rh_data.mat');
rh_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data = squeeze(full_rh_data(:,i,j));
        rh_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        rh_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/rh/rh_percentile.mat', '-v7.3', 'rh_percentile');


%% Tavg
clear all;
clc;
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_tavg_data.mat');
tavg_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data = squeeze(full_tavg_data(:,i,j));
        tavg_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        tavg_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/tavg/tavg_percentile.mat', '-v7.3', 'tavg_percentile');

%% Tdiff
clear all;
clc;
nx = 256;
ny = 512;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_tdiff_data.mat');
tdiff_percentile = ones(nx,ny,2,1001)*-9999;
for i=1:nx
    i
    for j=1:ny
        data = squeeze(full_tdiff_data(:,i,j));
        tdiff_percentile(i,j,1,:) = prctile(data,(0:0.1:100));
        tdiff_percentile(i,j,2,:) = (0:0.001:1);
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/tdiff/tdiff_percentile.mat', '-v7.3', 'tdiff_percentile');
