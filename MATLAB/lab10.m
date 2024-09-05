%% Q1: defining and solving a symbolic equation
syms T a b c d Cp

% 1) Define the symbolic equation
maineeq = Cp == a + b*T + c*T^2 + d*T^3

% 2) Solve for T
Tsolution = solve(maineeq, T)

% 3) Substitute values and create a new equation
a = 28.90;
b = -0.1571*10^-2;
c = 0.8081*10^-5;
d = -2.873*10^-9;
Cp = 30.00;

% 4) Solve the new equation for T
newEq = subs(Tsolution)




% 5) Convert roots to double precision
TsolNewDouble = double(TsolNew)

% 6) Convert roots to variable precision
TsolNewVPA = vpa(TsolNew)

%% Q2: solving/finding the integral in terms of a b c
syms x a b c

% 1) Find the integral
integralResult = int(a*x^2 + b*x + c, 3.5, 24)

% 2) Substitute values and find the integral result
a = 1;
b = 2;
c = 3;
newIntWithsubs = subs(integralResult)

% 3) Convert the result to double precision
integralResultDouble = double(newIntWithsubs)

%% Q3: finding first and second derivative of y = cos(2x)sinx
syms x

% Defining the function
y = cos(2*x) * sin(x)

% 1) Finding the first derivative
dy_dx = diff(y, x)

% 2) Finding the second derivative
d2y_dx2 = diff(dy_dx, x)


%{
 code output:
 
maineeq =
 
Cp == d*T^3 + c*T^2 + b*T + a
 
 
Tsolution =
 
root(d*z^3 + c*z^2 + b*z + a - Cp, z, 1)
root(d*z^3 + c*z^2 + b*z + a - Cp, z, 2)
root(d*z^3 + c*z^2 + b*z + a - Cp, z, 3)
 
 
newEq =
 
root(z^3 - (976932954830581760*z^2)/347324387975283 + (316537077102430388224*z)/578873979958805 + 3324546003940230230441984/8683109699382075, z, 1)
root(z^3 - (976932954830581760*z^2)/347324387975283 + (316537077102430388224*z)/578873979958805 + 3324546003940230230441984/8683109699382075, z, 2)
root(z^3 - (976932954830581760*z^2)/347324387975283 + (316537077102430388224*z)/578873979958805 + 3324546003940230230441984/8683109699382075, z, 3)
 

TsolNewDouble =

   1.0e+03 *

   -0.2746
    0.5495
    2.5378

 
TsolNewVPA =
 
-274.56474139582861275011079292558
 549.47821866804235244125718677108
 2537.8258196299785624558928377681
 
 
integralResult =
 
(110249*a)/24 + (2255*b)/8 + (41*c)/2
 
 
newIntWithsubs =
 
125255/24
 

integralResultDouble =

   5.2190e+03

 
y =
 
cos(2*x)*sin(x)
 
 
dy_dx =
 
cos(2*x)*cos(x) - 2*sin(2*x)*sin(x)
 
 
d2y_dx2 =
 
- 5*cos(2*x)*sin(x) - 4*sin(2*x)*cos(x)
%}


