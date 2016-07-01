load all_classes_nrmlz_botswana.txt

data_mat = [n1; n2; n3; n4; n5; n6; n7; n8; n9; n10; n11; n12; n13; n14; ];
c = columns( data_mat ); 		% columns
mean = zeros(1, c);			% find mean
for i = 1 : rows( data_mat )
    mean += data_mat(i, :);
end
mean /= rows( data_mat );
cov_mat = zeros(c, c);			% covaraince matrix
for i = 1 : rows( data_mat )
    cov_mat += data_mat(i, :)' * data_mat(i, :);
end
cov_mat /= rows( data_mat );
%imwrite( cov_mat, "cov_mat.jpg" );
[e_vectors , e_values] = eig( cov_mat );
loading_factor = zeros(c, c);
for i = 1 : c
    for j = 1 : c
	loading_factor(i, j) = sqrt( e_values(i, i) ) * e_vectors( i, j );
    end
end
variance = zeros(1, c);
for k = 1 : c
    for i = 1 : c
	variance( k ) += loading_factor( i, k ) * loading_factor( i, k );
    end
end
plot( variance' )
bands_pca = zeros(1, c);
for i = 1 : c
    bands_pca(i) = i;
end
for i = 1 : c-1
    for j = 1 : c - i
      if variance(j) < variance(j+1)
        swap       = variance(j);
        variance(j)   = variance(j+1);
        variance(j+1) = swap;
        
        swap       = bands_pca(j);
        bands_pca(j)   = bands_pca(j+1);
        bands_pca(j+1) = swap;
      end
    end
end
save "bands_pca_botswana.txt" bands_pca
