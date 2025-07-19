% engine_model.m
% Computes thrust and propellant usage for an electric propulsion system

function [thrust, propellant_used] = engine_model(P, eta, Isp, duration_days)
    % Constants
    g0 = 9.81; % Earth's gravity (m/s^2)
    
    % Thrust Equation: T = (2 * P * η) / (g0 * Isp)
    thrust = (2 * P * eta) / (g0 * Isp); % in Newtons

    % Mass flow rate: ṁ = T / (g0 * Isp)
    mass_flow_rate = thrust / (g0 * Isp); % in kg/s

    % Convert duration to seconds
    duration_seconds = duration_days * 24 * 3600;

    % Propellant used = ṁ * t
    propellant_used = mass_flow_rate * duration_seconds;
end