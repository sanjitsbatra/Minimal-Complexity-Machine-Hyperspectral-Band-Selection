function prepare_data_mcm( num_bands )

%  [training_data, training_labels, testing_data, testing_labels] = band_selection_mcm( ratio, pos );
%  [xTrain2, xTest2,nW, bands] = Linear_MCM_features(training_data, training_labels, testing_data, testing_labels, 1000);

  load data_salinas.txt
  load bands_mcm_salinas.txt
  selected_bands = bands_mcm;

  test_mat = testing_data( :, selected_bands(:, [1:num_bands] ) );
  train_mat =  training_data( :,  selected_bands(:, [1:num_bands] ) );
%    size(test_mat)
  
  testfl = "test";
  trainfl = "train";
  fid1 = fopen( testfl, "w" );
  fid2 = fopen( trainfl, "w" ) ;

  for i = 1 : rows(test_mat)
      fprintf( fid1, "%d ", testing_labels(i) );
      for z = 1 : columns( test_mat )
	fprintf( fid1, "%d:%f  ", z, test_mat(i, z) );
      end
      fprintf( fid1, "\n" );
  end
  for i = 1 : rows(train_mat)
    fprintf( fid2, "%d ", training_labels(i) );
    for z = 1 : columns( train_mat )
      fprintf( fid2, "%d:%f  ", z, train_mat(i, z) );
    end
    fprintf( fid2, "\n" );
  end

  fclose (fid1);
  fclose (fid2);
  
endfunction