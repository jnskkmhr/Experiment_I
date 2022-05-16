import matplotlib.pyplot as plt 
import numpy as np 
import json 
import argparse
import os

def boolean_string(s):
    if s not in {'False', 'True'}:
        raise ValueError('Not a valid boolean string')
    return s == 'True'

def load_json(file): 
    with open(file, 'r') as f: 
        data = json.load(f)
    return data 

def plot_data(data, v_lim, digit_lim, save_dir, v_asx): 
    plt.rcParams['font.family'] = 'Times New Roman' #全体のフォントを設定
    if v_asx: 
        # figure1 
        plt.figure()
        data1 = data['P1']
        analog_I = data1['analogI']
        analog_I.sort()
        digital_O = data1['digitalO']
        digital_O.sort()
        assert len(analog_I) == len(digital_O)
        plt.scatter(analog_I, digital_O, color='red', label='1st Data')
        plt.plot(analog_I, digital_O, color='red', linestyle='--')
        plt.xlabel('Input[V]')
        plt.ylabel('Output[digit]')
        plt.xlim(-v_lim, v_lim)
        plt.ylim(-digit_lim, digit_lim)
        savepath1 = os.path.join(save_dir, 'P1.png')
        plt.legend(loc='upper left')
        plt.savefig(savepath1)

        # figure2
        plt.figure()
        data1 = data['P1']
        analog_I = data1['analogI']
        analog_I.sort()
        digital_O = data1['digitalO']
        digital_O.sort()
        assert len(analog_I) == len(digital_O)
        plt.scatter(analog_I, digital_O, color='gray', label='1st Data')
        plt.plot(analog_I, digital_O, color='gray', linestyle='--')
        plt.legend()

        data2 = data['P2']
        analog_I = data2['analogI']
        analog_I.sort()
        digital_O = data2['digitalO']
        digital_O.sort()
        assert len(analog_I) == len(digital_O)
        plt.scatter(analog_I, digital_O, color='red', label='2nd Data')
        plt.xlabel('Input[V]')
        plt.ylabel('Output[digit]')
        plt.xlim(-v_lim, v_lim)
        plt.ylim(-digit_lim, digit_lim)
        savepath2 = os.path.join(save_dir, 'P2.png')
        plt.legend()
        plt.savefig(savepath2)
        plt.show()
    else: 
        # digit as x cordinate 
        # figure1 
        plt.figure()
        data1 = data['P1']
        analog_I = data1['analogI']
        analog_I.sort()
        digital_O = data1['digitalO']
        digital_O.sort()
        assert len(analog_I) == len(digital_O)
        plt.scatter(digital_O, analog_I, color='red', label='1st Data')
        plt.plot(digital_O, analog_I, color='red', linestyle='--')
        plt.legend(loc='upper left')
        plt.xlabel('Input[digit]')
        plt.ylabel('Output[V]')
        plt.ylim(-v_lim, v_lim)
        plt.xlim(-digit_lim, digit_lim)
        savepath1 = os.path.join(save_dir, 'P1.png')
        plt.savefig(savepath1)

        # figure2 
        plt.figure()
        data1 = data['P1']
        analog_I = data1['analogI']
        analog_I.sort()
        digital_O = data1['digitalO']
        digital_O.sort()
        assert len(analog_I) == len(digital_O)
        plt.scatter(digital_O, analog_I, color='gray', label='1st Data')
        plt.plot(digital_O, analog_I, color='gray', linestyle='--')
        data2 = data['P2']
        analog_I = data2['analogI']
        analog_I.sort()
        digital_O = data2['digitalO']
        digital_O.sort()
        assert len(analog_I) == len(digital_O)
        plt.scatter(digital_O, analog_I, color='red', label='2nd Data')
        plt.xlabel('Input[digit]')
        plt.ylabel('Output[V]')
        plt.ylim(-v_lim, v_lim)
        plt.xlim(-digit_lim, digit_lim)
        savepath2 = os.path.join(save_dir, 'P2.png')
        plt.legend()
        plt.savefig(savepath2)
        plt.show()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--data', '-d', 
        type=str, required=True, 
        help='path to data file')
    parser.add_argument(
        '--savedir', '-s', 
        type=str, required=True, 
        help='save path of graph image')
    parser.add_argument(
        '--vasx', '-v', 
        type=boolean_string, default=True, 
        required=True, help='if v as x cordinate or not')
    args = parser.parse_args()

    print('----------------------')
    print('INTERFACE')
    print('datadir', args.data)
    print('savedir', args.savedir)
    print('v_as_x', args.vasx)
    print('----------------------')

    data = load_json(args.data)
    vlim = 8
    dlim = 2500
    save_dir = args.savedir 
    vasx = args.vasx
    plot_data(data, vlim, dlim, save_dir, vasx)
