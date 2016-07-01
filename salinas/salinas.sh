
g++ Matthews_correlation_coefficient.cpp -o MCC

rm -f data_salinas.txt bands_* test train model svm_out.txtput accuracy* matthews_correlation_coeff* msr_* 
octave --silent --eval "band_selection_pca"
for RATIO in 0.80 # test ratio
do
  for CLASS in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16  
  do
    rm -f data_salinas.txt bands_jmi_salinas.txt bands_mrmr_salinas.txt bands_relief_salinas.txt
    #  octave --silent --eval "band_selection_feast( $RATIO, $CLASS )"
    octave --silent --eval "band_selection( $RATIO, $CLASS )"
    cp -f data_salinas.txt FEAST
    cd FEAST
    octave --silent --eval "octave_script_salinas"
    mv -f  bands_jmi_salinas.txt bands_mrmr_salinas.txt  bands_relief_salinas.txt ../.
    rm -f data_salinas.txt 
    cd ../.
    for BANDS in  1 2 3 4 5 6 7 8 9 10 13 15 20 25 30 35 40 45 50 # 70 90 100
    do
      echo "class " $CLASS "bands " $BANDS "ratio " $RATIO
      echo "class " $CLASS "bands " $BANDS "ratio " $RATIO >> details_bands_salinas
      cat bands_* >> details_bands_salinas
      octave --silent --eval "prepare_data_pca( $BANDS )"
      for GAMMA in 0.05 #0.001 0.005 0.01 0.05 0.1 0.5 1 5 10
      do
        ./svm-train -h 0 -s 0 -t 2 -c 1000 -g $GAMMA train model > svm_out.txt  
	./svm-predict test model output > accuracy$GAMMA
	./MCC test output train > matthews_correlation_coeff$GAMMA 
	echo pca "bands " $BANDS " ratio " $RATIO " class " $CLASS " gamma " $GAMMA >> results_pca 
	cat matthews_correlation_coeff$GAMMA >> results_pca
        octave --silent --eval "measures_feast"
	cat msr_feast >> results_pca
        rm -f test train model svm_out.txt output accuracy$GAMMA matthews_correlation_coeff$GAMMA msr_feast
      done
      
      octave --silent --eval "prepare_data_jmi( $BANDS )"
      for GAMMA in 0.05 #0.001 0.005 0.01 0.05 0.1 0.5 1 5 10
      do
        ./svm-train -h 0 -s 0 -t 2 -c 1000 -g $GAMMA train model > svm_out.txt 
	./svm-predict test model output > accuracy$GAMMA 
	./MCC test output train > matthews_correlation_coeff$GAMMA 
	echo jmi "bands " $BANDS " ratio " $RATIO " class " $CLASS " gamma " $GAMMA >> results_jmi 
	cat matthews_correlation_coeff$GAMMA >> results_jmi
        octave --silent --eval "measures_feast"
	cat msr_feast >> results_jmi
        rm -f test train model svm_out.txt output accuracy$GAMMA matthews_correlation_coeff$GAMMA msr_feast
      done
      
      octave --silent --eval "prepare_data_mrmr( $BANDS )"
      for GAMMA in 0.05 #0.001 0.005 0.01 0.05 0.1 0.5 1 5 10
      do
        ./svm-train -h 0 -s 0 -t 2 -c 1000 -g $GAMMA train model > svm_out.txt 
	./svm-predict test model output > accuracy$GAMMA
	./MCC test output train > matthews_correlation_coeff$GAMMA
	echo mrmr "bands " $BANDS " ratio " $RATIO " class " $CLASS " gamma " $GAMMA >> results_mrmr
	cat matthews_correlation_coeff$GAMMA >> results_mrmr
        octave --silent --eval "measures_feast"
	cat msr_feast >> results_mrmr
        rm -f test train model svm_out.txt output accuracy$GAMMA matthews_correlation_coeff$GAMMA msr_feast
      done
      
      octave --silent --eval "prepare_data_relief( $BANDS )"
      for GAMMA in 0.05 #0.001 0.005 0.01 0.05 0.1 0.5 1 5 10
      do
        ./svm-train -h 0 -s 0 -t 2 -c 1000 -g $GAMMA train model > svm_out.txt 
	./svm-predict test model output > accuracy$GAMMA 
	./MCC test output train > matthews_correlation_coeff$GAMMA
	echo relief "bands " $BANDS " ratio " $RATIO " class " $CLASS " gamma " $GAMMA >> results_relief 
	cat matthews_correlation_coeff$GAMMA >> results_relief
        octave --silent --eval "measures_feast"
	cat msr_feast >> results_relief
        rm -f test train model svm_out.txt output accuracy$GAMMA matthews_correlation_coeff$GAMMA msr_feast
      done
      
      octave --silent --eval "prepare_data_mcm( $BANDS )"
      for GAMMA in 0.05 #0.001 0.005 0.01 0.05 0.1 0.5 1 5 10
      do
        ./svm-train -h 0 -s 0 -t 2 -c 1000 -g $GAMMA train model > svm_out.txt 
	./svm-predict test model output > accuracy$GAMMA
	./MCC test output train > matthews_correlation_coeff$GAMMA
	echo mcm "bands " $BANDS " ratio " $RATIO " class " $CLASS " gamma " $GAMMA >> results_mcm
	cat matthews_correlation_coeff$GAMMA >> results_mcm
        octave --silent --eval "measures_mcm"
	cat msr_mcm >> results_mcm
        rm -f test train model svm_out.txt output accuracy$GAMMA matthews_correlation_coeff$GAMMA msr_mcm
      done
      
    done
  done
done
rm -f data_salinas.txt data_salinas.txt bands_* test train model svm_out.txt output out accuracy* matthews_correlation_coeff* msr_*
