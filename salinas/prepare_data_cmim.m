function prepare_data_cmim( num_bands )
  
  load feast_data_salinas.txt
  load bands_cmim_salinas.txt
  selected_bands = bands_cmim';
  
  test_mat = test_data( :, selected_bands(:, [1:num_bands] ) );
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
  clear;
endfunction
