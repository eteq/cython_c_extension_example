import numpy as np
cimport numpy as cnp
from libc.stdlib cimport malloc, free


cimport cython_declaration_module

def mul_2d(input_data, mul=2):
    """
    takes a 2d image and yields it multiplied by something

    Parameters
    ----------
    input_data : array-like
        The input array to multiply
    mul : float
        the number to multiply by

    Returns
    -------
    result : 2D numpy array
        ``input_data`` multiplied by ``mul``
    """
    cdef cnp.ndarray[double, ndim=2] c_input, c_result

    # this will only make a copy if the input dtype is not already a double
    inpt = np.array(input_data, dtype=np.double, copy=True)
    result = np.empty(inpt.shape, dtype=inpt.dtype)

    c_input = inpt
    c_result = result

    cdef double** inptr = sing_to_dbl_ptr(&c_input[0,0], inpt.shape[0], inpt.shape[1])
    cdef double** resptr = sing_to_dbl_ptr(&c_result[0,0], inpt.shape[0], inpt.shape[1])

    cython_declaration_module.mul_2d(inptr, resptr, mul, inpt.shape[0], inpt.shape[1])

    free(inptr)
    free(resptr)
    
    return result


cdef double ** sing_to_dbl_ptr(double * ptr, int sz1, int sz2):
    cdef double ** resptr = <double **>malloc(sz1 * sizeof(double*))

    for i in range(sz1):
        resptr[i] = &ptr[i*sz2]

    return resptr