import numpy as np
from astropy.convolution import Gaussian2DKernel

cimport cython_declaration_module

def pow_2d(input_data, power=2):
    """
    takes a 2d image and yields it to a certain power

    Parameters
    ----------
    input_data : array-like
        The input array to power
    power : float
        the power to set the input to

    Returns
    -------
    result : 2D numpy array
        ``input_data`` to the power of ``power``
    """
    cdef double [:, ::1] c_input, c_result

    # this will only make a copy if the input dtype is not already a double
    inpt = np.array(input_data, dtype=np.double, copy=False)
    result = np.empty(inpt.shape, dtype=inpt.dtype)

    c_input = inpt
    c_result = result

    cython_declaration_module.square_2d(&c_input[0], &c_result[0], power, inpt.shape[0], inpt.shape[1])
    
    return result