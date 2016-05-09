
void mul_2d(double * input_data, double * result, double mul, int imx, int imy)
{
    for ( int i=0; i<imx; i++ ) {    
        	result[i] = input_data[i] * mul;
    }
}
