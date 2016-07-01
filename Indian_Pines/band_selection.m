function band_selection( ratio, pos )

  training_data = [];
  training_labels = [];
  testing_data = [];
  testing_labels = [];
  
  load all_classes_nrmlz_indian_pines.txt
  positive_mat = [];
  negative_mat = [];
  
  if pos == 1
    positive_mat = n1; negative_mat = [ n2; n3; n4; n5; n6; n7; n8; n9; n10; n11; n12; n13; n14; n15; n16 ];
  elseif pos == 2
    positive_mat = n2; negative_mat = [ n1; n3; n4; n5; n6; n7; n8; n9; n10; n11; n12; n13; n14; n15; n16 ];
  elseif pos == 3
    positive_mat = n3; negative_mat = [ n1; n2; n4; n5; n6; n7; n8; n9; n10; n11; n12; n13; n14; n15; n16 ];
  elseif pos == 4
    positive_mat = n4; negative_mat = [ n1; n2; n3; n5; n6; n7; n8; n9; n10; n11; n12; n13; n14; n15; n16 ];
  elseif pos == 5
    positive_mat = n5; negative_mat = [ n1; n2; n3; n4; n6; n7; n8; n9; n10; n11; n12; n13; n14; n15; n16 ];
  elseif pos == 6
    positive_mat = n6; negative_mat = [ n1; n2; n3; n4; n5; n7; n8; n9; n10; n11; n12; n13; n14; n15; n16 ];
  elseif pos == 7
    positive_mat = n7; negative_mat = [ n1; n2; n3; n4; n5; n6; n8; n9; n10; n11; n12; n13; n14; n15; n16 ];
  elseif pos == 8
    positive_mat = n8; negative_mat = [ n1; n2; n3; n4; n5; n6; n7; n9; n10; n11; n12; n13; n14; n15; n16 ];
  elseif pos == 9
    positive_mat = n9; negative_mat = [ n1; n2; n3; n4; n5; n6; n7; n8; n10; n11; n12; n13; n14; n15; n16 ];
  elseif pos == 10
    positive_mat = n10; negative_mat = [ n1; n2; n3; n4; n5; n6; n7; n8; n9; n11; n12; n13; n14; n15; n16 ];
  elseif pos == 11
    positive_mat = n11; negative_mat = [ n1; n2; n3; n4; n5; n6; n7; n8; n9; n10; n12; n13; n14; n15; n16 ];
  elseif pos == 12
    positive_mat = n12; negative_mat = [ n1; n2; n3; n4; n5; n6; n7; n8; n9; n10; n11; n13; n14; n15; n16 ];
  elseif pos == 13
    positive_mat = n13; negative_mat = [ n1; n2; n3; n4; n5; n6; n7; n8; n9; n10; n11; n12; n14; n15; n16 ];
  elseif pos == 14
    positive_mat = n14; negative_mat = [ n1; n2; n3; n4; n5; n6; n7; n8; n9; n10; n11; n12; n13; n15; n16 ];
  elseif pos == 15
    positive_mat = n15; negative_mat = [ n1; n2; n3; n4; n5; n6; n7; n8; n9; n10; n11; n12; n13; n14; n16 ];
  elseif pos == 16
    positive_mat = n16; negative_mat = [ n1; n2; n3; n4; n5; n6; n7; n8; n9; n10; n11; n12; n13; n14; n15 ];
  end

%    training_labels = [];
%    training_data = [];
%    testing_labels = [];
%    testing_data = [];
  
  for i = 1 : rows(positive_mat)
      a = unifrnd(0, 1);
      if a >= ratio
        training_data = [ training_data; positive_mat(i, :) ];
        training_labels = [ training_labels; 1 ];
      else
	testing_data = [ testing_data; positive_mat(i, :) ];
	testing_labels = [ testing_labels; 1 ];
      end
  end

  if  rows(training_data) < 3
      training_data = [ training_data; positive_mat(1, :) ];
      training_labels = [ training_labels; 1 ];
      training_data = [ training_data; positive_mat(2, :) ];
      training_labels = [ training_labels; 1 ];
      training_data = [ training_data; positive_mat(3, :) ];
      training_labels = [ training_labels; 1 ];
  end

  for i = 1 : rows(negative_mat)
      a = unifrnd(0, 1);
      if a >= ratio
	training_data = [ training_data; negative_mat(i, :) ];
        training_labels = [ training_labels; -1 ];
      else
	testing_data = [ testing_data; negative_mat(i, :) ];
	testing_labels = [ testing_labels; -1 ];
      end
  end

  save "data_indian_pines.txt" training_data testing_data testing_labels training_labels
  [xTrain2, xTest2,nW, bands_mcm] = Linear_MCM_features(training_data, training_labels, testing_data, testing_labels, 1000);
  save "bands_mcm_indian_pines.txt" bands_mcm
  clear
endfunction
