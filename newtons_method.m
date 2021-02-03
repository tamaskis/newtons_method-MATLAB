% newtons_method  Calculates the root of a differentiable, univariate 
% function using Newton's method.
%
%   root = newtons_method(f,df,x0) returns the root of a differentiable 
%   function f(x) specified by the function handle f, where df is the 
%   derivative of f(x) (i.e. f'(x)) and x0 is an initial guess of the root.
%   The default tolerance and maximum number of iterations are TOL = 1e-12 
%   and imax = 1e6, respectively.
%
%   root = newtons_method(f,df,x0,TOL) returns the root of a differentiable
%   function f(x) specified by the function handle f, where df is the
%   derivative of f(x) (i.e. f'(x)), x0 is an initial guess of the root, 
%   and TOL is the tolerance. The default maximum number of iterations is 
%   imax = 1e6.
%
%   root = newtons_method(f,df,x0,[],imax) returns the root of a 
%   differentiable function f(x) specified by the function handle f, where
%   df is the derivative of f(x) (i.e. f'(x)), x0 is an initial guess of
%   the root, and imax is the maximum number of iterations. The default 
%   tolerance is TOL = 1e-12.
%
%   root = newtons_method(f,df,x0,TOL,imax) returns the root of a 
%   differentiable function f(x) specified by the function handle f, where
%   df is the derivative of f(x) (i.e. f'(x)), x0 is an initial guess of 
%   the root, TOL is the tolerance, and imax is the maximum number of 
%   iterations.
%
% See also fzero
%
% MATLAB Central File Exchange: https://www.mathworks.com/matlabcentral/fileexchange/85735-newton-s-method-newtons_method
% GitHub: https://github.com/tamaskis/compressible_flow_relations-MATLAB
%
% See "Newton's Method - MATLAB implementation" for additional
% documentation. An example can be found in EXAMPLES_.m. Both of these
% these files are included with the download.
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: f - function handle for f(x)
%        df - function handle for f'(x)
%        x0 - initial guess for root
%        TOL - tolerance (OPTIONAL)
%        imax - maximum number of iterations (OPTIONAL)
% OUTPUT: root - root of f(x)
function root = newtons_method(f,df,x0,TOL,imax)
    
    % sets default tolerance and maximum number of iterations depending on
    % which inputs are specified by user
    if nargin < 4
        TOL = 1e-12;
        imax = 1e6;
    elseif nargin == 4
        imax = 1e6;
    elseif (nargin == 5) && isempty(TOL)
        TOL = 1e-12;       
    end
    
    % initializes the error so the loop will be entered
    err = 2*TOL;
    
    % preallocates x
    x = zeros(imax,1);
    
    % inputs initial guess for root into x vector
    x(1) = x0;

    % Newton's method
    i = 1;
    while (i < imax) && (err > TOL)

        % updates estimate of root
        x(i+1) = x(i)-f(x(i))/df(x(i));
        
        % calculates error
        err = abs(x(i+1)-x(i));

        % increments loop index
        i = i+1;
        
    end
    
    % returns root
    root = x(i);
      
end
