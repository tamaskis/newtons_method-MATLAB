%==========================================================================
%
% newtons_method  Calculates the root of a differentiable, univariate 
% function using Newton's method.
%
%   root = newtons_method(f,df,x0)
%   root = newtons_method(f,df,x0,TOL)
%   root = newtons_method(f,df,x0,[],imax)
%   root = newtons_method(f,df,x0,TOL,imax)
%   root = newtons_method(__,'all')
%
% See also fzero, bisection_method, secant_method.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-07-24
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] https://tamaskis.github.io/documentation/Newton's%20Method.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) f(x)
%   df      - (function_handle) derivative of f(x)
%   x0      - (1×1) initial guess for root
%   TOL     - (OPTIONAL) (1×1) tolerance
%   imax    - (OPTIONAL) (1×1) maximum number of iterations
%   output  - (OPTIONAL) (char) if specified as 'all', function will return
%             all intermediate root estimates; otherwise, a faster 
%             algorithm is used to only return the converged root
%
% -------
% OUTPUT:
% -------
%   root    - (1×1 or n×1) root of f(x)
%           	--> if "output" is specified as 'all', then "root" will be
%                   a vector, where the first element is the initial guess,
%                   the last element is the converged root, and the other 
%                   elements are intermediate estimates of the root
%               --> otherwise, "root" is a single number storing the
%                   converged root
%
%==========================================================================
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
        if strcmpi(output,'all')
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
        
        % initializes x_new so its scope isn't limited to the while loop
        x_new = 0;
        
        % Newton's method
        i = 1;
        while (err > TOL) && (i < imax)

            % updates estimate of root
            x_new = x_old-f(x_old)/df(x_old);

            % calculates error
            err = abs(x_new-x_old);

            % stores current root estimate for next iteration
            x_old = x_new;

            % increments loop index
            i = i+1;

        end

        % returns converged root
        root = x_new;
      
    end
      
end