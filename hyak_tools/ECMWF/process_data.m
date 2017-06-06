%% prec
clear all;
clc;
orig_data = ncread('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/orig_data/ERA_Interim.prec12.global.1979-2015.nc', 'tp');
full_rain_data = permute(orig_data, [3,2,1]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_rain_data.mat','-v7.3', 'full_rain_data');

%% CAPE
clear all;
clc;
orig_data = ncread('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/orig_data/ERA_Interim.cape.global.1979-2015.nc', 'var59');
full_cape_data = permute(orig_data, [3,2,1]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_cape_data.mat','-v7.3', 'full_cape_data');


%% PW
clear all;
clc;
orig_data = ncread('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/orig_data/ERA_Interim.pw.global.1979-2015.nc', 'var136');
full_pw_data = permute(orig_data, [3,2,1]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_pw_data.mat','-v7.3', 'full_pw_data');


%% wind
clear all;
clc;
orig_data = ncread('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/orig_data/ERA_Interim.w700.global.1979-2015.nc', 'var135');
full_wind_data = permute(squeeze(orig_data), [3,2,1]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_wind_data.mat','-v7.3', 'full_wind_data');


%% RH
clear all;
clc;
orig_data = ncread('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/orig_data/ERA_Interim.rh.global.1979-2015.nc', 'var157');
full_rh_data = permute(squeeze(orig_data), [3,2,1]);
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_rh_data.mat','-v7.3', 'full_rh_data');


%% Tavg and Tdiff
clear all;
clc;
orig_data_t500 = ncread('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/orig_data/ERA_Interim.t500.global.1979-2015.nc', 'var130');
orig_data_t850 = ncread('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/orig_data/ERA_Interim.t850.global.1979-2015.nc', 'var130');
data_t500 = permute(orig_data_t500, [3,2,1]);
clear orig_data_t500;
data_t850 = permute(orig_data_t850, [3,2,1]);
clear orig_data_t850;
full_tavg_data = (data_t850 + data_t500)/2;
full_tdiff_data = data_t850 - data_t500;
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_tavg_data.mat','-v7.3', 'full_tavg_data');
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_tdiff_data.mat','-v7.3', 'full_tdiff_data');
