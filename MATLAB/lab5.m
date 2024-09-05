
%Q1.1: Defining a column vector of n integers from 5 to 13
n = (5:13)';

%Q1.2: Calculating the factorials (n!)
fctrls = factorial(n);

%Q1.3: Calculating log values of n!
log_fctrls = log10(fctrls);

%Q1.4: Combining column vectors into a table
tble = table(n, fctrls, log_fctrls);

%Q1.5 Changing properties of the table (column titles)
tble.Properties.VariableNames = {'n', 'n!', 'log10(n!)'};

%Q1.6: Displaying the table
tble

%Q1.7: Creating a figure and commands to plot 2 subfigures
figure;
tiledlayout('flow');

%Q1.71/1.73: Plotting first subfigure (n, n!)
nexttile;
plot(n, fctrls, '-s', 'LineWidth', 2, 'MarkerSize', 5.5, 'Color', 'm');
xlabel('n');
ylabel('n!');
title('Factorial Function');
grid on;

%Q1.72/1.73: Plotting the second subfigure (n, log10(n!))
nexttile;
plot(n, log_fctrls, '-o', 'LineWidth', 2, 'MarkerSize', 5.5);
xlabel('n');
ylabel('log_{10}(n!)');
title('Logarithm of Factorial Function');
grid on;



