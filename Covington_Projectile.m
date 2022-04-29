%--------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Section 13/14 Fall 2020
%   Ethan Covington
%
%   LECTURE 1 - Projectile Script
%
%--------------------------------------------------------------------------

% clear workspace and command window
clear;clc;

% Defining given constants 
v_0 = 199; %m/s
a = 49;    %degrees
g = 9.81;  %m/s^2
t = [0.5, 1.4, 5.9, 7.5, 9.6]; % seconds

% Defining and Calculatiung X and Y equations 
%for the Cartesian x and y positions of the projectile
X_t = v_0 * cosd(a) * t;                  %meters
Y_t = v_0 * sind(a) * t - 0.5 * g * t.^2; %meters

% Defining and calculating polar coords
r_t = sqrt(X_t.^2 + Y_t.^2); %meters
theta_t = atan2d(Y_t,X_t);   %degrees        


