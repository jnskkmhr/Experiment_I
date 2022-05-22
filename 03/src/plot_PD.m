data_path = [ 
              "../data/GroupC-3/problem4/kp0.1_kd0.csv";
              "../data/GroupC-3/problem4/kp0.5_kd0.csv";
              "../data/GroupC-3/problem4/kp1.0_kd0.csv"; 
              "../data/GroupC-3/problem4/kp1.5_kd0.csv";
              "../data/GroupC-3/problem4/kp1.0_kd0.001.csv"; 
              "../data/GroupC-3/problem4/kp1.0_kd0.005.csv"; 
              "../data/GroupC-3/problem4/kp1.0_kd0.01.csv"; 
              "../data/GroupC-3/problem4/kp1.0_kd0.02.csv"; 
             ]; 
data_hover = [
                "K_P=0.1"; 
                "K_P=0.5"; 
                "K_P=1.0"; 
                "K_P=1.5"; 
                "K_P=1.0, K_D=0.001"; 
                "K_P=1.0, K_D=0.005"; 
                "K_P=1.0, K_D=0.01"; 
                "K_P=1.0, K_D=0.02"; 
             ]; 

for i=1:length(data_path)
    [time, des_pos, input, output] = load_data(data_path(i)); 
    subplot(2, 4, i)
    
    hold on 
    plot(time, des_pos, Color="black")
    plot(time, output, Color="red")
    xlabel("Time [s]")
    ylabel("Position [m]")
    ylim([-0.02, 0.02])
    hold off 
    legend(["Input", "Output"], location='southeast')

    pos = get(gcf, 'Position'); 
    set(gcf, 'Position', pos + [-30, -10, 30, 10]); 
    t = text(0.5, -0.008, data_hover(i)); 
    t.FontSize=8; 
end 