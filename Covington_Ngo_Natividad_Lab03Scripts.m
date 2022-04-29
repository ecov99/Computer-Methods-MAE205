%%--------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Section 13/14 Fall 2020
%   Ethan Covington, Nathan Ngo, Allen Natividad
%
%   Lab 3 - Working with Scripts & File I/O
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

%Create array of 6 temperatures evenly seperated
T = linspace(775.8,1194.2, 6); %Kelvin
%Heat capacitance equation
Cp = a + b.*T + c*(T.^2) + d*(T.^3);
%Insert Temp and Cp into matrix
output = [T;Cp];

% Output the answer 
fprintf('Heat Capacitance (Cp) Values for CO2\n');
fprintf('T [K] \t\t Cp [J K^-1 mol^-1]\n');
fprintf('%6.1f\t\t%5.3f\n',output);

%%
%Problem 4 - GasCoefficients

%open xlsx file
gas_co = xlsread('GasCoefficients.xlsx');

%Inputing gas_co into variables as vectors
a = gas_co(1:4:end); % J*K^-1 * mol^-1
b = gas_co(2:4:end); % J*K^-1 * mol^-1
c = gas_co(3:4:end); % J*K^-1 * mol^-1
d = gas_co(4:4:end); % J*K^-1 * mol^-1

%Create array of temp values
T = (500:200:1700); %Kelvin
%Heat capacitance equation
Cp_O2 = a(2) + b(2).*T + c(2)*(T.^2) + d(2)*(T.^3);
Cp_H2 = a(3) + b(3).*T + c(3)*(T.^2) + d(3)*(T.^3);
Cp_CO = a(4) + b(4).*T + c(4)*(T.^2) + d(4)*(T.^3);
Cp_CH4 = a(8) + b(8).*T + c(8)*(T.^2) + d(8)*(T.^3);
%Insert Temp and Cp into matrix for output
output = [T; Cp_O2;Cp_H2; Cp_CO; Cp_CH4];
%Open or Create file Lab03Cp.txt
file_ID = fopen('Lab03Cp.txt', 'w');
%Insert table into file
fprintf(file_ID,'Heat Capacitance (Cp) Values [J*K^-1 * mol^-1] for O2, H2, CO, CH4\n');
fprintf(file_ID,'T[K]\t  O2\t\t  H2\t\t  CO\t\t  CH4\n');
fprintf(file_ID,'%4i \t %7.3f\t %7.3f\t %7.3f\t %7.3f\n',output);
%Close file
fclose(file_ID);

