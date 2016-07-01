# include <iostream>
# include <cstdlib>
# include <string>
# include <sstream>
# include <fstream>
# include <cmath>

int main( int argc, char *argv[] )
{

    std::ifstream file1( argv[1] );  // ground truth - test file
    std::ifstream file2( argv[2] );  // result - output file
    std::ifstream file3( argv[3] );  // training file


    if ( !file1 || !file2 || !file3)
    {
        std::cerr << "Cant not open file\n" << std::endl;
        exit(0);
    }

    // ---------------------------------
    std::string line3;
    int p;
    {
        while ( std::getline( file3, line3 ) )
        {
            std::stringstream ss3( line3 );
            int i;
            ss3 >> i;
            if (i == 1) p++;
            else if ( i == -1 ) break;
            else {
                std::cerr << "unexpected\n";
                exit(0);
            }
        }
        std::cout  << "Positive_train_points  " << p << "\t";
    }
    file3.close();
    // --------------------------------
    std::string line1;
    std::string line2;

    unsigned long int tp = 0;
    unsigned long int fp = 0;
    unsigned long int tn = 0;
    unsigned long int fn = 0;

    while ( std::getline( file1, line1 )  && std::getline( file2, line2 ) )
    {
        std::stringstream ss1( line1 );
        std::stringstream ss2( line2 );

        int gt; // ground truth
        int out; // output
        ss1 >> gt;
        ss2 >> out;

        //std::cout << gt << "\t" << out << std::endl;


        if ( gt == 1 && out == 1 ) { tp++; }//std::cout << "tp\n"; }
        if ( gt == -1 && out == 1 ) { fp++; }// std::cout << "fp\n"; }
        if ( gt == -1 && out == -1 ) { tn++; }// std::cout << "tn\n"; }
        if ( gt == 1 && out == -1 ) { fn++; }//std::cout << "fn\n"; }

    }
    file1.close();
    file2.close();

    float a = ( tp + fp );
    float b = ( tp + fn );
    float c = ( tn + fp );
    float d = ( tn + fn );

    std::cout << "Positive_test_points  " << tp + fn << "  "  ;//<< " FP : " << fp << " TN : "
    //         << tn << " FN : " << fn << std::endl;
    //std::cout << "a b c d " << a << " " << b << " " << c << " " << d << std::endl;

    float denominator;
    if ( a != 0 && b != 0 && c != 0 && d != 0 )
    {
        denominator = sqrt( a * b * c * d );
    }
    else
        denominator = 1.0;

    //std::cout << "denominator " << denominator << std::endl;
    //float numerator = (float)( tp * tn) - (float)( fp * fn );
    //std::cout << "numerator " << numerator << std::endl;
    float mcc = ( (float)(tp * tn) -(float)( fp * fn ) )/denominator;

    std::cout << "Matthews_correlation_coefficient  " << mcc << std::endl;
    return mcc;
}
