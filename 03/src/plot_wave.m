function plot_wave(time, input, output)
    yyaxis left
    plot(time, input)
    xlabel('Time[s]')
    ylabel('Input[N]')

    yyaxis right
    plot(time, output)
    ylabel('Output[m]')

%     legend(["Input Signal[N]", "Output Signal[m]"], Location="best")