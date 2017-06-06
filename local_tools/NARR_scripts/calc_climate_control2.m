function control_info = calc_climate_control2(percentile_data, ne, percentilec, percentc)

%ne = length(percentile_data(:,1)); % events
nt = length(percentile_data(1,:)); % duration

ne_valid = 0; % valid storm number
count_controled_event = 0; % # of storms controled by this factor
for e=1:ne
    if max(percentile_data(e,:))>0
        ne_valid = ne_valid + 1;
        count_extreme_condition = 0;
        nt_valid = 0;
        for t=1:nt
            if percentile_data(e,t)>=0
                nt_valid = nt_valid + 1;
            end
            if percentile_data(e,t)>percentilec
                count_extreme_condition = count_extreme_condition + 1;
            end
        end
        if count_extreme_condition/nt_valid>percentc %|| max(squeeze(percentile_data(e,:)))>0.9999
            count_controled_event = count_controled_event + 1;
        end
    end
end
%ne_valid
control_info = count_controled_event/ne_valid;