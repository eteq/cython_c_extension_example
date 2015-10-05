# cython_c_extension_example
Minimal example of how to write a cython wrapper around a C function

To compile the cython and C code together, type:

$ python setup.py build_ext --inplace

If you are a Mac user, depending on how you have your gcc compiler configured you may need to compile this code via:

$ CC=clang python setup.py build_ext --inplace

Once you've compiled the code, you can open up a python terminal, import the cython module as if it were a python module, and call the find_closest_element_wrapper function. For step-by-step instructions, see tutorial_wrap_c_function_in_python.ipynb.