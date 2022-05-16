import numpy as np 
import matplotlib.pyplot as plt 
import matplotlib

if __name__ == "__main__": 
    # del matplotlib.font_manager.weight_dict['roman']
    plt.rcParams['font.family'] = 'Times New Roman' #全体のフォントを設定
    # matplotlib.font_manager._rebuild()

    analog_d = np.linspace(0, 0.1, 100)
    digital_d = np.arange(0, 229)

    analog_y = 4 * np.sin(2*np.pi*10*analog_d) #横軸は、t[s](continuous variable)
    
    digital_d_list = []
    for i in range(len(digital_d)-1): 
        digital_d_list.append(digital_d[i:i+2])
    digital_y = []
    for i in range(len(digital_d-1)): 
        v = (1696/2) * np.sin(2*np.pi*(10*digital_d[i]/2290))
        digital_y.append(np.array([v, v]))

    plt.figure()
    plt.plot(analog_d, analog_y, color='black')
    plt.xlabel('t[s]', fontsize=10)
    plt.ylabel('Amplitude[V]', fontsize=10)
    plt.savefig('./result/analog_sine.png')

    plt.figure()
    for i, (x, y) in enumerate(zip(digital_d_list, digital_y)): 
        xi = x[0]
        xf = x[1]
        yi = y[0]
        yf = digital_y[i+1][0]
        plt.plot(x, y, color='black')
        plt.plot([xf, xf], [yi, yf], color='black')
    plt.xlabel('Point[-]', fontsize=10)
    plt.ylabel('Amplitude[digit]', fontsize=10)
    plt.savefig('./result/digital_sine.png')
    plt.show()