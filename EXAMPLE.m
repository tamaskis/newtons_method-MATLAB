%% Copyright (c) 2021 Tamas Kis

% Example for using the newtons_method function.

% AUTHOR: Tamas Kis
% LAST MODIFIED: January 15, 2021



%% SCRIPT SETUP

% clears variables and command window, closes all figures
clear;
clc;
close all;



%% EXAMPLE

% f(x) and its derivative
f = @(x) x^2-1;
df = @(x) 2*x;
  
% finds first root of f(x)=x^2-1 using Newton's method
root1 = newtons_method(f,df,-10)

% finds second root of f(x)=x^2-1 using Newton's method
root2 = newtons_method(f,df,10)