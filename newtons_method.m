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
%   root = newtons_method(__,'all') returns a vector, where the first
%   element of this vector is the initial guess, all intermediate elements
%   are the intermediate estimates of the root, and the last element is the
%   converged root. This identifier 'all' may be appended to any of the
%   syntaxes used above.
%
% See also fzero
%
% MATLAB Central File Exchange: https://www.mathworks.com/matlabcentral/fileexchange/85735-newton-s-method-newtons_method
% GitHub: https://github.com/tamaskis/newtons_method-MATLAB
%
% See "DOCUMENTATION.pdf" for additional documentation and examples. 
% Examples can also be found in EXAMPLES.m. Both of these files are 
% included with the download.
%
% Copyright (c) 2021 Tamas Kis
% Last Update: 2021-03-24



%% FUNCTION

% INPUT: f - function handle for f(x)
%        df - function handle for f'(x)
%        x0 - initial guess for root
%        TOL - (OPTIONAL) tolerance
%        imax - (OPTIONAL) maximum number of iterations
%        output - if specified as 'all', function will returns all 
%                 intermediate root estimates; otherwise, a faster 
%                 algorithm is used to only return the converged root
% OUTPUT: root - root of f(x)
%          --> if "output" is specified as 'all', then "root" will be a 
%              vector, where the first element is the initial guess, the 
%              last element is the converged root, and the other elements 
%              are intermediate estimates of the root
%          --> otherwise, "root" is a single number storing the converged
%              root
function root = newtons_method(f,df,x0,TOL,imax,output)
    
    % sets default tolerance and maximum number of iterations if not
    % specified by user
    if (nargin < 4) || isempty(TOL)
        TOL = 1e-12;
    end
    if (nargin < 5) || isempty(imax)
        imax = 1e6;
    end
    
    % decides which algorithm to use
    if nargin < 6
        return_all = false;
    else
        if strcmp(output,'all')
            return_all = true;
        else
            return_all = false;
        end
    end
    
    % initializes the error so the loop will be entered
    err = 2*TOL;
    
    % implements algorithm for Newton's method where all intermediate root
    % estimates are also returned
    if return_all
        
        % preallocates x
        x = zeros(imax,1);

        % inputs initial guess for root into x vector
        x(1) = x0;

        % Newton's method
        i = 1;
        while (err > TOL) && (i < imax)

            % updates estimate of root
            x(i+1) = x(i)-f(x(i))/df(x(i));

            % calculates error
            err = abs(x(i+1)-x(i));

            % increments loop index
            i = i+1;

        end
    
        % returns converged root along with intermediate root estimates
        root = x(1:i);

    % implements (faster) algorithm for Newton's method where only the
    % converged root estimate is returned
    else
        
        % sets root estimate at the first iteration of Newton's method as 
        % the initial guess
        x_old = x0;

        % Newton's method
        i = 1;
        while (err > TOL) && (i < imax)

            % updates estimate of root
            x_new = x_old-f(x_old)/df(x_old);

            % calculates error
            err = abs(x_new-x_old);

            % stores updated root estimate for next iteration
            x_old = x_new;

            % increments loop index
            i = i+1;

        end

        % returns root
        root = x_old;
      
    end
      
end
