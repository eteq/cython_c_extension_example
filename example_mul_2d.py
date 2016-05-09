from __future__ import print_function

import numpy as np
from mul_2d import mul_2d

# this is a square array, so shouldn't be too complicated
a = np.arange(3*3, dtype='double').reshape(3,3)
amul = mul_2d(a, 1.25)
assert np.all(amul == a * 1.25)
print("Finished mul_2d on C-ordered square array")

b = np.array(np.arange(2*3, dtype='double').reshape(3,2))
bmul = mul_2d(b, 3.25)
assert np.all(bmul == b * 3.25)
print("Finished mul_2d on C-ordered non-square array")


c = np.array(b + 1, order='F')
cmul = mul_2d(c, 4.15)
assert np.all(cmul == c * 4.15) # this actually *should* fail, illustrating why non-C-order arrays are dangerous here
print("Finished mul_2d on Fortran-ordered array")
