clear
load data_salinas.txt
%  bands_cmim = feast( 'cmim', 50, training_data, training_labels );
%  save "bands_cmim_salinas.txt" bands_cmim 

bands_jmi_t = feast( 'jmi', 50, training_data, training_labels );
bands_jmi = bands_jmi_t';
save "bands_jmi_salinas.txt" bands_jmi 

bands_mrmr_t = feast( 'mrmr', 50, training_data, training_labels );
bands_mrmr = bands_mrmr_t';
save "bands_mrmr_salinas.txt" bands_mrmr

bands_relief_t = feast( 'relief', 50, training_data, training_labels );
bands_relief = bands_relief_t';
save "bands_relief_salinas.txt" bands_relief 