import numpy as np
from distutils.extension import Extension
from distutils.core import setup
from Cython.Build import cythonize

sources = ['convolve_2d.pyx', 'minimal_to_wrap.c']

extension_obj_instance = Extension(name="convolve_2d", sources=sources,
    include_dirs=[np.get_include()])

setup(name="cython_wrapper",ext_modules = cythonize([extension_obj_instance]))
