%--------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Fall 2020
%   Brian L Ruhe, PhD, CP
%
%   LECTURE 1 - INTRODUCTION TO MATLAB
%
%--------------------------------------------------------------------------
%
%   Book: Gilat, A. (2017). MATLAB: An Introduction with Applications, 6th Edition. John Wiley & Sons.
%       Chapter 1+

% 
% Additional Sources: 
%   https://www.mathworks.com/support.html?s_tid=gn_supp
%   https://www.mathworks.com/support/learn-with-matlab-tutorials.html
%   https://www.mathworks.com/help/matlab/getting-started-with-matlab.html
%   https://stackoverflow.com/
%


%% ------------------------------------------------------------------------
%   CONTACT INFO:
%       Brian L Ruhe, PhD, CP
%       email: brian.ruhe@csulb.edu
%       Office: Zoom (link in the Announcement Section of BeachBoard)
%       Office Hours: Thursday, 11:00 AM – 01:00 PM or by appointment
% 
%       Syllabus
%

%% ------------------------------------------------------------------------
%  
%   Weekly Labs (Team of 2 or 3 students, NO MORE THAN 3)
%   
%   Suggested homework problems are posted (not collected)
%
%   The BEST way to learn MATLAB is by doing!
%


%% ------------------------------------------------------------------------
%   OUTLINE 
%
%       Introduction to MATLAB
%       Downloading MATLAB
%       Exploring the MATLAB workspace
%       Defining scalar variables
%       Basic MATLAB commands
%       Using MATLAB as a calculator
%       Writing a MATLAB script
%


%% ------------------------------------------------------------------------
%   INTRODUCTION
%
%       MATLAB = MATrix LABoratory
%
%       Advantages
%           Ease of use (interpreted language)
%               Can be used as scratchpad or with ‘programs’ called m-files or scripts
%           Platform Independence: Windows, Unix, Mac
%           Predefined Functions & Toolboxes
%           Device Independent Plotting
%           Graphical User Interface
% 
%       Disadvantages
%           Slower than compiled languages
%           Cost ? Student Version
% 
%       Environment
%           Fundamental Unit = ARRAY
%           MATLAB Desktop
%           Built-in functions, user-defined functions, and additional toolboxes available
%           Help
%


%% ------------------------------------------------------------------------
%   LET'S GET STARTED!
%
%       The default view contains four main windows
%           Command window
%           Workspace window
%           Current Directory window
%           Command History window
%
%       You can modify the workspace LAYOUT from the Desktop menu
%
%       Check the current directory (CURRENT FOLDER)!!!
%
%       Explore the MATLAB integrated development environment (IDE)
%           Command window
%           Workspace window
%           Current Directory window
%           Command History window
%           Editor Window
%           Figure Window
%           Array Editor
%           Help Window


%% ------------------------------------------------------------------------
%   BASIC COMMANDS
%
%       Scalar arithmetic operations 
%           + (addition)
%           - (subtraction)
%           * (multiplication)
%           / (right division)
%           \ (left division)
%           ^ (exponentiation)
% 
%       Special symbols
%           % (percent sign) Type in the beginning of a line to designate the line as a comment
%           ; (semicolon) Type after a line before hitting the Enter key to omit the display of the output on the command window 
%           pi (lowercase) = stored value of pi 
%           i and j = stored value of ?-1


%% ------------------------------------------------------------------------
%   HIERARCHY OF ARITHMETIC OPERATIONS
% 
%       Follow standard math rules:
%           1. Parentheses from inner to outer
%           2. Exponentials from left-to-right
%           3. Multiplications & Divisions from left-to-right
%           4. Additions & Subtractions from left-to-right
%


%% ------------------------------------------------------------------------
%   NAMING MATLAB VARIABLES & FILES
% 
%       The 1st character must be a letter
%       Use letters, numbers, or _ character
%       No special characters such as a space, comma, colon, apostrophe, #, @ …
%       63 characters maximum
%       Case sensitive 
%       DO NOT use the same name as an existing MATLAB function (WILL LOSE POINTS)
%       Pick meaningful and easy-to-remember names!


%% ------------------------------------------------------------------------
%   BUILT-IN MATLAB FUNCTIONS
% 
%       Functions: An expression which takes one or more inputs to produce a result
%               Generic form: fun_name(input1,[input2a;input2b], …, inputn)
%
%       Many functions use scalar inputs. When an array is input, the array is evaluated element-by-element	
%               Example: y = sin([0 pi/2]) returns y = [0 1]
% 
%       Many functions work for both real and complex variables
%               Example: sqrt(-2) returns 0+1.414i
%
%       Be aware of the syntax of functions (number of input(s), input format, etc.). 
%
%       Use help command (help sqrt) or the help browser for function description.
%
%       For more information on specific built-in functions, use MATLAB Help 


%% ------------------------------------------------------------------------
% MULTIPLE WAYS TO ACCESS MATLAB HELP
%
%       Click Help in the Toolbar
%       doc or helpwin
%       help ______
%       lookfor
%
%       Students can access MATLAB help at anytime in this course (labs, quizzes, and exams)


%% ------------------------------------------------------------------------
%   A HANDFUL OF THE TEN'S OF THOUSANDS OF BUILT-IN MATLAB FUNCTIONS
%
%       sqrt(x):    Returns the square root of x
%       nthroot(x): Returns the nth root of x
%       exp(x):     Returns e to the power of x
%       sin(x),     cos(x), tan(x):  Returns the sine, cosine, or tangent, the angle x must be in RADIANS
%       asin(x),    acos(x), atan(x):  Returns the arcsine, arccosine, or arctangent in RADIANS
%       log(x):     natural log of x
%       abs(x):     Returns the absolute value of x
%       round(x):   Round to the nearest integer
%       floor(x):   Round towards minus infinity
%       ceil(x):    Round towards positive infinity
%       mod(a,b):   Returns a - floor(a./b).*b if y ~= 0 (remainder of a/b)


%% ------------------------------------------------------------------------
%   SPECIAL VALUES
%
%       pi      ? = 3.14159… ( 15 decimals)
%       i, j    ?(-1)
%       Inf     Machine infinity. Division by zero
%       NaN     Not-a-Number. Division of zero by zero
%       clock   Vector [year month day hour minute second]
%       date    Date in char string format (15-Sep-2003)
%       eps     Smallest difference between 2 numbers on computer (eps = 2.2204e-016)
%       ans     special variable used to store the result of an expression if that result is not assigned to a user-defined variable 


%% ------------------------------------------------------------------------
%   FREQUENTLY USED COMMANDS
%
%       clc:                    clear Command Window
%       clf:                    clear Figure Window
%       clear:                  clear all workspace variables
%       clear var1 var2 ...:    clear variables var1 and var2
%       whos:                   list all variables in workspace
%       Ctrl+c:                 abort or interrupt running program


%% ------------------------------------------------------------------------
%   CHANGING THE DISPLAY FORMAT
%
%       format short:            4 digits after decimal (default)
%       format long:            14 digits after decimal
%       format short e:          5 digits + exponent
%       format short g:          5 digits total with or without exponent
%       format long e:          15 digits + exponent
%       format long g:          15 digits total with or without exponent
%       format compact/loose:   Suppress/restore extra line feed


%% ------------------------------------------------------------------------
%   USING MATLAB AS A CALCULATOR
%
% 		x = 2
% 		y = 4;
% 		z = (x+y)*4
% 		a1 = cos(pi)
% 		2.56*w
% 		clc
% 		clear
%
%       (5+2)/2   –vs–   5+2/2
%       (8^2/2)   –vs–   8^(2/2)
%       (x^2 + x^3)/2, where x = 5
%       (exp(3) – exp(2))*pi
%       (x-y)(x2 – y2)(x3 – y3)(x4 + y4), where x = 3 & y = 10
%


%% ------------------------------------------------------------------------
%   HOW MATLAB EXECUTES A COMMAND
%
%       MATLAB Search Path: when user enters a name at the prompt, MATLAB interpreter searches name in following order:
%           1. Looks for variable with that name, and displays contents of variable
%           2. Looks for a build-in function or command and executes it
%           3. Looks for an *.m file with this name in current directory and executes it
%           4. Looks for *.m file with this name in any directory in search path and executes it
%
%       *Never name a variable or an *.m file with the same name as a built-in MATLAB function!!! (WILL LOSE POINTS)
%


%% ------------------------------------------------------------------------
%   SCRIPTS AND CREATING SCRIPTS
%
%       A “script” contains a collection of MATLAB commands that can be edited and executed all at once. 
%       To create a script, open a file editor window (new m-file) and type the commands. 
%
%               r = 5;
%               area_circle = pi * r^2;
%
%
%       Save the file as MyArea.m. To use the script from the Command Window, type the file name (MyArea) 
%       and press Enter. Note that the outputs from a script share the same workspace as the Command Window.


%% ------------------------------------------------------------------------














