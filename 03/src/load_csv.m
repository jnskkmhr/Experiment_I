function [omega, gain, phase] = load_csv(data_path)
    data = readmatrix(data_path); 
    omega = data(:, 1);
    gain = data(:, 2); 
    phase = data(:, 3); 