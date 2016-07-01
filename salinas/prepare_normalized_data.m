clc 
clear
load Salinas_corrected.mat
load Salinas_gt.mat
sz_ip = size(salinas_corrected);

fid_0 = fopen( "0", "w" );
fid_1 = fopen( "1", "w" );
fid_2 = fopen( "2", "w" );
fid_3 = fopen( "3", "w" );
fid_4 = fopen( "4", "w" );
fid_5 = fopen( "5", "w" );
fid_6 = fopen( "6", "w" );
fid_7 = fopen( "7", "w" );
fid_8 = fopen( "8", "w" );
fid_9 = fopen( "9", "w" );
fid_10 = fopen( "10", "w" );
fid_11 = fopen( "11", "w" );
fid_12 = fopen( "12", "w" );
fid_13 = fopen( "13", "w" );
fid_14 = fopen( "14", "w" );
fid_15 = fopen( "15", "w" );
fid_16 = fopen( "16", "w" );

for x = 1 : sz_ip(1) 
    for y = 1 : sz_ip(2) 
	if( salinas_gt( x, y ) == 0 )
	    for z = 1 : sz_ip(3)   
	        fprintf( fid_0, "%f  ",  salinas_corrected(x, y, z) );   
	    end
	    fprintf( fid_0, "\n" );
	end
	if( salinas_gt( x, y ) == 1 )
	    for z = 1 : sz_ip(3)   fprintf( fid_1, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_1, "\n" );
	end
	if( salinas_gt( x, y ) == 2 )
	    for z = 1 : sz_ip(3)   fprintf( fid_2, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_2, "\n" );
	end
	if( salinas_gt( x, y ) == 3 )
	    for z = 1 : sz_ip(3)   fprintf( fid_3, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_3, "\n" );
	end
	if( salinas_gt( x, y ) == 4 )
	    for z = 1 : sz_ip(3)   fprintf( fid_4, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_4, "\n" );
	end
	if( salinas_gt( x, y ) == 5 )
	    for z = 1 : sz_ip(3)   fprintf( fid_5, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_5, "\n" );
	end
	if( salinas_gt( x, y ) == 6 )
	    for z = 1 : sz_ip(3)   fprintf( fid_6, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_6, "\n" );
	end
	if( salinas_gt( x, y ) == 7 )
	    for z = 1 : sz_ip(3)   fprintf( fid_7, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_7, "\n" );
	end
	if( salinas_gt( x, y ) == 8 )
	    for z = 1 : sz_ip(3)   fprintf( fid_8, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_8, "\n" );
	end
	if( salinas_gt( x, y ) == 9 )
	    for z = 1 : sz_ip(3)   fprintf( fid_9, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_9, "\n" );
	end
	if( salinas_gt( x, y ) == 10 )
	    for z = 1 : sz_ip(3)   fprintf( fid_10, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_10, "\n" );
	end
	if( salinas_gt( x, y ) == 11 )
	    for z = 1 : sz_ip(3)   fprintf( fid_11, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_11, "\n" );
	end
	if( salinas_gt( x, y ) == 12 )
	    for z = 1 : sz_ip(3)   fprintf( fid_12, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_12, "\n" );
	end
	if( salinas_gt( x, y ) == 13 )
	    for z = 1 : sz_ip(3)   fprintf( fid_13, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_13, "\n" );
	end
	if( salinas_gt( x, y ) == 14 )
	    for z = 1 : sz_ip(3)   fprintf( fid_14, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_14, "\n" );
	end
        if( salinas_gt( x, y ) == 15 )
	    for z = 1 : sz_ip(3)   fprintf( fid_15, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_15, "\n" );
	end
	if( salinas_gt( x, y ) == 16 )
	    for z = 1 : sz_ip(3)   fprintf( fid_16, "%f  ",  salinas_corrected(x, y, z) );   end
	    fprintf( fid_16, "\n" );
	end
	
    end
end   

fclose( fid_0 );
fclose( fid_1 );
fclose( fid_2 );
fclose( fid_3 );
fclose( fid_4 );
fclose( fid_5 );
fclose( fid_6 );
fclose( fid_7 );
fclose( fid_8 );
fclose( fid_9 );
fclose( fid_10 );
fclose( fid_11 );
fclose( fid_12 );
fclose( fid_13 );
fclose( fid_14 );
fclose( fid_15 );
fclose( fid_16 );

clear
load 0
load 1
load 2
load 3
load 4
load 5
load 6
load 7
load 8
load 9
load 10
load 11
load 12
load 13
load 14
load 15
load 16

for i = 1 : columns(X0)    X0(:, i) = ( X0(:, i) - min(X0(:, i)) ) / ( max(X0(:, i)) - min(X0(:, i)) ); end
for i = 1 : columns(X1)    X1(:, i) = ( X1(:, i) - min(X1(:, i)) ) / ( max(X1(:, i)) - min(X1(:, i)) ); end
for i = 1 : columns(X2)    X2(:, i) = ( X2(:, i) - min(X2(:, i)) ) / ( max(X2(:, i)) - min(X2(:, i)) ); end
for i = 1 : columns(X3)    X3(:, i) = ( X3(:, i) - min(X3(:, i)) ) / ( max(X3(:, i)) - min(X3(:, i)) ); end
for i = 1 : columns(X4)    X4(:, i) = ( X4(:, i) - min(X4(:, i)) ) / ( max(X4(:, i)) - min(X4(:, i)) ); end
for i = 1 : columns(X5)    X5(:, i) = ( X5(:, i) - min(X5(:, i)) ) / ( max(X5(:, i)) - min(X5(:, i)) ); end
for i = 1 : columns(X6)    X6(:, i) = ( X6(:, i) - min(X6(:, i)) ) / ( max(X6(:, i)) - min(X6(:, i)) ); end
for i = 1 : columns(X7)    X7(:, i) = ( X7(:, i) - min(X7(:, i)) ) / ( max(X7(:, i)) - min(X7(:, i)) ); end
for i = 1 : columns(X8)    X8(:, i) = ( X8(:, i) - min(X8(:, i)) ) / ( max(X8(:, i)) - min(X8(:, i)) ); end
for i = 1 : columns(X9)    X9(:, i) = ( X9(:, i) - min(X9(:, i)) ) / ( max(X9(:, i)) - min(X9(:, i)) ); end
for i = 1 : columns(X10)    X10(:, i) = ( X10(:, i) - min(X10(:, i)) ) / ( max(X10(:, i)) - min(X10(:, i)) ); end
for i = 1 : columns(X11)    X11(:, i) = ( X11(:, i) - min(X11(:, i)) ) / ( max(X11(:, i)) - min(X11(:, i)) ); end
for i = 1 : columns(X12)    X12(:, i) = ( X12(:, i) - min(X12(:, i)) ) / ( max(X12(:, i)) - min(X12(:, i)) ); end
for i = 1 : columns(X13)    X13(:, i) = ( X13(:, i) - min(X13(:, i)) ) / ( max(X13(:, i)) - min(X13(:, i)) ); end
for i = 1 : columns(X14)    X14(:, i) = ( X14(:, i) - min(X14(:, i)) ) / ( max(X14(:, i)) - min(X14(:, i)) ); end
for i = 1 : columns(X15)    X15(:, i) = ( X15(:, i) - min(X15(:, i)) ) / ( max(X15(:, i)) - min(X15(:, i)) ); end
for i = 1 : columns(X16)    X16(:, i) = ( X16(:, i) - min(X16(:, i)) ) / ( max(X16(:, i)) - min(X16(:, i)) ); end

n0 = X0;
n1 = X1;
n2 = X2;
n3 = X3;
n4 = X4;
n5 = X5;
n6 = X6;
n7 = X7;
n8 = X8;
n9 = X9;
n10 = X10;
n11 = X11;
n12 = X12;
n13 = X13;
n14 = X14;
n15 = X15;
n16 = X16;
save "all_classes_nrmlz.txt" n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16;
