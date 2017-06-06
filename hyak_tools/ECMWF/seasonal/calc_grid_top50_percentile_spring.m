%% CAPE, 3-hr data
clear all;
clc;
nlen = 27028;
dt = 12;
nshots = 72/dt;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_cape_data.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/cape/seasonal/spring/cape_percentile_mono.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/prec/seasonal/spring/spring_max50_info.mat');
grid_top50_cape_percentile = ones(256,512,50,nshots+1)*-9999;
for i=1:256
    i
    for j=1:512
        for e=1:50
            sindex = max_50_info(i,j,e,1);
            if sindex>0 && max_50_info(i,j,e,2)>0
                xx = squeeze(cape_percentile(i,j,1,1:cape_percentile_count(i,j))); % data
                ff = squeeze(cape_percentile(i,j,2,1:cape_percentile_count(i,j))); % percentile
                if sindex+nshots<=nlen
                    cape_data = squeeze(full_cape_data(sindex:(sindex+nshots),i,j));
                    grid_top50_cape_percentile(i,j,e,:) = interp1(xx,ff,cape_data,'nearest');
                end
            end
       end
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/grid_top50_data/seasonal/spring/grid_top50_cape_results_spring.mat', '-v7.3', 'grid_top50_cape_percentile');

%% PW, 3-hr data
clear all;
clc;
nlen = 54056;
dt = 6;
nshots = 72/dt;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_pw_data.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/pw/seasonal/spring/pw_percentile_mono.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/prec/seasonal/spring/spring_max50_info.mat');
grid_top50_pw_percentile = ones(256,512,50,nshots+1)*-9999;
for i=1:256
    i
    for j=1:512
        for e=1:50
            sindex = max_50_info(i,j,e,1);
            if sindex>0 && max_50_info(i,j,e,2)>0
                xx = squeeze(pw_percentile(i,j,1,1:pw_percentile_count(i,j))); % data
                ff = squeeze(pw_percentile(i,j,2,1:pw_percentile_count(i,j))); % percentile
                if sindex*2+nshots<=nlen
                    pw_data = squeeze(full_pw_data((sindex*2):(sindex*2+nshots),i,j));
                    grid_top50_pw_percentile(i,j,e,:) = interp1(xx,ff,pw_data,'nearest');
                end
            end
       end
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/grid_top50_data/seasonal/spring/grid_top50_pw_results_spring.mat', '-v7.3', 'grid_top50_pw_percentile');

%% wind, 3-hr data
clear all;
clc;
nlen = 54056;
dt = 6;
nshots = 72/dt;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_wind_data.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/wind/seasonal/spring/wind_percentile_mono.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/prec/seasonal/spring/spring_max50_info.mat');
grid_top50_wind_percentile = ones(256,512,50,nshots+1)*-9999;
for i=1:256
    i
    for j=1:512
        for e=1:50
            sindex = max_50_info(i,j,e,1);
            if sindex>0 && max_50_info(i,j,e,2)>0
                xx = squeeze(wind_percentile(i,j,1,1:wind_percentile_count(i,j))); % data
                ff = squeeze(wind_percentile(i,j,2,1:wind_percentile_count(i,j))); % percentile
                if sindex*2+nshots<=nlen
                    wind_data = squeeze(full_wind_data((sindex*2):(sindex*2+nshots),i,j));
                    grid_top50_wind_percentile(i,j,e,:) = interp1(xx,ff,wind_data,'nearest');
                end
            end
       end
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/grid_top50_data/seasonal/spring/grid_top50_wind_results_spring.mat', '-v7.3', 'grid_top50_wind_percentile');

%% RH, 3-hr data
clear all;
clc;
nlen = 54056;
dt = 6;
nshots = 72/dt;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_rh_data.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/rh/seasonal/spring/rh_percentile_mono.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/prec/seasonal/spring/spring_max50_info.mat');
grid_top50_rh_percentile = ones(256,512,50,nshots+1)*-9999;
for i=1:256
    i
    for j=1:512
        for e=1:50
            sindex = max_50_info(i,j,e,1);
            if sindex>0 && max_50_info(i,j,e,2)>0
                xx = squeeze(rh_percentile(i,j,1,1:rh_percentile_count(i,j))); % data
                ff = squeeze(rh_percentile(i,j,2,1:rh_percentile_count(i,j))); % percentile
                if sindex*2+nshots<=nlen
                    rh_data = squeeze(full_rh_data((sindex*2):(sindex*2+nshots),i,j));
                    grid_top50_rh_percentile(i,j,e,:) = interp1(xx,ff,rh_data,'nearest');
                end
            end
       end
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/grid_top50_data/seasonal/spring/grid_top50_rh_results_spring.mat', '-v7.3', 'grid_top50_rh_percentile');

%% Tavg, 3-hr data
clear all;
clc;
nlen = 54056;
dt = 6;
nshots = 72/dt;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_tavg_data.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/tavg/seasonal/spring/tavg_percentile_mono.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/prec/seasonal/spring/spring_max50_info.mat');
grid_top50_tavg_percentile = ones(256,512,50,nshots+1)*-9999;
for i=1:256
    i
    for j=1:512
        for e=1:50
            sindex = max_50_info(i,j,e,1);
            if sindex>0 && max_50_info(i,j,e,2)>0
                xx = squeeze(tavg_percentile(i,j,1,1:tavg_percentile_count(i,j))); % data
                ff = squeeze(tavg_percentile(i,j,2,1:tavg_percentile_count(i,j))); % percentile
                if sindex*2+nshots<=nlen
                    tavg_data = squeeze(full_tavg_data((sindex*2):(sindex*2+nshots),i,j));
                    grid_top50_tavg_percentile(i,j,e,:) = interp1(xx,ff,tavg_data,'nearest');
                end
            end
       end
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/grid_top50_data/seasonal/spring/grid_top50_tavg_results_spring.mat', '-v7.3', 'grid_top50_tavg_percentile');

%% Tdiff, 3-hr data
clear all;
clc;
nlen = 54056;
dt = 6;
nshots = 72/dt;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_tdiff_data.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/tdiff/seasonal/spring/tdiff_percentile_mono.mat');
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/prec/seasonal/spring/spring_max50_info.mat');
grid_top50_tdiff_percentile = ones(256,512,50,nshots+1)*-9999;
for i=1:256
    %i
    for j=1:512
        xx = squeeze(tdiff_percentile(i,j,1,1:tdiff_percentile_count(i,j))); % data
        ff = squeeze(tdiff_percentile(i,j,2,1:tdiff_percentile_count(i,j))); % percentile
        for e=1:50
            [i,j,e]
            sindex = max_50_info(i,j,e,1);
            if sindex>0 && max_50_info(i,j,e,2)>0
                if sindex*2+nshots<=nlen
                    tdiff_data = squeeze(full_tdiff_data((sindex*2):(sindex*2+nshots),i,j));
                    grid_top50_tdiff_percentile(i,j,e,:) = interp1(xx,ff,tdiff_data,'nearest');
                end
            end
       end
    end
end
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/grid_top50_data/seasonal/spring/grid_top50_tdiff_results_spring.mat', '-v7.3', 'grid_top50_tdiff_percentile');
