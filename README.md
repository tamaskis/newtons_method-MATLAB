# `newtons_method`

Calculates the root of a function using Newton's method.


## Syntax

`root = newtons_method(f,df,x0)`\
`root = newtons_method(f,df,x0,TOL)`\
`root = newtons_method(f,df,x0,[],imax)`\
`root = newtons_method(f,df,x0,TOL,imax)`


## Description

`root = newtons_method(f,df,x0)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `df` is the derivative of <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> (i.e. <img src="https://latex.codecogs.com/svg.latex?f'(x)" title="f'(x)" />) and `x0` is an initial guess of the root. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`root = newtons_method(f,df,x0,TOL)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `df` is the derivative of <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> (i.e. <img src="https://latex.codecogs.com/svg.latex?f'(x)" title="f'(x)" />), `x0` is an initial guess of the root, and `TOL` is the tolerance. The default maximum number of iterations is `imax = 1e6`.

`root = newtons_method(f,df,x0,[],imax)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `df` is the derivative of <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> (i.e. <img src="https://latex.codecogs.com/svg.latex?f'(x)" title="f'(x)" />), `x0` is an initial guess of the root, and `imax` is the maximum number of iterations. The default tolerance is `TOL = 1e-12`.

`root = newtons_method(f,df,x0,TOL,imax)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `df` is the derivative of <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> (i.e. <img src="https://latex.codecogs.com/svg.latex?f'(x)" title="f'(x)" />), `x0` is an initial guess of the root, `TOL` is the tolerance, and `imax` is the maximum number of iterations.


## Examples

Consider the function

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://latex.codecogs.com/svg.latex?f(x)=x^{2}-1" title="f(x)=x^{2}-1" />

To apply Newton's method to find the root(s) of <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" />, we first need to find <img src="https://latex.codecogs.com/svg.latex?f'(x)" title="f'(x)" />.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://latex.codecogs.com/svg.latex?f'(x)=\frac{d}{dx}\left(x^{2}-1\right)=2x" title="f'(x)=\frac{d}{dx}\left(x^{2}-1\right)=2x" />

Next, we enter <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> and <img src="https://latex.codecogs.com/svg.latex?f'(x)" title="f'(x)" /> into MATLAB.

    % f(x) and its derivative
    f = @(x) x^2-1;
    df = @(x) 2*x;
    
Since <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> is a simple function, we can see, by inspection, that it will have two roots at <img src="https://latex.codecogs.com/svg.latex?x\pm1" title="x\pm1" />. Therefore, to find *both* roots using Newton's method, we first use `newtons_method` with an initial guess <img src="https://latex.codecogs.com/svg.latex?x_{0}=-10" title="x_{0}=-10" />, and then use `newtons_method` a second time but with an initial guess <img src="https://latex.codecogs.com/svg.latex?x_{0}=10" title="x_{0}=10" />.

    % finds first root of f(x)=x^2-1 using Newton's method
    root1 = newtons_method(f,df,-10)

    % finds second root of f(x)=x^2-1 using Newton's method
    root2 = newtons_method(f,df,10)

This yields the result

    root1 =

        -1


    root2 =

         1
