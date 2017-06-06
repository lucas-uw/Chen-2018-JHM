clear all;
clc;
%%
% run this code, or alternativaly, take them from
% ../control_maps_for_plotting/control_maps_3factors.mat
ne = 50;
percentilec = 0.95;
percentc = 0.15;

control_map_annual = calc_seasonal_dominant_3factor('annual', ne, percentilec, percentc);
control_map_spring = calc_seasonal_dominant_3factor('spring', ne, percentilec, percentc);
control_map_summer = calc_seasonal_dominant_3factor('summer', ne, percentilec, percentc);
control_map_fall = calc_seasonal_dominant_3factor('fall', ne, percentilec, percentc);
control_map_winter = calc_seasonal_dominant_3factor('winter', ne, percentilec, percentc);
%%
figure(1);
clf(1);

subplot(2,1,1);
pcolor(control_map_annual);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('NARR: Year-round');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind', 'PW', 'CAPE'};

subplot(4,2,5);
pcolor(control_map_spring);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Spring');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind', 'PW', 'CAPE'};

subplot(4,2,6);
pcolor(control_map_summer);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Summer');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind', 'PW', 'CAPE'};

subplot(4,2,7);
pcolor(control_map_fall);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Fall');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind', 'PW', 'CAPE'};

subplot(4,2,8);
pcolor(control_map_winter);
caxis([0.5 3.5]);
colormap(parula(3));
shading flat;
ax = gca;
ax.YDir = 'normal';
title('Winter');
cbh = colorbar;
cbh.XTick = [1:3];
cbh.XTickLabel = {'wind', 'PW', 'CAPE'};