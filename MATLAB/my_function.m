%Q1.4
function [a,b,c] = my_function(in2)

a = max(max(in2));

b = sum(in2(:,:) >128, 'all');

e = in2(:,:) > 128; 

c = e.*255;

end