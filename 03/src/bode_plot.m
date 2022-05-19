[omega, gain, phase] = load_csv('../result/gain_phase.csv'); 

pos = get(gcf, 'Position'); 
set(gcf, 'Position', pos + [-50, -50, 50, 50]);
sz = 20;  

subplot(1, 2, 1)
scatter(omega, gain, sz, 'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor', [0 0 1], 'LineWidth', 1.5); 
xlabel('\omega [rad/s]')
ylabel('|G(j\omega)| [m/N]')
set(gca, 'Xscale', 'log')

subplot(1, 2, 2)
scatter(omega, phase, sz, 'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor', [1 0 0], 'LineWidth', 1.5); 
xlabel('\omega [rad/s]')
ylabel('Phase [m/N]')
set(gca, 'Xscale', 'log') 