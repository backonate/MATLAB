clear all
close all

stepsize = [1, 4, 10, 20, 50, 100];

nonzero = [229897, 151727, 83952, 51714, 25430, 13152];

MSE = [0.083556, 1.3044, 6.2474, 16.8652, 58.9102, 144.9532];


figure;
plot(stepsize, MSE,'Marker','+','LineStyle','-')
title('Stepsize vs MSE')
xlabel('Stepsize')
ylabel('MSE')

figure;
plot(stepsize,nonzero,'Marker','+','LineStyle','-')
title('Stepsize vs number of nonzero')
xlabel('Stepsize')
ylabel('num of nonzero')