%--------------------------------------------------------------------------
%
%   MAE 205: Computer Methods in MAE
%   Fall 2020
%   Brian L Ruhe, PhD, CP
%
%   LECTURE 5 - Logical Data Types, Relational and Logical Operators, and Branch Constructs
%
%--------------------------------------------------------------------------
%
%   Book: Gilat, A. (2017). MATLAB: An Introduction with Applications, 6th Edition. John Wiley & Sons.
%       Chapter 6 pages 175 – 192
%


%% ------------------------------------------------------------------------
%   OUTLINE   
%
%       Logical data types
%       Relational operators
%       Logical operators
%       Branches: if-elseif-else-end
%                 switch-case
%


%% ------------------------------------------------------------------------
%   LOGICAL DATA TYPES ... just the beginning
%
%       Logical values are stored in a single byte of memory
%       Two values: True (1) or False (0)
% 	
%       MATLAB allows a logical variable to be converted to a numerical value
%       When a number is used where a logical value is expected, 
%           MATLAB automatically treats a nonzero (including negative) value as “true”
%


%% ------------------------------------------------------------------------
%   RELATIONAL OPERATORS      
%
%        a1 op a2
%           a1 and a2 are arithmetic expressions, variables, strings, …
%               op:   == ,   ~= ,   > ,   >= ,   < ,   <=
%           Expression produces 1 (True) or 0 (False)
% 
%           NOTES
%               Can compare arrays with scalar values, arrays with arrays 
%                   (same size) and strings with strings (same size)
%               Do not confuse  =  and  ==
%               When checking for equality of 2 numeric values, need to account 
%                   for the roundoff error (use abs(a-b)<=eps instead  a==b) 
%


%% ------------------------------------------------------------------------
%   LOGICAL OPERATORS
%
%       (b1 op b2)  or  (op b1) (for unary operator)
%           where b1, b2: expressions or variables with logical results	   
%           op:  &, && (AND), |, || (Inclusive OR),  xor (Exclusive OR), ~ (NOT)
%
%       Truth Table
%          +---------------------------------------------------------------+
%          |  b1  |  b2  ||  b1 && b2  |  b1 || b2  |  xor(b1,b2)  |  ~b1  |
%          |---------------------------------------------------------------|
%          |  0   |  0   ||     0      |     0      |      0       |   1   |
%          |---------------------------------------------------------------|
%          |  0   |  1   ||     0      |     1      |      1       |   1   |
%          |---------------------------------------------------------------|
%          |  1   |  0   ||     0      |     1      |      1       |   0   |
%          |---------------------------------------------------------------|
%          |  1   |  1   ||     1      |     1      |      0       |   0   |
%          +---------------------------------------------------------------+
%
%
%       EXAMPLES
%           >> (5 < 7) & (2 > -3)
% 
%           >> ~(7 <= 0) | (3 == -1)
% 
%           >> [1 2 3] > [-1 6 9]
%


%% ------------------------------------------------------------------------
%   ORDER OF EVALUATION OPERATORS      
%
%       1. Parentheses ()
%       2. Transpose (.'), power (.^), complex conjugate transpose ('), matrix power (^)
%       3. Power with unary minus (.^-), unary plus (.^+), or logical negation (.^~) 
%          as well as matrix power with unary minus (^-), unary plus (^+), or logical negation (^~).
%       4. Unary plus (+), unary minus (-), logical negation (~)
%       5. Multiplication (.*), right division (./), left division (.\), matrix multiplication (*), matrix right division (/), matrix left division (\)
%       6. Addition (+), subtraction (-)
%       7. Colon operator (:)
%       8. Less than (<), less than or equal to (<=), greater than (>), greater than or equal to (>=), equal to (==), not equal to (~=)
%       9. Element-wise AND (&)
%       10. Element-wise OR (|)
%       11. Short-circuit AND (&&)
%       12. Short-circuit OR (||)
%
%       from: https://www.mathworks.com/help/matlab/matlab_prog/operator-precedence.html
%


%% ------------------------------------------------------------------------
%   USAGE OF RELATIONAL AND LOGICAL OPERATORS
%
%           (86 <= grade < 96) is not the same as ((grade >= 86) && (grade < 96)) 
% 
%       What happens when grade = 90?
%           (86 <= grade < 96)   is executed as  1 < 96   MATLAB interprets as (true)
%           
%           ((grade >= 86) && (grade < 96)) is executed as (true) & (true) which MATLAB interprets as  (true)
% 
%       What happens when grade = 80?
%           (86 <= 80 < 96)   is executed as   0 < 96   which MATLAB interprets as   (true) (and is incorrect)
% 
%           ((grade >= 86) && (grade < 96)) MATLAB executes as   (false) && (true)     =    false
%

%% ------------------------------------------------------------------------
%   LOGICAL FUNCTIONS IN MATLAB
%
%       ischar(n)       True (1) if n is a char
%       isempty(n)      True (1) if n is a an empty array
%       isinf(n)        True (1) if n is Inf
%       isnan(n)        True (1) if n is NaN
%       isnumeric(n)    True (1) if n is a numercia array
%
%           ...there are MANY more logical functions!!!
%

%% ------------------------------------------------------------------------
%   BRANCHES      
%
%       Allow specific selection and execution of sections of codes (blocks)
% 
%       Introducing 2 methods:
%           if – elseif – else - end  construct
%           switch - case – otherwise - end  construct
% 



%% ------------------------------------------------------------------------
%   FLOW CHART      
% 
%            +--------------+
%            |              |     false
%            | if STATEMENT |+----------------+
%            |              |                 v
%            +--------------+       +-------------------+
%                   +               |                   |  false
%            true   |               | eleseif STATEMENT |+----------+
%                   |               |                   |           v
%                   v               +-------------------+        +------+
%              +----------+                   +                  |      |
%              |          |             true  |                  | else |
%              | GROUP 1  |                   v                  |      |
%              | COMMANDS |             +----------+             +------+
%              |          |             |          |                 +
%              +----------+             | GROUP 2  |                 |
%                   +                   | COMMANDS |                 v
%                   |                   |          |           +----------+
%                   |                   +----------+           |          |
%                   |                         +                | GROUP 3  |
%                   |                         |                | COMMANDS |
%                   |<------------------------+                |          |
%                   |                                          +----------+
%                   |                                                +
%                   |<-----------------------------------------------+
%                   |
%              end  v
%


%% ------------------------------------------------------------------------
%   if - elseif - else - end CONSTRUCT      
%
%       if control_expr_1
%           statement 1-1             } block 1 executed IF    
%           statement 1-2             } control_expr_1 is TRUE (1)
%       elseif control_expr_2
%           statement 2-1             } block 2 executed IF
%           statement 2-2             } control_expr_2 is TRUE (1)
%       else
%           statement 3-1             } block 3 executed IF
%           statement 3-2             } control_expr_1 AND contorl_expr_2 are FALSE(0)  
%       end
%
%            *control_expr is a mix of relational & logical operations     
%           **Note that each if must be accompanied by end
%

%% ------------------------------------------------------------------------
%   EXAMPLE
%
%       Write a script that reads in a numerical grade & returns a letter grade using the following scale:
%           95 < grade	    	A
% 			86 < grade <= 95	B
% 			76 < grade <= 85	C
% 			66 < grade <= 75	D
% 			0  < grade <= 65	F
%
%       What are the steps?
%
%       DEVELOP THE PSEUDO-CODE
%           1. Ask for user input 
%               >> grade = input(‘Please enter your score: ‘);
% 
%           2. Construct if-elseif-else-end statement to determine the letter grade 
%               Design a flow chart
% 
%           3. Display the letter grade  
%               >> fprintf(‘\n The letter grade is: %c.\n‘, out);
%
%   LET'S CODE THIS EXAMPLE!
%


%% ------------------------------------------------------------------------
%   NESTED if BRANCHES
%
%       if (test1)
%           …
%           if (test2)
%               … 
%               if (test3)
%                   …
%               end
%               …
%           end
%           …	
%       end
% 
%       Each given end statement is always associated with the most recent if statement
% 
%       Make sure that the end statements are inserted properly in a nested loop 
%           containing a large amount of codes to avoid execution errors
% 
% 
%       EXAMPLE
%           Use nested if statements to calculate f(x,y) defined as follows:
% 
%                        {x^2 + y^2,  x < 0 and y < 0 
%               f(x,y) = {  x + y ,   x < 0 and y >= 0 
%                        {  x + y^3,  x >= 0 and y < 0 
%                        {x^3 + y,    x >= 0 and y >= 0 
% 
%           Display the value of f(x,y) up to 3 decimal digits
%           First, develop the pseudocode & flow chart
%
%       LET's CODE THIS EXAMPLE!!
%

%% ------------------------------------------------------------------------
%   switch CONSTRUCT
%
%       switch (switch_expr)
%           case case_expr_1,
%               statement 1-1       } block 1: evaluated IF
%               statement 1-2       } switch_expr == case_expr1
%           case case_expr_2,
%               statement 2-1       } block 2: evaluated IF
%               statement 2-2       } switch_expr == case_expr2
%           otherwise,
%               statement 3-1       } block 3: evaluated IF
%               statement 3-2       } switch_expr ~= case_expr_n
%           end
%
%       case {case_expr1, case_expr2, …} 
%           multiple expressions can be used  to determine the code block to execute
%       At most a single code block can be executed in a switch construct
%
%   
%       EXAMPLE
%           Write a script to convert a quantity of length given in unit of meter 
%           to the equivalent quantity in inch, foot, mm, or cm, as specified by the user
%
%           First, develop the Pseduo-code
%
%           LET's CODE THIS EXAMPLE!


%% ------------------------------------------------------------------------
