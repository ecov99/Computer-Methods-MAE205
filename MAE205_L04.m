%--------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Fall 2020
%   Brian L Ruhe, PhD, CP
%
%   LECTURE 4 - 2D PLOTTING
%
%--------------------------------------------------------------------------
%
%   Book: Gilat, A. (2017). MATLAB: An Introduction with Applications, 6th Edition. John Wiley & Sons.
%       Chapter 5
%


%% ------------------------------------------------------------------------
%   OUTLINE   
%
%       plot() command for 2D plots
%       Formatting a plot
%       Plotting multiple graphs on a single plot
%       Other plot types
%       Plotting complex numbers


%% ------------------------------------------------------------------------
%   2D PLOTTING WITH MATLAB
%
%   MATLAB plots vectors as coordinate points
%
%       >> plot(x,y)
%           where x is a vector of values and y is the same length vector of values 
%           Plots vector Y vs vector X
%
%       Define a range of x & y in terms of x
%       
%       EXAMPLE  
%               x = -10:1:10;
%               y = x.^2;
%               plot(x,y);
%
%   IMPORTANT:  x & y must be of same size (vectors of equal length)
%
%       Can plot a single vector
%       >> plot(Y)
%           Plot the vector Y vs its vector index 
%           If Y is a vector with imaginary numbers, this is equivalent to plot(real(Y),imag(Y))
%  


%% ------------------------------------------------------------------------
%   PLOTTING OPTIONS   
%
%       plot(x,y,‘PropertyName’,value,…);
% 
%           PropertyNames:  ‘Linetype’
%                           ‘LineWidth’
%                           ‘Linestyle’
%                           ‘Color’
%                           ‘Marker’ 
%                           ‘MarkerEdgeColor’ 
%                           ‘MarkerFaceColor’ 
%                           ‘MarkerSize’
%                           … 
%       EXAMPLE
%           >> plot(x,y,‘LineWidth’,4,‘Marker’,‘o’,…);
% 
%
%       LINE COLOR          LINE STYLE          MARKER TYPE
%       magenta     m       solid       -       plus sign       +
%       yellow      y       dashed      --      circle          o
%       black       k       dotted      :       astrisk         *
%       white       w       dash-dot    -.      point           .
%       red         r                           cross           x
%       green       g                           triangle, up    ^
%       blue        b                           triangle, down  v
%       cyan        c                           square          s
%                                               diamond         d
%                                               5-point star    p
%                                               6-point star    h
%                                               triangle, left  <
%                                               triangle, right >
%


%% ------------------------------------------------------------------------
%   MORE PLOTTING OPTIONS
%
%       >> plot(X,Y,‘s’)
%           Plot with the line options defined by the character string ‘s’
%           ‘s’ (color, line style, marker) in any order
%           Cannot change Line Width, Marker Colors, etc. using ‘s’, must write out after
% 
%       >> plot(X,Y,‘g*-.’) 
%           Plots Y -vs- X as a green dash-dot line (-.) with asterisk (*)  markers 
%           (-.) ~= (.-)
% 


%% ------------------------------------------------------------------------
%   OTHER PLOT RELATED FUNCTIONS
%
%       Adding figure title
%           >> title(‘Name’);
% 
%       Adding x and y axis label
%           >> xlabel(‘Name’); 
%           >> ylabel(‘Name’);
% 
%       Adding legend at a specified location in the plot
%           >> legend(‘plot1’,…,‘Location’,‘LOC’); 
%       Location: N, S, E, W, NE, NW, SE, SW, or BEST
%


%% ------------------------------------------------------------------------
%   CONTROL THE TEXT IN TITLES, LABELS, LEGENDS, ETC.
%
%       MATLAB text control uses TeX language
%           Stream modifiers
%               \bf{text} – boldface
%               \it{text} – italics
%               \fontname{fontname} – specify the font to use
%               \fontsize{fontsize} – specify the font size
%               _{xxx} – subscript
%               ^{xxx} – superscript
%
%           Special mathematical and Greek characters are available
%               \infty (?)
%               \leq (?)
%               \alpha (?)
%               (see tables in Text Book, page )
%
%           To include special characters (\, {, }, _,^), precede by a backslash (\)
%


%% ------------------------------------------------------------------------
%   OTHER PLOT RELATED FUNCTIONS   
%
%       Turn on/off the grid lines
%           >> grid on; 
%           >> grid off;
% 
%       Format axis scale and appearance
%           >> axis([xmin xmax ymin ymax]);
%           >> axis equal
%           >> axis square
%           >> axis normal
%           >> axis off
%           >> axis on
%           
%       Create a specific figure window
%           figure();    
%
%       Plot multiple 'objects' on the same figure
%           hold on;
%           hold off;
%


%% ------------------------------------------------------------------------
%   MULTIPLE PLOTS ON ONE AXIS
%
%       EXAMPLE: Plot sin(2x) and its derivative between 0 and 2?
% 
%           x = 0:pi/100:2*pi; 
%           y1 = sin(2*x); 
%           y2 = 2*cos(2*x);
% 
%           figure(2); %open a new figure 2
%           plot(x,y1, ‘k-.’); hold on; %hold figure window open 
%           plot(x,y2, ‘b--’); hold off;
% 
%           title(‘sin(2x) and derivative’);
%           xlabel(‘x’); ylabel(‘y’); 
%           legend(‘f(x)’,‘d/dx f(x)’,‘Location’,‘SE’); 
%


%% ------------------------------------------------------------------------
%   SUBPLOTS - MULTIPLE AXIS IN ONE FIGURE WINDOW
%
%       subplot(m,n,p)
%            Creates m x n subplots in figure window arranged in m rows and n columns 
%            and selects subplot p to receive current plotting commands. (numbered Left to Right and Top to Bottom)
%
%       EXAMPLE
%           figure(2); %Fig 2 is the current figure window 
%           subplot(2,1,1); %Create 2 plots organized in rows
%           plot(x,y1,'r-'); %Plot in red solid line in subplot 1
%           title('\bf{sin(2\theta)}');
%           axis([0 pi -1 1]); %Set min/max values for axis
% 
%           subplot(2,1,2); %Plot subplot 2
%           plot(x,y2,'b-'); %plot x vs y as blue solid line
%           title('\bf{Its derivative}’);
% 
%           %Set min/max values for axis
%           axis([0 pi -2 2]); 
%           xlabel('\theta in radians');
%


%% ------------------------------------------------------------------------
%   POLAR COORDINATE PLOTS
%
%       Polar Coordinates use and angle and a radius to determine the location on the plot
%
%       >> polarplot(theta,r)
%
%       EXAMPLE 
%           >> t = linspace(0,2*pi,500);
%           >> polarplot(t,sin(t).*cos(t),‘g:’,’Linewidth’,2);
%


%% ------------------------------------------------------------------------
%   LOGARITHMIC PLOTS
%
%       Plot both x and y values on the logarithmic axis
%           >> loglog(x,y)
% 
%       Plot the x values on log axis and y values on linear axis
%           >> semilogx(x,y)
% 
%       Plot the x values on linear axis and y values on log axis
%           >> semilogy(x,y)
%
%   EXAMPLE
%       clear;clc;
%       %  Create the data to plot
%       x = 0:0.01:10;
%       y = (x-5).^2 + 1;
% 
%       % Create the figure, 3
%       figure(3);
% 
%       %set the subplot area in the figure
%       subplot(2,2,1)
%       % Plot Cartesian Y -vs- X
%       plot(x,y)
%       % Set axis
%       axis([0 10 0 30]);
%       % Title and Label plot
%       title('Linear Plot');xlabel('x');ylabel('y');grid on;
% 
%       subplot(2,2,2)
%       % Plot Cartesian SemiLog X
%       semilogx(x,y)
%       axis([10^-1 10^1 0 30]);
%       title('SemiLogX Plot');xlabel('x');ylabel('y');grid on;
% 
%       subplot(2,2,3)
%       % Plot Cartesian SemiLog Y
%       semilogy(x,y)
%       axis([0 10 10^0 10^2]);
%       title('SemiLogY Plot');xlabel('x');ylabel('y');grid on;
% 
%       subplot(2,2,4)
%       % Plot Cartesian SemiLog Y
%       loglog(x,y)
%       axis([10^-1 10^1 10^0 10^2]);
%       title('LogLog Plot');xlabel('x');ylabel('y');grid on;

%% ------------------------------------------------------------------------
%   BAR PLOTS
%
%       Create a vertical bar plot with the values in x used to label each bar and the values in y used to determine the height of the bar
%           >> bar(x,y)
% 
%       Create a horizontal bar plot 
%           >> barh(x,y) 
% 
%       EXAMPLE
%           figure(36)
%           barh([1,2,3,4], [5 10 15 20]);
%           figure(54)
%           bar([1 2 3],[5 10 15]);
%           name = char(‘Mon’,‘Tue’,‘Wed’);
%           set(gca,‘XTickLabel’,name);
% 


%% ------------------------------------------------------------------------
%   PIE CHARTS
%
%       pie() function determines the percentage of the total pie corresponding to each value of array x and plots pie slices of that size
%           >> pie(x)
%           >> pie(x,explode)
%               explode option separates the specified slices from the rest of the pie
% 
%       EXAMPLE
%           data = [1 2 3 4];
%           view = [0 1 0 1];
%           pie(data, view);
%           legend(‘data1’,‘data2’,‘data3’,‘data4’);
%

%% ------------------------------------------------------------------------
%   MATLAB OPERATIONS WITH COMPLEX NUMBERS
%
%       Complex numbers are numbers with both real & imaginary part:
%           c = a + bi,   
%               where
%               a = real part, b = imaginary part, i = sqrt(-1) 
% 
%       Use i or j to create the imaginary part, i.e. C = 1 + 3*i
%       MATLAB uses rectangular coordinates to represent complex number (real & imaginary part)
% 
%       MATLAB functions
%           Find the real and imaginary component: real(C), imag(C)
%           Absolute value & angle functions: Convert from rectangular coordinate representation to polar coordinate, abs( ), angle( )
%           Mathematical functions: Some built-in functions support complex number input such as exp( ), trigonometric functions, etc..
% 
%
%       EXAMPLE - Consider y(t) = e-0.2t(cos t + isin t), for t = 0:0.1:4*pi
%               t = linspace(0,4*pi,100)
%               y = exp(-0.2*t).*(cos(t) + i.*sin(t))
%
%           figure(39)
%           plot(t,y) % Incorrect, plot() ignores the complex part & plot only the real part of y
%
%         -SO-
%           
%           figure(43)
%           plot(t,real(y)); 
%           hold on;
%           plot(t,imag(y));
%


%% ------------------------------------------------------------------------
%   EXAM I 
%



%% ------------------------------------------------------------------------
