%%--------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Section 13/14 Fall 2020
%   Ethan Covington
%
%   Lab 2 - Array & MATLAB Script
%
%--------------------------------------------------------------------------
%%
% Problem 3 Heat Capacitance

%Problem - Calculate the heat capacitance of 
% clear workspace and command window
clear;clc;

% Storing known coefficients
a = 28.883;       % J*K^-1 * mol^-1
b = -0.00157;     % J*K^-1 * mol^-1
c = 8.08 * 10^-6; % J*K^-1 * mol^-1
d = -2.87*10^-9;  % J*K^-1 * mol^-1
% Prompt the user to enter the minimum temperature in  Kelvin
min_temp = input('Enter minimum temperature in Kelvin[K]: ');
% Prompt the user to enter the maximum temperature in Kelvin
max_temp = input('Enter maximum temperature in Kelvin[K]: ');
%Create array of temperatures with an interval of 50 Kelvin
T = (min_temp:50:max_temp);
%Heat capacitance equation
Cp = a + b.*T + c*(T.^2) + d*(T.^3);
% Output the answer
disp(['The values of Heat Capacitance for N2 between temperatures ' num2str(min_temp) ' and ' num2str(max_temp) ' are: ']);
disp(Cp);

%%
% Problem 4 Matrix rotation calculation

% Problem - Caluculate the new vector of a matrix after it have been
% rotated X degrees

%Prompt user to input coord for a [3x1] matrix
Coord_0 = input('Enter 3D [3x1] Vector: ');

%Prompt the user to input the rotation degree
R_theta = input('Enter the rotation angle in degrees: ');

%Rotation matrix defined
R_n = [cosd(R_theta) -sind(R_theta) 0; sind(R_theta) cosd(R_theta) 0; 0 0 1];

%Computing rotation 
final_matrix = R_n * Coord_0;

%Display the answer
disp(['The new vector rotated ' num2str(R_theta) ' degrees about the Z-axis is: ']);
disp(final_matrix);