%% Copyright (c) 2021 Tamas Kis

% Examples for using the newtons_method function.



%% SCRIPT SETUP

% clears variables and command window, closes all figures
clear;
clc;
close all;



%% EXAMPLE #1

% f(x) and its derivative
f = @(x) x^2-1;
df = @(x) 2*x;
  
% finds first root of f(x)=x^2-1 using Newton's method
root1 = newtons_method(f,df,-10)

% finds second root of f(x)=x^2-1 using Newton's method
root2 = newtons_method(f,df,10)



%% EXAMPLE #2

% plots the intermediate root estimates for an initial guess of x0 = 10
plot(newtons_method(f,df,10,[],[],'all'),'k*','markersize',9,...
    'linewidth',1.5);
grid on;
xlabel('Iteration','interpreter','latex','fontsize',18);
ylabel('Root Estimate','interpreter','latex','fontsize',18);