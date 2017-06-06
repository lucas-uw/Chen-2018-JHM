# Explanations to the scrips here

- process\_data.m
    This script converts the netCDF file (usually in [time, lat, lon] order) to the MATLAB format (in [time, lat, lon] order). Note this step may be different depending on the MATLAB version, so make sure the converted files are in [time, lat, lon] order.

- collect\_grid\_top50\_info.m
    This script collects the top 50 72-hour precipitation event at each grid.

- calc\_percentile.m
    This script calcluates the CDF curve of each variable at each grid.

- calc\_percentile\_mono.m
    This script modifies the CDF curve obtained above, and makes it monotonically increasing. So the interpolation is possible later.

- calc\_grid\_top50\_percentile.m
    This script takes the atmospheric condition in the 72-hour duration, and maps the condition to percentage values. This is done for every one of 50 events at each grid. The output will be used for climate control calculation in the local directory.


## in the seasonal folder, you can find the scripts used for seasonal calculation. Run the crt_scripts.csh to generate the scripts for other 3 seasons.