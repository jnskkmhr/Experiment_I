data_path = "../data/GroupC-3/problem3/free_vibration.csv"; 
data = readmatrix(data_path); 
data = data(:, [1 2 5 10]); 

time = data(:, 1); 
pos = data(:, 4); 
pos = pos / 227000; % count値から位置[m]へ変換

plot(time, pos)
xlabel('Time[s]')
ylabel('Position[m]')
legend("Free vibration"); 