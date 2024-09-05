clear all
close all
load handel.mat
sound(y, Fs);
figure;
plot(y)
figure;
plot(y(4000 : 4300))
norm_data_study(y)