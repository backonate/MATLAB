%{
Linear sys we are solving:
t1= (10+20+t2+t3)/4
t2= (20+40+t4+t1)/4
t3= (30+10+t1+t4)/4
t4= (40+30+t2+t3)/4


%}




tempCoefficient = [-4, 1, 1, 0;
    1, -4, 0, 1;
    1, 0, -4, 1;
    0, 1, 1, -4];

boundTempVctr = [-30;-60;-40;-70];


tempINVans = inv(tempCoefficient)*boundTempVctr



tempAnsLftdivision = tempCoefficient\boundTempVctr

VerificationMatrix = (1/4).*[-4 1 1 0 -30;
       1 -4 0 1 -60;
       1 0 -4 1 -40;
       0 1 1 -4 -70];
disp('verification: ')
rref(VerificationMatrix)

