clear all;
clc;
%%
% run this code, or alternativaly, take them from
% ../control_maps_for_plotting/control_maps_4factors.mat
ne = 50;
percentilec = 0.95;
percentc = 0.15;

[control_map4_annual, control_map3_annual] = calc_seasonal_dominant_4factor('annual', ne, percentilec, percentc);
[control_map4_spring, control_map3_spring] = calc_seasonal_dominant_4factor('spring', ne, percentilec, percentc);
[control_map4_summer, control_map3_summer] = calc_seasonal_dominant_4factor('summer', ne, percentilec, percentc);
[control_map4_fall, control_map3_fall] = calc_seasonal_dominant_4factor('fall', ne, percentilec, percentc);
[control_map4_winter, control_map3_winter] = calc_seasonal_dominant_4factor('winter', ne, percentilec, percentc);

%% map using 4 factors
figure(2);
clf(2);

subplot(2,1,1);
pcolor(lons, lats, control_map4_annual);
caxis([0.5 4.5]);
colormap(parula(4));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('ERA-Interim: Year-round');
cbh = colorbar;
cbh.XTick = [1:4];
cbh.XTickLabel = {'wind','RH','Tavg','Tdiff'};

subplot(4,2,5);
pcolor(lons, lats, control_map4_spring);
caxis([0.5 4.5]);
colormap(parula(4));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Spring');
cbh = colorbar;
cbh.XTick = [1:4];
cbh.XTickLabel = {'wind','RH','Tavg','Tdiff'};

subplot(4,2,6);
pcolor(lons, lats, control_map4_summer);
caxis([0.5 4.5]);
colormap(parula(4));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Summer');
cbh = colorbar;
cbh.XTick = [1:4];
cbh.XTickLabel = {'wind','RH','Tavg','Tdiff'};

subplot(4,2,7);
pcolor(lons, lats, control_map4_fall);
caxis([0.5 4.5]);
colormap(parula(4));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Fall');
cbh = colorbar;
cbh.XTick = [1:4];
cbh.XTickLabel = {'wind','RH','Tavg','Tdiff'};

subplot(4,2,8);
pcolor(lons, lats, control_map4_winter);
caxis([0.5 4.5]);
colormap(parula(4));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Winter');
cbh = colorbar;
cbh.XTick = [1:4];
cbh.XTickLabel = {'wind','RH','Tavg','Tdiff'};

%% map using 4 factors without RH
figure(3);
clf(3);

subplot(2,1,1);
pcolor(lons, lats, control_map3_annual);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('ERA-Interim: Year-round');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind','Tavg','Tdiff'};

subplot(4,2,5);
pcolor(lons, lats, control_map3_spring);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Spring');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind','Tavg','Tdiff'};

subplot(4,2,6);
pcolor(lons, lats, control_map3_summer);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Summer');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind','Tavg','Tdiff'};

subplot(4,2,7);
pcolor(lons, lats, control_map3_fall);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Fall');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind','Tavg','Tdiff'};

subplot(4,2,8);
pcolor(lons, lats, control_map3_winter);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Winter');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind','Tavg','Tdiff'};