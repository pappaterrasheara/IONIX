% mission_profile.m
% Returns parameters for a selected electric propulsion mission

function [P, eta, Isp, duration_days] = mission_profile(option)
    switch option
        case 1
            P = 1000;          % watts
            eta = 0.65;        % 65% efficiency
            Isp = 3000;        % s
            duration_days = 180;

        case 2
            P = 1500;
            eta = 0.7;
            Isp = 3200;
            duration_days = 250;

        case 3
            P = 800;
            eta = 0.6;
            Isp = 2900;
            duration_days = 100;

        case 4
            % Signal to use manual input in dashboard_UI
            P = -1;
            eta = -1;
            Isp = -1;
            duration_days = -1;

        otherwise
            error("Unknown mission profile option.");
    end
end
