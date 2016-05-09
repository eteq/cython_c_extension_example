
void mul_2d(double ** input_data, double ** result, double mul, int imx, int imy)
{
    for ( int i=0; i<imx; i++ ) {   
	    for ( int j=0; j<imy; j++ ) {    
	        	result[i][j] = input_data[i][j] * mul;
	        }
    }
}
