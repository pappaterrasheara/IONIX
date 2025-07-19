% save_mission_log.m
% Saves mission data to /data/output_logs/

function save_mission_log(P, eta, Isp, duration_days, thrust, propellant_used, final_temp, overheated, mission_name)
    % Generate timestamp
    timestamp = datetime(datetime("now"), 'yyyy-mm-dd_HH-MM-SS');

    % Clean mission name
    mission_id = strrep(lower(mission_name), ' ', '_');

    % Create log folder path
    folder_path = fullfile('data', 'output_logs');

    % Ensure the folder exists
    if ~exist(folder_path, 'dir')
        mkdir(folder_path);
    end

    % Create filename
    filename = fullfile(folder_path, ...
        ['mission_log_' mission_id '_' timestamp '.txt']);

    % Write the log
    fid = fopen(filename, 'w');
    fprintf(fid, '🚀 IONIX Mission Log\n');
    fprintf(fid, 'Generated: %s\n', timestamp);
    fprintf(fid, '--------------------------\n');
    fprintf(fid, 'Mission Profile: %s\n', mission_name);
    fprintf(fid, '\n--- INPUTS ---\n');
    fprintf(fid, 'Power Input: %.2f W\n', P);
    fprintf(fid, 'Efficiency: %.2f\n', eta);
    fprintf(fid, 'Specific Impulse: %.2f s\n', Isp);
    fprintf(fid, 'Mission Duration: %.2f days\n', duration_days);
    fprintf(fid, '\n--- RESULTS ---\n');
    fprintf(fid, 'Thrust Output: %.4f N\n', thrust);
    fprintf(fid, 'Propellant Used: %.2f kg\n', propellant_used);
    fprintf(fid, 'Final Temperature: %.2f °C\n', final_temp);
    if overheated
        fprintf(fid, 'THERMAL STATUS: OVERHEATED ⚠️\n');
    else
        fprintf(fid, 'THERMAL STATUS: SAFE ✅\n');
    end
    fclose(fid);

    fprintf('\n🗂️ Log saved to: %s\n', filename);
end
