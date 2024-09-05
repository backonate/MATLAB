%Q1.1
mileToMeter = 1609; %1mile = 1609 m
meterToFeet = 3.28; %1 meter = 3.28 ft

milesPHr = (0:100/14:100)'; %15x1 array 


feetPS = milesPHr* mileToMeter / 3600 * meterToFeet; %converting miles/hour to feet/s (15x1 array)

conversionTbl = [milesPHr, feetPS]; %combining 15x1 arrays to create 15x2 array to show conversions

fprintf('Miles/hour  Feet/second\n');
fprintf('%8.2f     %8.2f\n', conversionTbl'); %displaying the table

%Q1.2
fileID = fopen('conversionTbl.bin', 'wb'); %write array into binary file
fwrite(fileID, conversionTbl, 'double');
fclose(fileID);

%Q1.3
fileID = fopen('conversionTbl.bin', 'r');
data_bin = fread(fileID, [15,2], 'double')
fclose(fileID);

%Q1.4
s = dir('conversionTbl.bin')
%the size of the file in bytes is 240. This is due to the fact that the
%array is 15x2 meaning it has 30 elements. as each element takes up about 8
%bytes - 8 x 30(elements) = 240 bytes.