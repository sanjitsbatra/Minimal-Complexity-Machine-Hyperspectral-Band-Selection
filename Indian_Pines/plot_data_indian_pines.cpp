# include <iostream>
# include <cstdlib>
# include <string>
# include <sstream>
# include <fstream>
# include <cmath>
# include <cstring>
# include <cassert>
# include <iomanip>

const int NCLASSES = 16;
const int NBANDS = 19;
const int NRATIO = 5;

int get_band_index( const int band )
{
    //std::cout << band << "\n";
    switch (band)
    {
    case 1: return 0; case 2: return 1; case 3: return 2; case 4: return 3;
    case 5: return 4; case 6: return 5; case 7: return 6; case 8: return 7;
    case 9: return 8; case 10: return 9; case 13: return 10; case 15: return 11;
    case 20: return 12; case 25: return 13; case 30: return 14; case 35: return 15;
    case 40: return 16; case 45: return 17; case 50: return 18;
    //case 5: return 0; case 10: return 1; case 15: return 2; case 20: return 3;
    //case 25: return 4; case 30: return 5; case 35: return 6; case 40: return 7;
    //case 45: return 8; case 50: return 9; case 70: return 10; case 90: return 11;
    //case 100: return 12;
    //case 110: return 12; case 130: return 13; case 150: return 14;
    default :
    {
        std::cerr << "WRONG INDEX\n";
        exit(-1);
    }
    }
}

int get_ratio_index( const float r )
{

     if (r > 0.70 - 1e-3 && r <= 0.70 + 1e-3)     { return 0;  std::cerr << "index is 0\n"; }  // 0.90
    else if (r > 0.75 - 1e-3 && r <= 0.75 + 1e-3) { return 1;  std::cerr << "index is 1\n";}  // 0.92
    else if (r > 0.80 - 1e-3 && r <= 0.80 + 1e-3) { return 2;  std::cerr << "index is 2\n";}  // 0.94
    else if (r > 0.85 - 1e-3 && r <= 0.85 + 1e-3) { return 3;  std::cerr << "index is 3\n";}  // 0.95
    else if (r > 0.90 - 1e-3 && r <= 0.90 + 1e-3) { return 4;  std::cerr << "index is 4\n";}  // 0.96
    //else if (r > 0.95 - 1e-3 && r <= 0.95 + 1e-3) { return 5;  std::cerr << "index is 5\n";}  // 0.98
    { std::cerr << "die\n"; exit(0); }
}

int main( int argc, char *argv[] )
{
    std::ifstream file( argv[1] );
    if ( !file )
    {
        std::cerr << "Cant not open file\n" << std::endl;
        exit(0);
    }
    // plot bands vs MCC for all classes for ratio-RATIO
    const float R =  ::atof( argv[2] );
    const int NB = ::atoi( argv[3] );
    const float GM = ::atof( argv[4] );

    float mcc_table[NBANDS][NCLASSES];
    float ber_table[NBANDS][NCLASSES];
    float dp_table[NBANDS][NCLASSES];

    float mcc_table_r[NRATIO][NCLASSES];
    float ber_table_r[NRATIO][NCLASSES];
    float dp_table_r[NRATIO][NCLASSES];

    for ( int i = 0; i < NBANDS; i++ )
    {
        for ( int j = 0; j < NCLASSES; j++ )
        {
            mcc_table[i][j] = -1000;
            ber_table[i][j] = -1000;
            dp_table[i][j] = -1000;
        }
    }
    for ( int i = 0; i < NRATIO; i++ )
    {
        for ( int j = 0; j < NCLASSES; j++ )
        {
            mcc_table_r[i][j] = -1000;
            ber_table_r[i][j] = -1000;
            dp_table_r[i][j] = -1000;
        }
    }

    std::string line;
    while ( std::getline( file, line ) )
    {
        std::stringstream ss( line );
        int nbands, cls;
        float ratio, mcc, dp, gamma, ber;
        std::string str;
        ss >> str;
        if ( strcmp( str.c_str(), "jmi" ) != 0  && strcmp( str.c_str(), "mrmr" ) != 0
             && strcmp( str.c_str(), "pca" ) != 0 && strcmp( str.c_str(), "cmim" ) != 0
             && strcmp( str.c_str(), "mcm" ) != 0 && strcmp( str.c_str(), "relief" ) != 0 )
        {
            continue;
        }
        else
        {

            ss >> str; assert ( strcmp( str.c_str(), "bands" ) == 0 ); ss >> nbands;
            ss >> str; assert ( strcmp( str.c_str(), "ratio" ) == 0 ); ss >> ratio;
            ss >> str; assert ( strcmp( str.c_str(), "class" ) == 0 ); ss >> cls;
            ss >> str; assert ( strcmp( str.c_str(), "gamma" ) == 0 ); ss >> gamma;
            std::getline( file, line );
            //std::cout << line << "\n";
            std::stringstream ss2( line );
            ss2 >> str; assert ( strcmp( str.c_str(), "Positive_train_points" ) == 0 ); ss2 >> dp;// not to be processed
            ss2 >> str; assert ( strcmp( str.c_str(), "Positive_test_points" ) == 0 ); ss2 >> dp;
            ss2 >> str; assert ( strcmp( str.c_str(), "Matthews_correlation_coefficient" ) == 0 ); ss2 >> mcc;
            std::getline( file, line ); std::stringstream ss3( line ); ss3 >> ber;

            if ( ratio <= R + 1e-3 && ratio >= R - 1e-3 &&
                 gamma <= GM + 1e-3 && gamma >= GM - 1e-3 )
            {
                dp_table[get_band_index(nbands)][cls - 1 ] = dp;
                mcc_table[get_band_index(nbands)][cls - 1 ] = mcc;
                ber_table[get_band_index(nbands)][cls - 1 ] = ber;
            }
            if ( nbands == NB && gamma <= GM + 1e-3 && gamma >= GM - 1e-3 )
            {
                dp_table_r[get_ratio_index(ratio)][cls - 1 ] = (float)dp;
                mcc_table_r[get_ratio_index(ratio)][cls - 1 ] = mcc;
                ber_table_r[get_ratio_index(ratio)][cls - 1 ] = ber;
            }

        }
    }
    file.close();

    std::cout << "# name: nbands\n# type: int32 scalar\n" << NBANDS << "\n\n";
    std::cout << "# name: classes\n# type: int32 scalar\n" << NCLASSES << "\n\n";
    std::cout << "# name: nratios\n# type: int32 scalar\n" << NRATIO << "\n\n";
    std::cout << "# name: ratio\n# type: scalar\n" << R << "\n\n";
    std::cout << "# name: band\n# type: int32 scalar\n" << NB << "\n\n";
    std::cout << "# name: mat\n# type: matrix\n# rows: " << NBANDS*2 << "\n# columns: "<< NCLASSES << "\n";
    for ( int i = 0; i < NBANDS; i++ )
    {
        for ( int j = 0; j < NCLASSES; j++ )
        {
            std::cout << std::setw(15) << std::left << mcc_table[i][j] ;
        } std::cout << "\n";
    }
    for ( int i = 0; i < NBANDS; i++ )
    {
        for ( int j = 0; j < NCLASSES; j++ )
        {
            std::cout << std::setw(15) << std::left << dp_table[i][j] ;
        } std::cout << "\n";
    }
    std::cout << "\n\n# name: mat2\n# type: matrix\n# rows: " << NRATIO*2 << "\n# columns: "<< NCLASSES << "\n";
    for ( int i = 0; i < NRATIO; i++ )
    {
        for ( int j = 0; j < NCLASSES; j++ )
        {
            std::cout << std::setw(15) << std::left << mcc_table_r[i][j] ;
        } std::cout << "\n";
    }
    for ( int i = 0; i < NRATIO; i++ )
    {
        for ( int j = 0; j < NCLASSES; j++ )
        {
            std::cout << std::setw(15) << std::left << dp_table_r[i][j] ;
        } std::cout << "\n";
    }
    std::cout << "# name: mat3\n# type: matrix\n# rows: " << NBANDS*2 << "\n# columns: "<< NCLASSES << "\n";
    for ( int i = 0; i < NBANDS; i++ )
    {
        for ( int j = 0; j < NCLASSES; j++ )
        {
            std::cout << std::setw(15) << std::left << ber_table[i][j] ;
        } std::cout << "\n";
    }
    for ( int i = 0; i < NBANDS; i++ )
    {
        for ( int j = 0; j < NCLASSES; j++ )
        {
            std::cout << std::setw(15) << std::left << dp_table[i][j] ;
        } std::cout << "\n";
    }
    std::cout << "\n\n# name: mat4\n# type: matrix\n# rows: " << NRATIO*2 << "\n# columns: "<< NCLASSES << "\n";
    for ( int i = 0; i < NRATIO; i++ )
    {
        for ( int j = 0; j < NCLASSES; j++ )
        {
            std::cout << std::setw(15) << std::left << ber_table_r[i][j] ;
        } std::cout << "\n";
    }
    for ( int i = 0; i < NRATIO; i++ )
    {
        for ( int j = 0; j < NCLASSES; j++ )
        {
            std::cout << std::setw(15) << std::left << dp_table_r[i][j] ;
        } std::cout << "\n";
    }


    return 0;
}
