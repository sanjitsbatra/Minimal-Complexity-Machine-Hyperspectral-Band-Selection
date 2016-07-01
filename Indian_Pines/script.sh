rm -f out_* plot plot_data_ber plot_data_mcc plot_data_r_ber plot_data_r_mcc
g++ plot_data_indian_pines.cpp -o plot
./plot  results_pca  0.90 15 0.05 > out_pca
./plot  results_jmi  0.90 15 0.05 > out_jmi
./plot  results_mrmr 0.90 15 0.05 > out_mrmr
./plot  results_mcm  0.90 15 0.05 > out_mcm
./plot  results_relief 0.90 15 0.05 > out_relief

octave --silent --eval "script_indian_pines"
