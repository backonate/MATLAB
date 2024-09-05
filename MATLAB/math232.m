%Q1: Set the value of m
%case1:
m = 10;

% Number of column vectors
n = 10; % You can change this value for different cases

% Number of times to generate the vectors
numOfTrials = 5;

% Initialize counters for linearly independent and dependent sets
indCount = 0;
dependCount = 0;

for trial = 1:numOfTrials
    % Generate random column vectors
    Y = randn(m, n);

    % Check linear independence
    if rank(Y) == n
        fprintf('Trial %d: Linearly independent set\n', trial);
        indCount = indCount + 1;
    else
        fprintf('Trial %d: Linearly dependent set\n', trial);
        dependCount = dependCount + 1;
    end
end

% Display the results
fprintf('\nResults:\n');
fprintf('Linearly independent sets: %d\n', indCount);
fprintf('Linearly dependent sets: %d\n', dependCount);


%case2:
m = 12;

% Number of column vectors
n = 10; % You can change this value for different cases



% Initialize counters for linearly independent and dependent sets
indCount2 = 0;
dependCount2 = 0;

for trial = 1:numOfTrials
    % Generate random column vectors
    Y = randn(m, n);

    % Check linear independence
    if rank(Y) == n
        fprintf('Trial %d: Linearly independent set\n', trial);
        indCount2 = indCount2 + 1;
    else
        fprintf('Trial %d: Linearly dependent set\n', trial);
        dependCount2 = dependCount2 + 1;
    end
end

% Display the results
fprintf('\nResults:\n');
fprintf('Linearly independent sets: %d\n', indCount2);
fprintf('Linearly dependent sets: %d\n', dependCount2);


%case3:

m = 10;

% Number of column vectors
n = 12; % You can change this value for different cases



% Initialize counters for linearly independent and dependent sets
indCount3 = 0;
dependCount3 = 0;

for trial = 1:numOfTrials
    % Generate random column vectors
    Y = randn(m, n);

    % Check linear independence
    if rank(Y) == n
        fprintf('Trial %d: Linearly independent set\n', trial);
        indCount3 = indCount3 + 1;
    else
        fprintf('Trial %d: Linearly dependent set\n', trial);
        dependCount3 = dependCount3 + 1;
    end
end

% Display the results
fprintf('\nResults:\n');
fprintf('Linearly independent sets: %d\n', indCount3);
fprintf('Linearly dependent sets: %d\n', dependCount3);



%Q1.1:

%case1:
Ax = randn(11,11); % creating random matrix where rows (m) = columns (n)
b = randn(11,1);% solution vector for Ax
rref([Ax b]) %consistent with unique solution

%case2:
Ax = rand(13,11); % creating random matrix where rows (m) > columns (n)
b = randn(13,1);
rref([Ax b]) %inconsistent solution

%case3:
Ax = randn(11,13); % creating random matrix where rows (m) < columns (n)
b = randn(11,1); 
rref([Ax b]) %consistent with infinitely many solutions (has 2 free variables) 

%Q1.2: giving exceptions for the cases:

%case1: (should be consistent with unique soln)
Ax = [1,0,0;0,1,0;0,0,0]; % creating random matrix where rows (m) = columns (n)
b = [1,1,0]'; %soln vector for Ax

rref([Ax b]) %counter example gives infinitely many solutions

%case2: (should be inconsistent solution)
Ax = [1,0,0;0,1,1;0,0,1;1,1,1]; % creating random matrix where rows (m) > columns (n)
b = [0,0,0,0]';

rref([Ax b]) % counter example gives unique solution set = to 0

%case3: (should be consistent with infinetly many solutions
Ax = [1,0,0,0;0,1,0,0;0,0,0,0]; % creating random matrix where rows (m) < columns (n)
b = [1,1,1]'; 
rref([Ax b]) %counter example gives inconsistent solution


%Q2:
clear all
close all

%Q2.1
s1 = [1,4,1,-1;2,1,0,1;-1,1,2,2;3,8,2,-1];
rref(s1) %check to see if the span s1 is linearly independent or not (c1 = -c4, c2 = c4, c3 = -2c4 c4 = t) therefore c4 is dependent on the others and it is not equal to R^4 because c4 is a free variable

s1m = [1,4,1;2,1,0;-1,1,2;3,8,2]; %s1 modified to be linearly independent with the vector w4 taken out.
rref(s1m) % this now verifies to us that when s1 has the w4 vector taken out, it is linearly independent.

%since there are 3 vectors in s1 that are linearly independent to each other, this means that s1 span{w1,w2,w3,w4} is a hyperplane because it has 3 directional vectors

%Q2.2
z2 = [1,0,2,2]';
z3 = [3,4,0,8]';

z2span = rref([s1m z2]); % this will show us if z2 is a part of span s1
z2span %the rref shows us that the solution is consistent with c3 = 1, c2 = 0 and c1 = 0, therefore z2 is a vector a part of s1

z3span = rref([s1m z3]); %this will show us if z3 is a part of span s1
z3span %the rref shows that the solution is consistent with c3 = 1, c2 = 0, and c1 = 2, therefore z3 is a vector a part of s1


%Q2.3 (letting a = 6 in z1)
s21 = [2,1,3;4,0,4;-2,2,0;6,2,8]; %s2 = span{z1,z2,z3}

s2span1 = rref(s21); % seeing if z1 is linearly dependent or independent to z2 and z3 when a = 6
s2span1 % the rref shows that there are 1 free variables when a = 6. Therefore, z1 is linearly dependent to z2 and z3 which are linearly dependent to each other. therefore s2 is a 2d plane.

%Q2.4 (letting a = 5 in z1 and finding dimonsion of s1 intersection s2)
s22 = [2,1,3;4,0,4;-2,2,0;5,2,8]; %s2 = span{z1,z2,z3}
rref(s22) %shows that s22 is linearly independent when a = 5

int = [s1m -s22 zeros(4,1)]; %finding intersection of s1 and s2
i = rref(int); %rref to get intersection
i %rref of intersection shows us that there are 2 free variables. this means the intersection of the hyperplanes is a 2d plane

