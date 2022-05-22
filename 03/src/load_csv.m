function [omega, gain, phase] = load_csv(data_path)
    data = readmatrix(data_path); 
    omega = data(:, 1);
    gain = data(:, 3); 
    phase = data(:, 5); 