%--------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Section 13/14 Fall 2020
%   Ethan Covington
%
%   LECTURE 2 - Temperature Conversion
%
%--------------------------------------------------------------------------

% clear workspace and command window
clear;clc;

% 1. Prompt user to enter temperature in F
% 2. Read temperature in F (tF)
tF = input('Enter a temperature in F for conversion to Kelvin: ');

% 3. Convert tF to kelvin -> (5/9) * (tF - 32) + 273.15
tk = (5/9) * (tF - 32) + 273.15;

% 4. Output the tempertaure in K (tK)
disp('The temperature in Kelvin is: ');
disp(tk);