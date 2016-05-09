import numpy as np
from mul_2d import mul_2d

# this is a square array, so shouldn't be too complicated
a = np.arange(3*3, dtype='double').reshape(3,3)
amul = mul_2d(a, 1.25)
assert np.all(amul == a * 1.25)

b = np.array(np.arange(2*3, dtype='double').reshape(3,2))
bmul = mul_2d(b, 3.25)
assert np.all(bmul == b * 3.25)