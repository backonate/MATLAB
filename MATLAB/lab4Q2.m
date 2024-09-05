%Q2
clear all
close all

%Q2.1
%opening text file, inputting proper information, formatting it and closing the file
fileID = fopen('info.txt', 'w');

fprintf(fileID,'%-12s %12s %12s\n','ID', 'Number', 'Grade');
info = [
1, 301011234, 100;
2, 301022468, 85;
3, 201037890, 93;
4, 123456789, 67;
5, 987654321, 34];
fprintf(fileID,'%-12d %12d %12d\n',info');
fclose(fileID);

%Q2.2 (creating integer array)
fileID = fopen('info.txt', 'r');
x = fgetl(fileID);
disp(x);

info = fscanf(fileID, '%d', [3,inf])' 
fclose(fileID);

%Q2.3(calculating avg and rounding)
avgGr = mean(info(:,3));
fprintf('Average grade is: %0.2f\n', avgGr)
