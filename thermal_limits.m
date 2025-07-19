% thermal_limits.m
% Estimates thermal behavior of propulsion system and warns if overheating

function [final_temp, overheated] = thermal_limits(P, duration_days)
    % Constants
    base_temp = 25;             % starting temperature in °C
    temp_rise_per_watt_day = 0.0025;  % how much temp rises per W per day (empirical)

    % Total temperature rise estimate
    delta_temp = P * duration_days * temp_rise_per_watt_day;

    final_temp = base_temp + delta_temp;

    % Safety threshold
    max_safe_temp = 85; % °C, typical electronics limit

    % Determine if overheated
    overheated = final_temp > max_safe_temp;
end
