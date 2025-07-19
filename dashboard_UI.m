% dashboard_UI.m
% Main user interface for IONIX electric propulsion simulator

function dashboard_UI()
    clc;
    disp("🚀 IONIX Propulsion Simulation Panel");
    disp("====================================");
    
    % --- MISSION PROFILE SELECTION ---
    disp("Choose a mission profile:");
    disp("  1 - LEO Mapper");
    disp("  2 - Mars Scout");
    disp("  3 - Lunar Orbiter");
    disp("  4 - Custom");

    selection = input("Enter option number (1–4): ");
    

    [P, eta, Isp, duration_days] = mission_profile(selection);

    % --- MANUAL INPUTS IF CUSTOM SELECTED ---
    if (selection == 4)
        fprintf("\n🔧 Custom Mission Setup\n");
        P = input("Enter available power (W): ");
        eta = input("Enter thruster efficiency (0–1): ");
        Isp = input("Enter specific impulse (s): ");
        duration_days = input("Enter mission duration (days): ");
    end

    % --- ENGINE CALCULATION ---
    [thrust, propellant_used] = engine_model(P, eta, Isp, duration_days);

    % --- DISPLAY RESULTS ---
    fprintf("\n🛰️ Simulation Results:\n");
    fprintf("  Thrust Output: %.4f N\n", thrust);
    fprintf("  Propellant Used: %.2f kg\n", propellant_used);

    % --- THERMAL LIMIT CHECK ---
    [final_temp, overheated] = thermal_limits(P, duration_days);

    fprintf("\n🌡️ Thermal Check:\n");
    fprintf("  Final Estimated Temperature: %.2f °C\n", final_temp);

    if overheated
        fprintf("  ⚠️ WARNING: System Overheating Risk! Temperature exceeds safe limit.\n");
    else
        fprintf("  ✅ Thermal Status: Safe Operating Range\n");
    end

    % --- PLOTTING ---
    efficiency_graphs(P, eta, Isp, duration_days);

    % --- SAVE MISSION LOG ---
    save_mission_log(P, eta, Isp, duration_days, thrust, propellant_used, final_temp, overheated, selection);

end
