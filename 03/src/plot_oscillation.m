
data_path = [ 
              "../data/GroupC-3/problem3/1Hz_10cycles.csv";
              "../data/GroupC-3/problem3/2Hz_10cycles.csv";
              "../data/GroupC-3/problem3/3Hz_10cycles.csv"; 
              "../data/GroupC-3/problem3/3.5Hz_10cycles.csv"; 
              "../data/GroupC-3/problem3/4Hz_10cycles.csv"; 
              "../data/GroupC-3/problem3/5Hz_20cycles.csv"; 
              "../data/GroupC-3/problem3/6Hz_20cycles.csv"; 
              "../data/GroupC-3/problem3/8Hz_20cycles.csv"; 
              "../data/GroupC-3/problem3/10Hz_30cycles.csv"; 
             ]; 

frequency_list = [1, 2, 3, 3.5, 4, 5, 6, 8, 10]; 
omega_list = 2*pi*frequency_list; 
period_list = [1, 1/2, 1/3, 1/3.5, 1/4, 1/5, 1/6, 1/8, 1/10]; 
cycle_numbers = [10, 10, 10, 10, 10, 20, 20, 20, 30]; 

gain_list = []; 
phase_list = []; 

for i=1:length(data_path)
    path = data_path(i); 
    [time, input, output] = load_data(path); 
    explore_indices = find((period_list(i)*8<time)&(time<period_list(i)*9)); 

    time_filtered = time(explore_indices); 
    input_filtered = input(explore_indices); 
    output_filtered = output(explore_indices); 

    [max_output, max_output_index] = max(output_filtered); 
    [max_input, max_input_index] = max(input_filtered); 
    ratio = max_output / max_input; 
    gain = 20*log10(ratio); 
    phase = (180/pi) * omega_list(i) * (time_filtered(max_output_index) - time_filtered(max_input_index)); %phase = omega * delta_t [rad] => (180/pi) * omega * delta_t [degree]
    gain_list = [gain_list, gain]; 
    phase_list = [phase_list, phase]; 

    subplot(3, 3, i)
    hold on 
    plot_wave(time, input, output)
    yyaxis left
    plot(time, input)
    xlabel('Time[s]')
    ylabel('Input[N]')

    yyaxis right
    plot(time, output)
    ylabel('Output[m]')
    yyaxis left 
    scatter(time_filtered(max_input_index), max_input, Color='blue')
    ylim([-8, 8])
    yyaxis right 
    scatter(time_filtered(max_output_index), max_output, Color='black')
    ylim([-0.02, 0.02])
    hold off
    legend(["Input Signal[N]", "Output Signal[m]", "Max Output[m]", "Max Input[N]"], Location="best")
    pos = get(gcf, 'Position'); 
    set(gcf, 'Position', pos + [-50, -50, 50, 50]); 

    fprintf('[%d] | f = %f | omega = %f | gain = %f | phase = %f\n', i, frequency_list(i), omega_list(i), gain, phase)
    
end 

num_data = length(omega_list); 
omega_list = reshape(omega_list, num_data, 1); 
gain_list = reshape(gain_list, num_data, 1); 
phase_list = reshape(phase_list, num_data, 1); 
T = table(omega_list, gain_list, phase_list); 
writetable(T, '../result/gain_phase.csv')
