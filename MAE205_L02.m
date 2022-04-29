%--------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Fall 2020
%   Brian L Ruhe, PhD, CP
%
%   LECTURE 2 - CODING TECHNIQUES ADN ARRAY OPERATIONS
%
%--------------------------------------------------------------------------
%
%   Book: Gilat, A. (2017). MATLAB: An Introduction with Applications, 6th Edition. John Wiley & Sons.
%       Chapter 1 through Chapter 3


%% ------------------------------------------------------------------------
%   OUTLINE
%
%       Constructing Code with pseudo-code
%       errors / Debugging
%       Defining and working with arrays
%       Array operations
%       MATLAB functions for analyzing arrays
%       input() and disp() functions 
%


%% ------------------------------------------------------------------------
%   TOP-DOWN CODING TECHNIQUES
%
%       1. State the problem you are trying to solve.
%       2. Define required inputs and outputs.
%       3. Design algorithm
%           a. Decompose subtasks (repeat until all tasks are broken down to components)
%           b. Step-wise Refinement of psuedocode (repeat until effcient and accurate)
%       4. Convert algorithm into MATLAB statements
%       5. Test Resulting Program
%           a. If not correct, return to steps 3 and or 4.
%


%% ------------------------------------------------------------------------
%   CONSTRUCTS AND PSEUDO-CODE
%
%       Constructs
%           Basic elements or commands used in programming languages
%           Constructs are used to write algorithms which result in a structured program
% 
%       Pseudo-code
%           A hybrid mixture of program syntax and plain words
%           Useful in algorithm development
%           Providing a general description of the steps
% 
%       Each construct can be described by pseudo-code
%


%% ------------------------------------------------------------------------
%   PSEUDO-CODE EXAMPLE
%
%       Write a program that reads an input in degrees Fahrenheit (F) and converts it to absolute temperature Kelvin (K).
%
%           Pseudo-code:
%               1. Prompt user to enter temperature in F
%               2. Read temperature in F (tF) 
%               3. Convert tF to Kelvin -> (5/9)*(tF- 32)+273.15 
%               4. Output temperature in K (tK)
%
%       Let's code this example!!
%

%% ------------------------------------------------------------------------
%   GOOD PROGRAMMING PRACTICES
%
%       Write program so that anybody familiar with MATLAB can understand your code
%       Use meaningful variable names
%       Use a consistent naming convention when the program contains several variables
%       Include a brief description of the steps taken (data dictionary, comments, etc.) 
%           COMMENTS/PSEUDO-CODE!!
%       Use semicolons (;) to suppress unnecessary values from displaying in the Command Window
%       Use parentheses when appropriate
%       Include appropriate units for values read in the program
%


%% ------------------------------------------------------------------------
%   PROGRAM ERRORS
%
%       Syntax errors 
%           MATLAB compiler will detect, script will not execute
%
%       Run-Time errors
%           Illegal mathematical operation during script execution (may result in NaN, Inf, or error)
%
%       Logical error
%             Programs compiles and runs successfully, but produces wrong answer
%


%% ------------------------------------------------------------------------
%   DEBUGGING SCRIPTS
%
%       1. If MATLAB returns error, READ the error statement for line location and explanation of error
%       2. Remove semicolons, execute line-by-line following variable values in the workspace, 
%          or add display/print statements to locate the error in program 
%       3. Break long assignment statements into several small ones
%       4. Check parentheses placement
%       5. Check that variables have been initialized properly
%       6. Check units for all functions used
%       7. Use MATLAB symbolic debugger (Chapter 3)


%% ------------------------------------------------------------------------
%   MATRICES
%
%       MATLAB fundamental unit is the ARRAY (matrix)
%       Matrix - Rectangular table of elements
%
%                | a11   a12   a13 |
%           a =  | a21   a22   a23 |
%                | a31   a32   a33 |
%
%           a32, a31, a21, a22, ... ALL INDIVIDUAL ELEMENTS OF a
%
%       Elements of the array can be double, char, or logical type
%

%% ------------------------------------------------------------------------
%   BASICS OF MATRICES
%
%       Matrices are written in rows and columns. 
%           Each element is referenced by the ith row and jth column indices ? (i, j)
% 
%       An m x n matrix is a matrix with m rows and n columns
%       An n x n matrix is sometimes referred to as a square matrix
% 
%       Scalar values are simply a 1 x 1 matrix, e.g. 2 = [2], 3 = [3]
% 
%       A vector is an n x 1 or 1 x n matrix
%


%% ------------------------------------------------------------------------
%   CREATING ARRAYS
%
%       Use [] to enter multiple elements into a variable
%       Spaces or commas move to the next column
%       Semicolons (;) move to the next row
% 
%       >> a1 = [9, 8  7,  6  5];
% 
%       >> a2 = [4; 5; 6];
%
%       >> a3 = [11 12 13; 2 4 6; -1 -2 -3];
%


%% ------------------------------------------------------------------------
%   ACCESSING ELEMENTS IN AN ARRAY 
%
%       >> b = [10   12   14   22; 13   15   -9   -3; 18   -4   13   -7]; 
%
%                | 10   12   14   22 |
%           b =  | 13   15   -9   -3 |
%                | 18   -4   13   -7 |
%
%       What is the size of array b?
%
%       How can you access a specific element, -9?
%
%
%       >> c = [9 15 -6];
%
%       What is the size of array c?
%
%       How can you access a specific element, 15?   
%
%
%       >> d = [50;40;30];
%
%       What is the size of array d?
%
%       How can you access a specific element, 30?  
%
%
%       >> f = 'hello';
%
%       What is the size of arrayf?
%
%       How can you access a specific element, e?  
%

%% ------------------------------------------------------------------------
%   MATLAB MEMORY STORGARE FOR ARRAYS (IMPORTANT TO UNDERSTAND)
%
%       MATLAB stores array elements in column major order
%
%           g = | 1   2   3 |
%               | 4   5   6 |
%                
%
%       The arrangement in the computer memory for A will be|
%                   1
%                   4
%                   2   
%                   5
%                   3   
%                   6
%
%       So, g(3) = g(1,2) = 2
%


%% ------------------------------------------------------------------------
%   BASIC MATRIX OPERATIONS
%
%       Addition and Subtraction
%           Add/subtract element-by-element
%           The arrays MUST be the same size!
%
%
%       Matrix Multiplication
%           Rules of Matrix Multiplication
%               Columns of the first term must equal the rows of the second term
%                   Arc * Brc  only works if Columns in A = Rows in B
%               Output size is Row of A  by the Columns of B
%           
%           Order of terms in matrix multiplication is important (A*B ? B*A). 
%
%               | 1   2   3 |     | 2  4  6 |     | 35  32  29 |
%               | 4   5   6 |  *  | 3  5  7 |  =  | 77  77  77 |
%                                 | 9  6  3 |
%
%       Matrix Division
%           Multiply by the inverse
%           Can use MATLAB built-in functions inv() and pinv()
%           Denominator cannot be zero (for scalar) or cannot be a singular matrix
%
%
%
%       Matrix Transpose (')
%           Operation to swap rows & columns of a matrix
%


%% ------------------------------------------------------------------------
%   BASIC MATRIX OPERATIONS - THE IDENTITY MATRIX
%
%       Identity Matrix, often referred to as I 
%           Square matrix with ones along its diagonal and zeros elsewhere. 
%           The definition of the identity matrix is A*I = A
%
%               | 9   1 |  *  | 1  0 |  =  | 9   1 |
%               | 3   7 |     | 0  1 |     | 3   7 |
%                                 
%       Note that for a scalar, the identity is simply 1
% 
%       MATLAB function to create Identity Matrix eye()
% 


%% ------------------------------------------------------------------------
%   BUILT-IN FUNCTION FOR ARRAYS
%
%       x = length(array) 
%           Length of vector or longest dimension of 2D array
% 
%       [m,n] = size(array) or x = size(array) or x = size(array,dim)
%           Returns the number of rows and columns of a 2D array
% 
%       reshape(A,m,n) 
%           Rearranges matrix A of size r x s to have m x n.
%           The product of r and s must equal to the product of m and n
% 
%       diag(v) 
%           Creates a square matrix with elements of a vector v in the diagonal 
%             -or- 
%           Creates a vector from diagonal elements of matrix v
%


%% ------------------------------------------------------------------------
%  MORe BUILT-IN ARRAY FUNCTIONS IN MATLAB
%
%       mean(A):                Returns the mean value of elements of vector A
%       sum(A):                 Returns the sum of all elements of vector A
%       sort(A):                Arrange the elements of vector A in ascending order
%       det(A):                 Returns determinant of a square matrix A
%       dot(a,b):               Calculates the scalar product of two vectors a and b
%       cross(a,b):             Calculates the cross product of two vectors a and b
%       inv(A):                 Returns the inverse of square matrix A
%
%       : (colon):  Shortcut used to create a vector or select specific values in an array.  first:increment:last
%       end:        Serve as the last index in an indexing expression    
% 
%       zeros(m,n):             Returns an m x n array of zeros
%       zeros(n):               Returns an n x n array of zeros
%       ones(m,n):              Returns an m x n array of ones
%       ones(m):                Returns an n x n array of ones
%       eye(n):                 Returns an n x n identity matrix
%       eye(m,n):               Returns an m x n matrix with ones on the diagonal and zeros elsewhere
%       rand(m,n):              Returns an m x n matrix with random numbers between 0 and 1
%       randi([IMIN,IMAX],m,n): Returns an m x n matrix with random integers between IMIN and IMAX
%


%% ------------------------------------------------------------------------
%   EXAMPLES
%
%       Assignment Statements
%           >> array1 = [1.0, 2.0, 3.0; 2, 3, 4]
%           >> array2 = [1, 2+7, 3, 4, 5]
%           >> a = [array2(3), 6, 7; array1]
%           >> c = a(2,3) (See what MATLAB gives for c)
%
%       Using the : (colon)
%           >> x = 1:2:10;
%
%           >> y = [1:2:10; 2:2:10]
%
%       Accessing and Assigning Sub-Arrays
%           >> a  = [1, 2, 3; -2, -3, -4; 3, 4, 5];
%           >> a2 = a(1,:)  		
%           >> a3 = a(:,1:2:3)  	
%           >> a4 = a(2:end,2:end)	
%           >> a5(1:2,[1, 3]) = [10, 11; 12, 13]; 
%                   modifies cells (1,1), (2,1), (1,3), (2,3), resulting array is: 
%                   a5 = [10, 2, 11; 12, -3, 13; 3, 4, 5]
%
%           >> a2(1:2) = 10 		 
%
%           >> a = [10, 11; 12, 13];   What happens here?


%% ------------------------------------------------------------------------
%   MORE ARRAY EXAMPLES
%
%           >> A = [3, 5, 8, 9, 1, 2]
% 
%           >> A(4) = [ ]
%           >> A(2:5) = [ ]
% 
%
%           >> B = [2, 4, 6; 3, 5, 7]
% 
%           >> B(1,:) = [ ]


%% ------------------------------------------------------------------------
%   ARRAY AND SCALAR MATHEMATICAL OPERATIONS
%
%       a*b:    Matrix multiplication
%       a/b:    Matrix right division a*inv(b)
%       a\b:    Matrix left division inv(a)*b 
%       a’:     Matrix complex conjugate transpose
%       a.’:    Matrix transpose
%
%       a.*b:   Element-by-element Multiplication (a(i,j)*b(i,j))
%       a./b:   Element-by-element Right division (a(i,j)/b(i,j))
%       a.\b:   Element-by-element Left division (b(i,j)/a(i,j))
%       a.^b:   Element-by-element Exponentiation (a(i,j)^b(i,j))
%


%% ------------------------------------------------------------------------
%   ARRAY MULTIPLICATION AND ELEMENT-WISE MULTIPLICATION
%
%       >> [1 2; 3 4]*[1 0; 0 1]      
%           compared to
%       >> [1 2; 3 4].*[1 0; 0 1]
%
%
%       >> [1 2 3 4]*[1 0 1 0] 
%           compared to
%       >> [1 2 3 4].*[1 0 1 0]
%
%
%
%       >> a1 = [ 1,  2,  3,  4,  5]
%       >> a2 = [ 2,  9,  3,  5,  7]
%       >> a3 = [-1,  1, -1,  1, -1]’
%       >> a1*3
%       >> a1*a2  what happened?
%       >> a1.*a2
%       >> a1’*a3
%       >> a1*a3
%


%% ------------------------------------------------------------------------
%   USER INPUT DATA WITH THE MATLAB FUNCTION input()
%
%       >> help input
%
%       Input Built-in MATLAB function
%           >> var = input(‘Prompt user for input:  ’);
% 
%       MATLAB prints the string to the Command Window 
%       and waits for user to enter a scalar or array
%           >> Prompt user for input:
%  
%       Input function where user must input a STRING
%       ‘s’ tells MATLAB to expect a string input
%           >> var = input(‘Prompt user for input:  ’, ‘s’);
%       


%% ------------------------------------------------------------------------
%   USER OUTPUT DATA WITH THE MATLAB FUNCTION disp()
%
%       >> help disp
%
%       The MATLAB function disp() accepts a string argumant and displays
%       it in the Command Window.
%
%       Other functions that are used with disp()
%           int2str(): Represent integers as character array
%           num2str(): Convert numbers to character representation 
%
%       Example: 
%           >> str=[‘The value of 2x3 is ’, num2str(2*3)];
%           >> disp(str);
%


%% ------------------------------------------------------------------------
% EXAMPLE OF MATHEMATICAL FORMULA
%
%   Formula mathematically written:  f(x) = ((2x^3 - x + 4)^3)/5
%   Solve for values of x: -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2
%
%




