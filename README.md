# `newtons_method`

Calculates the root of a function using Newton's method.


## Syntax

`root = newtons_method(f,df,x0)`\
`root = newtons_method(f,df,x0,TOL)`\
`root = newtons_method(f,df,x0,[],imax)`\
`root = newtons_method(f,df,x0,TOL,imax)`


## Description

`root = secant_method(f,x0)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `df` is the derivative of <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> (i.e. <img src="https://latex.codecogs.com/svg.latex?f'(x)" title="f'(x)" />) and `x0` is an initial guess of the root. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`root = secant_method(f,x0,TOL)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `df` is the derivative of <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> (i.e. <img src="https://latex.codecogs.com/svg.latex?f'(x)" title="f'(x)" />), `x0` is an initial guess of the root, and `TOL` is the tolerance. The default maximum number of iterations is `imax = 1e6`.

`root = secant_method(f,x0,[],imax)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `df` is the derivative of <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> (i.e. <img src="https://latex.codecogs.com/svg.latex?f'(x)" title="f'(x)" />), `x0` is an initial guess of the root, and `imax` is the maximum number of iterations. The default tolerance is `TOL = 1e-12`.

`root = secant_method(f,x0,TOL,imax)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `df` is the derivative of <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> (i.e. <img src="https://latex.codecogs.com/svg.latex?f'(x)" title="f'(x)" />), `x0` is an initial guess of the root, `TOL` is the tolerance, and `imax` is the maximum number of iterations.


## Examples

Generate one random double between <img src="https://latex.codecogs.com/svg.latex?a=-2.3" title="a=-2.3" /> and <img src="https://latex.codecogs.com/svg.latex?b=5.5" title="b=5.5" />.

    X = rand2(-2,5)

    X =

        4.7975
    
Generate one random single between <img src="https://latex.codecogs.com/svg.latex?a=-20.1" title="a=-20.1" /> and <img src="https://latex.codecogs.com/svg.latex?b=-10" title="b=-10" />.

    X = rand2(-20.1,-10,[],'single')

    X =

      single

      -16.4349

Generate a <img src="https://latex.codecogs.com/svg.latex?5\times1" title="5\times1" /> vector of random integers between <img src="https://latex.codecogs.com/svg.latex?a=-100" title="a=-100" /> and <img src="https://latex.codecogs.com/svg.latex?b=100" title="b=100" />.

    X = rand2(-100,100,[5,1],'int')
    
    X =

        19
       -52
        69
        72
        93
        
Generate a <img src="https://latex.codecogs.com/svg.latex?10\times9" title="10\times9" /> matrix of random doubles between <img src="https://latex.codecogs.com/svg.latex?a=37.234" title="a=37.234" /> and <img src="https://latex.codecogs.com/svg.latex?b=49.5869" title="b=49.5869" />.

    X = rand2(37.234,49.5869,[10,9])
    
    X =

       41.5783   48.9087   48.2243   43.9763   46.7629   47.8149   47.2225   48.2973   46.3959
       47.1503   46.3074   42.5047   41.7195   46.2046   40.6686   39.8432   45.5151   47.0909
       46.9132   48.7850   38.0038   47.1557   39.3809   39.4256   43.5242   48.5833   44.3081
       44.1270   40.5826   43.9497   44.0783   47.0463   40.4757   48.9926   42.8177   46.7184
       40.8926   43.8141   40.2850   48.5330   38.2767   41.8502   41.9095   48.3437   41.6195
       45.4862   38.5658   40.4121   47.8212   42.5587   41.1579   38.5179   38.0642   40.4581
       40.5702   46.3256   41.5839   41.9215   46.0455   48.2024   40.3503   44.7134   41.4362
       43.0207   44.6218   39.0554   44.0104   46.5951   38.5645   42.3762   46.8118   44.4298
       42.2302   47.4289   46.2229   41.8135   42.0401   44.5193   41.6703   40.5628   47.1291
       43.9246   48.8710   46.2336   44.8508   46.1935   39.7919   40.5256   48.2572   41.1951


## References

https://www.mathworks.com/help/matlab/math/floating-point-numbers-within-specific-range.html
https://www.mathworks.com/help/matlab/ref/randi.html
