%% --------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Section 13/14 Fall 2020
%   Ethan Covington
%
%   Exam 1
%
%--------------------------------------------------------------------------
%% ------------------------------------------------------------------------
%part (a) tf = 2*v_0*sind(theta)/g = 9.28078 %sec
%% ------------------------------------------------------------------------
%part (b)
clear;clc;
%defining known variables
g = 9.81; %m/s^2
v_0 = 57; %m/s
theta = 53; %degrees
tf = 2*v_0*sind(theta)/g; %sec
t = linspace(0,tf,9);

%Defining height equation
h_t = v_0*t*sind(theta)-(g*t.^2)/2;
s_t = sqrt(v_0^2-2*v_0*g*t*sind(theta)+g^2*t.^2);
%collecting data points for output table 
out = [t;h_t;s_t]';
fprintf('Projectile Height and Speed\n');
fprintf('v0 = %i m/s and theta = %i degrees\n',v_0,theta);
fprintf('Time(sec)\tHeight(m)\tSpeed(m/s)\n');
fprintf('%3.2f\t\t%4.3f\t\t%5.3f\n',out);
%% ------------------------------------------------------------------------
%part c
figure(3);
subplot(3,1,1); %Plot subplot 1
plot(t,h_t, 'b--','linewidth',2);
ylabel('Height [m]');
title('\bf{Height vs Time}');
grid on;

subplot(3,1,2); %Plot subplot 2
plot(t,s_t, 'r:','linewidth',2);
ylabel('Speed [m/s]');
xlabel('Time [s]');
title('\bf{Speed vs Time}');
grid on;
