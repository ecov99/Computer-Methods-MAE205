%--------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Fall 2020
%   Brian L Ruhe, PhD, CP
%
%   LECTURE 3 - OUTPUT FORMAT AND MANAGING DATA
%
%--------------------------------------------------------------------------
%
%   Book: Gilat, A. (2017). MATLAB: An Introduction with Applications, 6th Edition. John Wiley & Sons.
%       Chapter 4
%


%% ------------------------------------------------------------------------
%   OUTLINE
%
%       struct()
%       cell arrays {}
%       fprintf() for formatted screen display
%       load() & save() 
%       fopen() and fclose() - File opening & closing
%       xlsread()& xlswrite() functions for Microsoft Excel files (*.xls, *.xlsx) 
%       Additional I/O Functions
%


%% ------------------------------------------------------------------------
%   COMMON DATA STORAGE TYPES
%
%       Matrices  [  ]
%           Store multiple numbers OR characters in an m x n matrix
% 
%       Structures
%           Arrays with named fields that can contain data of different types and sizes
% 
%       Cell arrays  { }
%           Arrays that can contain data of varying types and sizes
%


%% ------------------------------------------------------------------------
%   STRUCTURE ARRAY struct()
%
%       Data are categorized by the field name
%       All structures in the array have the same number of fields
%       The same kind of data is stored under the same field names
%       Fields of the same name in different structures can be of different types and sizes
%
%       EXAMPLE:
%           % creating struct() array
%           patient(1).name = 'John Doe'; 
%           patient(1).billing = 127.00; 
%           patient(1).test = [79, 75, 73; 180, 178, 177.5; 220, 210, 205]; 
%           patient(2).name = 'Ann Lane'; 
%           patient(2).billing = 28.50; 
%           patient(2).test = [68, 70, 68; 118, 118, 119; 172, 170, 169];
% 
%           % accessing struct() array element
%           amount_due = patient(1).billing
%           testRow1 = patient(1).test(1,:)
%


%% ------------------------------------------------------------------------
%   CELL ARRAYS {}
%
%       Cell arrays can contain data of different types & sizes
%       A cell array is assigned by { }
%       Defining & accessing a cell array:
% 
%       EXAMPLE:
%           patient1 = {'John Doe'; 127.0; [79, 75, 73; 	180, 178, 177.5; 220, 210, 205];}
%           name1 = patient1{1}
%           testRow1 = patient1{3}(1,:)
%



%% ------------------------------------------------------------------------
%   fprintf() - FORMATTING OUTPUT DATA TO THE COMMAND WINDOW OR TO AN OUTPUT FILE
% 
%       fprintf('format',data) 
%
%       fprintf() can be used to display formatted output on the screen or save it to a file
% 
%           Caution: fprintf() will only display the real part of a complex number 
% 
%       Examples:
% 
%       Text:
%           >> fprintf('Force in Newtons');
%       (OUTPUT)
%           >>  Force in Newtons
% 
%       Text and Numerical data:
%           >> r = 3;
%           >> fprintf('The radius is %3.1f cm. The area is %.2f cm^2.\n',r,pi*(r^2));
%       (OUTPUT)  
%           >> The radius is 3.0 cm. The area is 28.27 cm^2.
%   


%% ------------------------------------------------------------------------
%   fprintf() FORMAT SPECIFIERS
%
%                 %+10.3f
%
%       % (marker):     marks where the number is inserted in text
%       Flag:           - for left justifying the number
%                       + Prints a sign in front of the number
%                       0 Adds zeros if the number is shorter than the field
%       Field Width:    Minimum # of digits in the display
%       Precision:      # of digits to be displayed after decimal point
%
%       Conversion Character:   %d, %i  output integer
%                               %f      output fixed point number 
%                               %g      output either fixed point or exponent or integer, whichever is shorter
%                               %E      output Exponential using upper case e (1.7091e+001)
%                               %e      output Exponential using lower case e (1.7091e+001)
%                               %c      output single character
%                               %s      output text string
%


%% ------------------------------------------------------------------------
%   USING fprintf() IN A SCRIPT
%
%       Back to our first script – MyArea.m
%
%           % Prompting User to enter in Radius
%           r = input('Enter the radius (cm): ');
% 
%           % Old method
%           area = pi*r^2;
%           disp(['The area is ', num2str(area), ' cm^2.']);
% 
%           % New method with fprintf()
%           fprintf('\nThe area is %.3f cm^2.\n', pi*r^2);
%


%% ------------------------------------------------------------------------
%   EXAMPLE: USING fprintf() FOR TABLE OUTPUT
%
%       % Convert vel from mi/hr to km/hr & display in table
%       clear; clc;
%       vel_mph = 10:10:100; %mph
%       vel_kmh = vel_mph * 1.609; %conversion from mph to kmh
%       table1 = [vel_mph; vel_kmh];
% 
%       % Ouput in a table
%       disp('  ');
%       fprintf('Velocity Table \n \n');
%       fprintf('mi/h \t km/h \t \n');
%       fprintf('%8.3f \t  %8.3f \t \n',table1);
%

%% ------------------------------------------------------------------------
%   DATA FILES
%
%       MATLAB can: 
%           SAVE files
%           OPEN files
%           CREATE files
%           LOAD files
%
%       load, save:             Load/Save workspace
%       fopen(), fclose():      File opening and closing
%       fprintf(), sprintf():   Formatted write (output)
%


%% ------------------------------------------------------------------------
%   load AND save COMMANDS
%
%       >> save filename [list of vars] [options]
%       >> load filename [options] [content]
%
%     where
%       filename the name of the file to save/load
%       list of var var1 var2 var3 …If omitted, the entire workspace is saved. All data is loaded by using the load command 
%       options  -mat ( Mat-file format, default), -ascii (ASCII-file format), -append (append to specified filename, only works for save command)
% 
%       Use to load() / save() workspace. 
%       Very useful for exchanging data between MATLAB programs using *.mat files. 
%       Limited use for ascii files.
% 
%
%       EXAMPLE:
%           clear;
%           data1 = 3.567;
%           data2 = rand(3,5);
%           data3 = 0:0.02:100;
%           data4 = 'hello'; 
%           save alldata1;
%           save alldata2 data1 data2;
%
%           clear;
%           load alldata1;
%           clear;
%           load alldata1 data1 data2;
%           clear;
%           load alldata2;
%


%% ------------------------------------------------------------------------
%   FILE OPENING / CREATING USING fopen()
%
%       Opens file & returns a File ID (fid) number
%
%       >> fid = fopen('filename.ext', permission)
%       >> [fid, message] = fopen('filename.ext', permission)
%
%       where filename.ext  name of file to openpermission is a char string. Some common permission codes are: 
%           'r' Open file for reading (default) 
%           'w' Open file for writing. If the file already exists, its content is  	deleted. If not, a new file is created
%           'a' Same as 'w', except that if the file exists the written data is 	appended to the end of the file
%
%       If open successfully, fid contains a positive integer and message is an empty string.
%       If not, fid = -1 and message explains the problem 
%       If file is not in the current directory, MATLAB looks for it in the search path
%
%
%   FILE ID 
%       Files are assigned a number (fid) when opened and released when closed
%           The File ID is used for all reading, writing, & control operations on that file
%
%       fid is a positive integer
%           File ID 1 is reserved for standard output device (stdout) 
%           File ID 2 is reserved for standard error (stderror) device
%
%       Data can be written to & read from files in two possible ways
%           Binary: actual bit patterns used to store data in computer memory (Not covered, see section 8.5) 
%           Formatted character data: actual characters/numbers that can be read by user
%
%       MATLAB first finds/saves the file in the current directory, unless the full path is specified
%


%% ------------------------------------------------------------------------
% FILE CLOSING fclose()
%
%   Closes a file or all open files
%       >> status = fclose(fid)
%       >> status = fclose('all')
%
%       Close either the file with this fid or all files (except stdout and stderror)
%           Return status = 0 if successful or -1 if not
%
%       Each fopen (i.e. each file ID defined) must be accompanied by fclose
% 

%% ------------------------------------------------------------------------
%   PRINTING/OUTPUTTING TO A FILE WITH fprint()
%
%   Writes formatted data in a user specified format to screen or to file
%       >> fprintf(fid,'format',val1,val2,…)
%       >> count = fprintf(fid,'format',val1,val2,…)
% 	
%   where: 
%       fid is the File ID to which the data will be written
%       'format' string which specifies alignment, significant digits, field width… 
%           as seen previously i.e. %c (single char), %d or %i (integer),  %e (exponential), 
%           %f (fixed-point), %g (the more compact form %e or %f), %s (string of char) 
%       count returns the number of values written to the file
%       Insert \n (next line), \b (backspace), \t (horizontal tab)
%
%   EXAMPLE:
%       % script to convert velocity from mi/h to km/h
%       clear; clc;
%       vel_mph = 10:10:100; % mph
%       vel_kmh = vel_mph.*1.609; % convert mph to km
%       table1 = [vel_mph; vel_kmh];
%       fid1 = fopen('velocity_mphtokm.txt','w');
%       fprintf(fid1,'Velocity Table \n \n');
%       fprintf(fid1,'mi/h \t km/h \t \n');
%       fprintf(fid1,'%8.3f \t  %8.3f \t \n',Table1);
%       fclose(fid1);
%


%% ------------------------------------------------------------------------
%   I/O MATLAB FUNCTIONS
%
%       Microsoft Excel read/write:
%           xlsread()
%           xlswrite()
% 
%       Formatted read (input), Formatted read line:
%           importdata()
%           fscanf()
%           textread()
%           textscan()
%           fget1()
%           fgets()
%
%       File positioning, status and miscellaneous:
%           delete
%           exist
%           ferror
%           feof
%           fseek
%           ftell
%           frewind 
%


%% ------------------------------------------------------------------------
%   USING THE IMPORT WIZARD
%
%       Select “Import Data” under the “File” menu of the Command Window
%       The Wizard will display the files recognized by MATLAB
%       Select the Column Separator
%       Next, the Wizard will show the name & size of the variables to be created
%       Click “Finish” to import the data
%
%       Try with example files: testdata1.txt & test_input2.dat
%       Data with mixed format (text & numerical values) are saved in a cell array
%       To access element of a cell A, use:   A{1}, A{2}, A{1}(2)…
%


%% ------------------------------------------------------------------------
%   importdata()
%
%      >> output_data = importdata('filename', delim, headerlineNum)
% 
%           Load data from ASCII file, 'filename.ext'
%               delim  type of delimiter (' ' for space, '\t' for tab)
%               headerlineNum  number of header line in which the numeric data is read from line headerlingNum + 1
%           Data from output_data can be matrix, multidimensional array, cell array, or structure array depending on the file characteristics
% 
%           The function will try to call the appropriate reading function for the type of input data
%           For ASCII file input, the output of importdata() is saved to a Structure array
%           Possible fields of the output include:
%               data, textdata, colheaders, rowheaders
% 
%       EXAMPLE
%           outout_data = importdata('file01.txt',' ',1);
%           disp(outout_data.colheaders{1, 3}) 
%           disp(outout_data.data(:,3))
%


%% ------------------------------------------------------------------------
%   textscan()
% 
%       >> c = textscan(fid,'format',n,param,value,…)
% 
%       textscan() functions similarly as textread() but offers the following advantages:
%           Faster 
%           Can start reading at any point in the file
%           Subsequent textscan() operations start reading at the point the last operation left off
%           Returns the result in a single array regardless of the number of fields read
%           More choices in how the data being read is converted, 
%               however, it must be used with fopen() and fclose() command
% 
%       EXAMPLE - Download the file test_input1.txt from BeachBoard 
%           fid2 = fopen('test_input1.txt','r');
%           A = textscan(fid2,'%s %s %s %f %d %s')
%           fclose(fid2);
% 
%       To access element of A, use A{1}, A{2}, A{1}(2)…
%


%% ------------------------------------------------------------------------
%   textscan() WITH OPTIONS
%
%   Download test_input2.txt
%   Skipping header lines: Use 'headerLines' parameter with the number of lines to skip.
%       >> fid3 = fopen('test_input2.txt','r');
%       >> B = textscan(fid3,'%s %s %s %f %d %s','headerLines',1)
% 
%   Skip a field while reading
%       >> fseek(fid3,0,-1) %(seek to the beginning and start reading the file)
%       >> B = textscan(fid3,'%s %*s %s %f %d %*s','headerLines',1)
%       >> fclose(fid3);
% 
%   Refer to MATLAB help for textscan for more usage tips
%


%% ------------------------------------------------------------------------
%   FORMATTED INPUT fscanf()
%
%       Reads formatted data in a user specified format from a file. 
%           >> array = fscanf(fid,'format')
%           >> [array,count] = fscanf(fid,'format',size)
%       
%       where 
%           fid is the file ID to which the data will be read 
%           format is string controlling how data is read
%           count is number of values read from the file
%           size is amount of data to be read 
%               n for n values, Inf read until end of file, 
%               [n m] for n x m values and format the data as an n x m array
% 
%       fscanf stores data in a column vector unless a specific value of[n m] is given
%
%   EXAMPLE
%       Download example1.txt from BeachBoard
%       Try the following commands in the Command Window and observe the value of z's and count's from each fscanf()
% 
%           [z1,count1] = fscanf(fid,'%f')
%           [z2,count2] = fscanf(fid,'%f',[2 2])
%           [z3,count3] = fscanf(fid,'%d', Inf)
%           [z4,count4] = fscanf(fid,'%d.%d', [1 Inf])
%           [z5,count5] = fscanf(fid,'%d.%d')
%           [z6,count6] = fscanf(fid,'%c')
%           [z7,count7] = fscanf(fid,'%s')
% 
%       Note that each fscanf needs a separate fopen and fclose statement. 
%       Use 'r' option in fopen to read a file. What are the outputs?
% 


%% ------------------------------------------------------------------------
%   textread()
%
%       Useful for importing tables of data in columns
%           >> [a,b,c,…] = textread(filename,'format',n)
%
%       where
%           filename the name of the file to open
%           'format' string containing a description of data in each column (same as in fprintf)
%           n,  number of lines to read (if n is -1 or omitted to read to end-of-file)
% 
%       textread is flexible for ASCII files because it supports different types of data in different columns
%
%
%   EXAMPLE - Download the file test_input1.dat from BeachBoard
%       [first,last,blood,gpa,age,answer] = textread('test_input1.dat','%s %s %s %f %d %s')
% 


%% ------------------------------------------------------------------------
%   FORMATTED STRING OUTPUT sprintf()
%
%   Writes formatted data to a character string to be displayed instead of writing to a file. 
%       sprintf('format',val1,val2,…)
%           or
%       string = sprintf('format',val1,val2,…) 
%
%   where 
%       'format' string controlling the appearance of the data
%
%   EXAMPLE
%       sprintf('The rounded value of pi is %d',round(pi))
%


%% ------------------------------------------------------------------------
  
