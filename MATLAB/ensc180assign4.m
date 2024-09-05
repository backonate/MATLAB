%% Q1
x=2:6;
y=[65 67 75 71 68];

Polydegrees = 1:4;
coefficientVCTR = cell(1, length(Polydegrees));
polynomial = cell(1, length(Polydegrees));

% For loop to find polynomials with degrees 1 to 4
for i = 1:length(Polydegrees)
    coefficientVCTR{i} = polyfit(x, y, Polydegrees(i));
    polynomial{i} = poly2sym(coefficientVCTR{i});
    disp(['Degree ' num2str(Polydegrees(i))])
    polynomial{i}
    coefficientVCTR{i}
end

% Plotting the 4 polynomials together
tiledlayout(2, 2);

for i = 1:length(Polydegrees)
    nexttile;
    xRange = linspace(min(x), max(x), 100);
    degree = Polydegrees(i);
    yEstimate = polyval(coefficientVCTR{i}, xRange);
    plot(x, y, 's', xRange, yEstimate);
    title(['Degree ' num2str(degree)]);
    legend('Original Data', 'Polynomial Estimate');
    
    % Calculating MSE value for each case
    yPredicted = polyval(coefficientVCTR{i}, x);
    mse = sum((y - yPredicted).^2)./length(y);
    disp(['Degree ' num2str(degree) ' MSE = ' num2str(mse)]);
end


%% Q2

disp('Q2: ')
syms x y;
%Defining suitable symbolic expressions
eq_1 =(x + 2)^2 + y^2 ==30;
eq_2 =x + 4*y + 2*y^2 ==5;

% Solving the two equations
sol = solve([eq_1, eq_2], [x, y]);
disp('x symbolic solutions: ')
disp(sol.x)
disp('y symbolic solutions: ')
disp(sol.y)

% Converting to numerical values for display
doublesolutions = double(struct2array(sol));
xsols=doublesolutions(:,1)
ysols=doublesolutions(:,2)
nmbrOfSols=length(xsols)

% Verifying solutions of the symbolic equation

for i = 1:4
    x=xsols(i);
    y=ysols(i);

    syms x y

    eq_1_2_check = [subs((x + 2)^2 + y^2,[x y], [xsols(i), ysols(i)]), subs(x + 4*y + 2*y^2,[x y], [xsols(i), ysols(i)])] % Subbing into only left side
    eqCheck_Double = double(eq_1_2_check)
end


% Plotting the curves of the two symbolic eq's and its solutions

figure;
fimplicit(eq_1, [-8, 8, -8, 8], 'r--');
hold on;
fimplicit(eq_2, [-8, 8, -8, 8], 'b-');
stem(doublesolutions(:,1), doublesolutions(:,2), 'fill');
ylabel('y');
xlabel('x');
title('Plot of Symbolic Equations');
legend('Equation 1', 'Equation 2', 'Solutions');
