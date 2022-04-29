%% ------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Section 13/14 Fall 2020
%   Ethan Covington, Gabriel Peregrina, David Tolentino
%
%   Lab 5 - Relational and Logical Operators and Branch Constructs 
%
%% ------------------------------------------------------------------------
% part 1
% clear workspace and command window
clear;clc;

number = input('Please enter a number: ');
if mod(number,1) == 0
    fprintf('%i IS an integer\n', number);
else %number is a float
    fprintf('%2.1f is NOT an integer\n', number);
end

%% ------------------------------------------------------------------------
% part 2
% clear workspace and command window
clear;clc;

number = input('Please enter a number: ');
if mod(number,1) == 0
    if mod(number,2) == 0 %If interger is even it is divisable by 2
        fprintf('%i IS an EVEN integer\n', number);
    else %Integer is odd
        fprintf('%i IS an ODD integer\n', number);
    end 
else %number is a float
    fprintf('%2.1f is NOT an integer\n', number);
end

%% ------------------------------------------------------------------------
% part 3
% clear workspace and command window
clear;clc;
%Input
number = input('Please enter a number for Day of the week: ');
%Cell creation
days = {'Sunday','Monday','Tueday','Wednesday','Thursday','Friday','Saturday'};
if mod(number,1) == 0
   if(number >= 1) && (number <= 7)
       fprintf('%s\n',days{number});
   else %number is not between 1-7
       fprintf('%i is NOT an integer between 1 and 7\n', number);
   end  
end  

%% ------------------------------------------------------------------------
% part 4
% clear workspace and command window
clear;clc;

%Prompt user to input coord for a [3x1] matrix
Coord_0 = input('Enter 3D [3x1] Vector: ');

%Prompt the user to input the rotation degree
R_theta = input('Enter the rotation angle in degrees: ');
axis_selection = input('Which axis should be rotated, X, Y, Z: ','s');

switch (axis_selection)
    case {'X','x'}
        % Rotation X matrix
        R_x = [1 0 0;
            0 cosd(R_theta) -sind(R_theta);
            0 sind(R_theta) cosd(R_theta)];
        %Computing rotation
        final_matrix = R_x * Coord_0;
    case {'Y','y'}
        % Rotation Y matrix
        R_y = [cosd(R_theta) 0 sind(R_theta);
            0 1 0;
            -sind(R_theta) 0 cosd(R_theta)];
        %Computing rotation
        final_matrix = R_y * Coord_0;
    case {'Z','z'}
        % Rotation Z matrix
        R_z = [cosd(R_theta) -sind(R_theta) 0;
            sind(R_theta) cosd(R_theta) 0;
            0 0 1];
        %Computing rotation
        final_matrix = R_z * Coord_0;
end


%Display the answer
fprintf('The new vector rotated %i degrees about the %c-axis is: \n',R_theta,axis_selection);
fprintf('%5.4f\n',final_matrix);
