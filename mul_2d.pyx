import numpy as np

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
    cdef double [::1] c_input, c_result

    # this will only make a copy if the input dtype is not already a double
    inpt = np.array(input_data, dtype=np.double, copy=False)
    result = np.empty(inpt.shape, dtype=inpt.dtype)

    c_input = inpt
    c_result = result

    cython_declaration_module.mul_2d(&c_input[0], &c_result[0], mul, inpt.shape[0], inpt.shape[1])
    
    return result