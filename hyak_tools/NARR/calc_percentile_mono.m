%% CAPE
clear all;
clc;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/cape/cape_percentile.mat');
in_percentile_orig = cape_percentile;
clear cape_percentile;
out_percentile = ones(131,201,2,1001)*-9999;
out_percentile_count = ones(131,201)*-9999;

for i=1:131
    i
    for j=1:201
        out_percentile(i,j,:,1) = in_percentile_orig(i,j,:,1);
        count = 2;
        for k=2:1001
            if in_percentile_orig(i,j,1,k)>in_percentile_orig(i,j,1,k-1)
                out_percentile(i,j,:,count) = in_percentile_orig(i,j,:,k);
                count = count + 1;
            end
        end
        out_percentile_count(i,j) = count-1;
    end
end
cape_percentile = out_percentile;
cape_percentile_count = out_percentile_count;
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/cape/cape_percentile_mono.mat', '-v7.3', 'cape_percentile', 'cape_percentile_count');


%% PW
clear all;
clc;

load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/pw/pw_percentile.mat');

in_percentile_orig = pw_percentile;
clear pw_percentile;

out_percentile = ones(131,201,2,1001)*-9999;
out_percentile_count = ones(131,201)*-9999;

for i=1:131
    i
    for j=1:201
        out_percentile(i,j,:,1) = in_percentile_orig(i,j,:,1);
        count = 2;
        for k=2:1001
            if in_percentile_orig(i,j,1,k)>in_percentile_orig(i,j,1,k-1)
                out_percentile(i,j,:,count) = in_percentile_orig(i,j,:,k);
                count = count + 1;
            end
        end
        out_percentile_count(i,j) = count-1;
    end
end
pw_percentile = out_percentile;
pw_percentile_count = out_percentile_count;
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/pw/pw_percentile_mono.mat', '-v7.3', 'pw_percentile', 'pw_percentile_count');

%% wind
clear all;
clc;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/wind/wind_percentile.mat');
in_percentile_orig = wind_percentile;
clear wind_percentile;
out_percentile = ones(131,201,2,1001)*-9999;
out_percentile_count = ones(131,201)*-9999;
for i=1:131
    i
    for j=1:201
        out_percentile(i,j,:,1) = in_percentile_orig(i,j,:,1);
        count = 2;
        for k=2:1001
            if in_percentile_orig(i,j,1,k)>in_percentile_orig(i,j,1,k-1)
                out_percentile(i,j,:,count) = in_percentile_orig(i,j,:,k);
                count = count + 1;
            end
        end
        out_percentile_count(i,j) = count-1;
    end
end
wind_percentile = out_percentile;
wind_percentile_count = out_percentile_count;
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/wind/wind_percentile_mono.mat', '-v7.3', 'wind_percentile', 'wind_percentile_count');

%% RH
clear all;
clc;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/rh/rh_percentile.mat');
in_percentile_orig = rh_percentile;
clear rh_percentile;
out_percentile = ones(131,201,2,1001)*-9999;
out_percentile_count = ones(131,201)*-9999;
for i=1:131
    i
    for j=1:201
        out_percentile(i,j,:,1) = in_percentile_orig(i,j,:,1);
        count = 2;
        for k=2:1001
            if in_percentile_orig(i,j,1,k)>in_percentile_orig(i,j,1,k-1)
                out_percentile(i,j,:,count) = in_percentile_orig(i,j,:,k);
                count = count + 1;
            end
        end
        out_percentile_count(i,j) = count-1;
    end
end
rh_percentile = out_percentile;
rh_percentile_count = out_percentile_count;
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/rh/rh_percentile_mono.mat', '-v7.3', 'rh_percentile', 'rh_percentile_count');

%% Tavg
clear all;
clc;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/tavg/tavg_percentile.mat');
in_percentile_orig = tavg_percentile;
clear tavg_percentile;
out_percentile = ones(131,201,2,1001)*-9999;
out_percentile_count = ones(131,201)*-9999;
for i=1:131
    i
    for j=1:201
        out_percentile(i,j,:,1) = in_percentile_orig(i,j,:,1);
        count = 2;
        for k=2:1001
            if in_percentile_orig(i,j,1,k)>in_percentile_orig(i,j,1,k-1)
                out_percentile(i,j,:,count) = in_percentile_orig(i,j,:,k);
                count = count + 1;
            end
        end
        out_percentile_count(i,j) = count-1;
    end
end
tavg_percentile = out_percentile;
tavg_percentile_count = out_percentile_count;
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/tavg/tavg_percentile_mono.mat', '-v7.3', 'tavg_percentile', 'tavg_percentile_count');

%% Tdiff
clear all;
clc;
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/tdiff/tdiff_percentile.mat');
in_percentile_orig = tdiff_percentile;
clear tdiff_percentile;
out_percentile = ones(131,201,2,1001)*-9999;
out_percentile_count = ones(131,201)*-9999;
for i=1:131
    i
    for j=1:201
        out_percentile(i,j,:,1) = in_percentile_orig(i,j,:,1);
        count = 2;
        for k=2:1001
            if in_percentile_orig(i,j,1,k)>in_percentile_orig(i,j,1,k-1)
                out_percentile(i,j,:,count) = in_percentile_orig(i,j,:,k);
                count = count + 1;
            end
        end
        out_percentile_count(i,j) = count-1;
    end
end
tdiff_percentile = out_percentile;
tdiff_percentile_count = out_percentile_count;
save('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/NARR/tdiff/tdiff_percentile_mono.mat', '-v7.3', 'tdiff_percentile', 'tdiff_percentile_count');
