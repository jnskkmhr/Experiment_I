function [time, input, output] = load_data(filename)
    data = readmatrix(filename); 
    data = data(:, [1 5 10]); 
    time = data(:, 1); 
    input = data(:, 2); 
    output = data(:, 3); 

    input = 0.0016 * input; 
    output = output / 227000; 