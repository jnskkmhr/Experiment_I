function [time, des_pos, input, output] = load_data(filename)
    data = readmatrix(filename); 
    data = data(:, [1 2 5 10]); 
    time = data(:, 1); 
    des_pos = data(:, 2); 
    input = data(:, 3); 
    output = data(:, 4); 

    des_pos = des_pos / 227000; 
    input = 0.0016 * input; 
    output = output / 227000; 