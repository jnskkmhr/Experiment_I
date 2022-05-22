[omega, gain, phase] = load_csv('../result/gain_phase.csv'); 

fit_data = readmatrix('../result/fitting.csv'); 
fit_omega = fit_data(:, 1); 
fit_gain = fit_data(:, 5); 
fit_phase = fit_data(:, 7); 

sz = 20;  

subplot(1, 2, 1)
hold on 
scatter(omega, gain, sz, 'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor', [0 0 1], 'LineWidth', 1.5); 
xlabel('Angular frequency \omega [rad/s]')
ylabel('Gain [dB]')
set(gca, 'Xscale', 'log')
% fitting結果を上からのせる
plot(fit_omega, fit_gain, Color='black')
hold off 
legend(["Gain raw data", "LSM fitting curve"])

subplot(1, 2, 2)
hold on 
scatter(omega, phase, sz, 'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor', [1 0 0], 'LineWidth', 1.5); 
xlabel('Angular frequency \omega [rad/s]')
ylabel('Phase [degree]')
% fitting結果を上からのせる
plot(fit_omega, fit_phase, Color='black')
hold off
legend(["Phase raw data", "LSM fitting curve"])

set(gca, 'Xscale', 'log') 
