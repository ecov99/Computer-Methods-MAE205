%%--------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Section 13/14 Fall 2020
%   Ethan Covington, Gabriel Peregrina, Nicole Cochran
%
%   Lab 4 - Plotting
%
%--------------------------------------------------------------------------
%% ------------------------------------------------------------------------

%Problem 1
clear; clc;

%Defining given variables
v_0 = 345; % m/s
alpha = 52; %degrees
g = 9.81; %m/s^2
t = linspace(0,30); %seconds

%Position functions of projectile
x_t = v_0*cosd(alpha).*t; %meters
y_t = v_0*sind(alpha).*t - 0.5*g*t.^2;%meters

%plotting data points to figure 3
figure(3);
plot(x_t,y_t,'g-','linewidth',2);
xlabel('Distance (m)');
ylabel('Height (m)');
title('\bf{Height vs Distance}');
grid on;

%Calculating polar coordinates
tan_theta = y_t./x_t; %degrees
r_t = sqrt(x_t.^2+y_t.^2); %meters

%plotting polar coordinates
figure(5);
polarplot(tan_theta,r_t, 'm:','linewidth',2);
title('\bf{Polar Coordinates of Projectile}');
grid on;

%% ------------------------------------------------------------------------
%Problem 2
%Create time data points
t2 = linspace(0,6.5); %seconds
%calculating position data points
%v(t) = 0.79*t^5+5.6t^3-13t^2 -24.6*t+6.3
x2_t = 0.79*t2.^5 + 5.6*t2.^3-13*t2.^2 - 24.6.*t2+6.3; %meters
%calculating velocity data points
% v(t) = 3.95*t^4 + 16.8*t^2 - 26*t - 24.6 meters/second
v2_t = 3.95*t2.^4 + 16.8*t2.^2 - 26*t2 - 24.6; %meters/second
%calculating acceleration data points
% a(t) = 15.8*t^3 + 33.6*t - 26 meters/second^2
a2_t = 15.8*t2.^3 + 33.6*t2 - 26; %meters/second^2

%Plotting data points to figure 9
figure(9);
plot( t2, x2_t, 'k-', 'linewidth',3); hold on;
plot( t2, v2_t, 'b--', 'linewidth',3); hold on;
plot( t2, a2_t, 'r:', 'linewidth',3); hold off;

title('\bf{Motion Profile of Particle for 0 <= t <= 6.5 sec}');
grid on;
xlabel('time (s)');
ylabel('x(t) (m),v(t) (m/s),a(t) (m/s^2)');
legend('x(t)', 'v(t)','a(t)','location', 'W');

%plotting data points to figure 7
figure(7);
subplot(3,1,1); %Plot subplot 1
plot( t2, x2_t, 'k-', 'linewidth',3); %Plot in black solid line in subplot 1
title('\bf{Position, Velocity and Acceleration of Particle}');
ylabel('Position (m)'); 
grid on;

subplot(3,1,2); %Plot subplot 2
plot( t2, v2_t, 'b--', 'linewidth',3); %Plot in blue dashed line in subplot 2
ylabel('Veloctiy (m/s)');
grid on;

subplot(3,1,3); %Plot subplot 3
plot( t2, a2_t, 'r:', 'linewidth',3); %Plot in red dotted line in subplot 2
ylabel('Acceleration (m/s^2)');
xlabel('time (s)');
grid on;


