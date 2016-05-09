""" Cython declaration of the C extension. 
"""

cdef extern from "minimal_to_wrap.h":
	void mul_2d(double * input_data, double * result, double mul, int imx, int imy);