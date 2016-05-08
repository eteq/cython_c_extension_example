""" Cython declaration of the C extension. 
"""

cdef extern from "minimal_to_wrap.h":
	void convolve_2d(double ** input_data, double ** kernel, double ** result, int imx, int imy);
