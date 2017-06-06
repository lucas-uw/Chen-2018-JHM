%% CAPE
clear all;
clc;

load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/cape/full_cape_data.mat');
size(full_cape_data)
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/pw/full_pw_data.mat');
size(full_pw_data)
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/wind/full_wind_data.mat');
size(full_wind_data)

load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/rh/full_rh_data.mat');
size(full_rh_data)
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/tavg/full_tavg_data.mat');
size(full_tavg_data)
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/tdiff/full_tdiff_data.mat');
size(full_tdiff_data)

