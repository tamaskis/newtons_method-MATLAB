# `newtons_method` [![View Newton's Method (newtons_method) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/85735-newton-s-method-newtons_method)

Calculates the root of a differentiable, univariate function using Newton's method.


## Syntax

`root = newtons_method(f,df,x0)`\
`root = newtons_method(f,df,x0,opts)`


## Description

`root = newtons_method(f,df,x0)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `df` is the derivative of <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> (i.e. <img src="https://latex.codecogs.com/svg.latex?\inline&space;f'(x)" title="f'(x)" />) and `x0` is an initial guess of the root. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`root = newtons_method(f,df,x0,opts)` does the same as the syntax above, but allows for the specification of optional solver parameters. `opts` is a struct that has the following fields:
   - `imax` &rightarrow; maximum number of iterations
   - `return_all` &rightarrow; all intermediate root estimates are returned if set to `true`; otherwise, only the converged root is returned
   - `TOL` &rightarrow; tolerance
   - `warnings` &rightarrow; `true` if any warnings should be displayed, `false` if not



## Examples and Additional Documentation

   -  See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples. 
   -  See ["Newton_s_Method.pdf"](https://tamaskis.github.io/documentation/Newton_s_Method.pdf) (also included with download) for the technical documentation.
