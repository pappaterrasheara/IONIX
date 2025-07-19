% plots/efficiency_graphs.m
% Plots thrust and propellant usage over time

function efficiency_graphs(P, eta, Isp, duration_days)
    g0 = 9.81;

    % Time array in days (1-day resolution)
    t_days = linspace(0, duration_days, 500);
    t_sec = t_days * 24 * 3600;

    % Thrust is constant
    thrust = (2 * P * eta) / (g0 * Isp);

    % Mass flow rate
    mdot = thrust / (g0 * Isp);

    % Propellant over time
    propellant_used = mdot * t_sec;

    % Plot thrust
    subplot(2, 1, 1);
    plot(t_days, thrust * ones(size(t_days)), 'LineWidth', 2);
    xlabel('Time (days)');
    ylabel('Thrust (N)');
    title('Thrust Over Time');
    grid on;

    % Plot propellant usage
    subplot(2, 1, 2);
    plot(t_days, propellant_used, 'r', 'LineWidth', 2);
    xlabel('Time (days)');
    ylabel('Propellant Used (kg)');
    title('Propellant Consumption Over Time');
    grid on;
end
