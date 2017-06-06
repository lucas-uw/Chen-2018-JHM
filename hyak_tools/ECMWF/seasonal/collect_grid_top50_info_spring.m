clear all;
clc;

season = 'spring';
load('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/matlab_files/full_rain_data.mat');
load(strcat('/civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/ERA_12hr_season_filter_',season,'_rain.mat'));

nt = 27028;
prec12_72cum = full_rain_data(1:(nt-5),:,:);

for i=2:5
    prec12_72cum = prec12_72cum + full_rain_data(i:(nt-6+i),:,:);
end
clear full_rain_data;

nx = 256;
ny = 512;


max_50_info = ones(nx,ny,50,2)*-9999;
for i=1:nx
    i
    for j=1:ny
        tmp_top50_amount = ones(50,1)*-9999;
        tmp_top50_index = ones(50,1)*-9999;
        [tmp_amount, tmp_index] = sort(squeeze(prec12_72cum(:,i,j).*seasonal_filter(1:27023)), 'descend');
        tmp_top50_amount(1) = tmp_amount(1);
        tmp_top50_index(1) = tmp_index(1);
        k=2;
        count = 2;
        while count<=50 && k<=(nt-5)
            if tmp_amount(k)>0
                qual = 1;
                if min(abs(tmp_top50_index(1:(count-1))-tmp_index(k)))<=6
                    qual = 0;
                end
                if qual==1
                    tmp_top50_amount(count) = tmp_amount(k);
                    tmp_top50_index(count) = tmp_index(k);
                    count = count + 1;
                end
            end
            k = k + 1;
        end
        max_50_info(i,j,:,2) = tmp_top50_amount;
        max_50_info(i,j,:,1) = tmp_top50_index;
    end
end

save(strcat('/civil/shared/ganges/xiaodc/lulcc/data/reanalysis_data/ECMWF/Interim/prec/seasonal/',season,'/',season,'_max50_info.mat'), '-v7.3', 'max_50_info');

