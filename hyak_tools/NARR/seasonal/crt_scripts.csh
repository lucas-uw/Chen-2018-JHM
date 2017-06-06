#!/usr/bin/csh

sed 's/spring/summer/g' collect_grid_top50_info_spring.m > collect_grid_top50_info_summer.m
sed 's/spring/summer/g' calc_percentile_spring.m > calc_percentile_summer.m
sed 's/spring/summer/g' calc_percentile_mono_spring.m > calc_percentile_mono_summer.m
sed 's/spring/summer/g' calc_grid_top50_percentile_spring.m > calc_grid_top50_percentile_summer.m

sed 's/spring/fall/g' collect_grid_top50_info_spring.m > collect_grid_top50_info_fall.m
sed 's/spring/fall/g' calc_percentile_spring.m > calc_percentile_fall.m
sed 's/spring/fall/g' calc_percentile_mono_spring.m > calc_percentile_mono_fall.m
sed 's/spring/fall/g' calc_grid_top50_percentile_spring.m > calc_grid_top50_percentile_fall.m

sed 's/spring/winter/g' collect_grid_top50_info_spring.m > collect_grid_top50_info_winter.m
sed 's/spring/winter/g' calc_percentile_spring.m > calc_percentile_winter.m
sed 's/spring/winter/g' calc_percentile_mono_spring.m > calc_percentile_mono_winter.m
sed 's/spring/winter/g' calc_grid_top50_percentile_spring.m > calc_grid_top50_percentile_winter.m
