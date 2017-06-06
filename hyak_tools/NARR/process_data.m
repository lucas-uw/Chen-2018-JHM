%% cape, pw, wind old_* data are taken from local:/raid/xiaodong.chen/lulcc/data/reanalysis_data/NARR/cape_pw/matlab_stats/full*data.mat and /raid/xiaodong.chen/lulcc/data/reanalysis_data/NARR/w/matlab_stats/full_wind_data.mat
% or follow the logic of RH, Tavg and Tdiff, getting the correct data directly from NetCDF files.
%% BIG IDEA: to have all the data in [time,131,201] format
%% CAPE
clear all;
clc;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/cape/old_full_cape_data.mat');
old_data = full_cape_data;
clear full_cape_data;
full_cape_data = permute(old_data, [1,3,2]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/cape/full_cape_data.mat', '-v7.3', 'full_cape_data');

%% PW
clear all;
clc;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/pw/old_full_pw_data.mat');
old_data = full_pw_data;
clear full_pw_data;
full_pw_data = permute(old_data, [1,3,2]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/pw/full_pw_data.mat', '-v7.3', 'full_pw_data');

%% wind
clear all;
clc;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/wind/old_full_wind_data.mat');
old_data = full_wind_data;
clear full_wind_data;
full_wind_data = permute(old_data, [1,3,2]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/wind/full_wind_data.mat', '-v7.3', 'full_wind_data');

%% RH
clear all;
clc;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/rh/old_full_rh_data.mat');
old_data = full_rh_data;
size(old_data)
clear full_rh_data;
full_rh_data = permute(old_data, [3,2,1]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/rh/full_rh_data.mat', '-v7.3', 'full_rh_data');

%% Tavg
clear all;
clc;
old_data = ncread('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/tavg/tavg.full.nc', 'TMP_221_ISBL');
size(old_data)
full_tavg_data = permute(old_data, [3,2,1]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/tavg/full_tavg_data.mat', '-v7.3', 'full_tavg_data');

%% Tdiff
clear all;
clc;
old_data = ncread('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/tdiff/tdiff.full.nc', 'TMP_221_ISBL');
size(old_data)
full_tdiff_data = permute(old_data, [3,2,1]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/tdiff/full_tdiff_data.mat', '-v7.3', 'full_tdiff_data');

