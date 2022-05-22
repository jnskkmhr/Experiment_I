# Theme03 Linear Control 
この章で行うデータ可視化やゲインや位相を求めるプログラム

データ構造
<br>
-- data
<br> 
   |
<br>
   -- Group{groupname} (これは自分の所属グループのデータを入れる)
<br>
-- src
<br>
   |
<br> 
   -- free_vibration.m
<br>
   |
<br>
   -- load_data.m 
<br>
   |
<br>
   -- load_csv.m 
<br> 
   |
<br>
   -- plot_oscillation.m 
<br> 
   |
<br>
   -- plot_PD.m 
<br> 
   |
<br>
   -- plot_wave.m 
<br>
-- result
<br>
   |
<br> 
   -- 出力グラフのjpgやcsvファイルなどが入っている

## 3-1 : Free Oscillation (自由振動)
自由振動の様子を experiment_I/03/data/{Groupname_dir}/problem3/以下に存在するデータディレクトリ中のcsvファイルから読み込みプロットする

## 3-2 : Forced Oscillation (強制振動) 
同様にdata/以下に存在する各周波数でのゲイン、位相を計算し、ボード線図にする

`plot_oscillation.m` : ゲイン、位相を計算する。このファイルに、角周波数ごとのファイルのパスを記述しているので、各自書き換えて使用する。
`bode_plot.m` : ゲイン、位相を保存した/result/gain_phase.csvのファイルから読み込み、散布図にする。更に、そのうえから最小二乗法(LSM)でフィッティングした曲線を上からプロットする(data/fitting.csvからデータを読み込む)。

## 4-1 : ステップ応答
`plot_PD.m` : PD制御における、目標入力とシステムの出力をグリッド状にプロットするプログラム。参照するデータのパス`data_path`を適宜書き換える。
