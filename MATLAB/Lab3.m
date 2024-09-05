%Q1.1
A = imread('ngc6543a.jpg');
image(A)

%Q1.2
[r,c,col] = size(A);
blackPixel = 0;
tic
for row = 1:r
    for clm = 1:c
        if A(row, clm, 1) == 0 && A(row, clm, 2) == 0 && A(row, clm, 3) == 0
            blackPixel = blackPixel +1;
        end
    end
end
toc
disp(['for loop: ' num2str(blackPixel)])

%Q1.3
tic
blackPixel_count =  sum(A(:, :, 1)==0 & A(:, :, 2)==0 & A(:, :, 3) == 0, 'all');
toc
disp(['sum function: ', num2str(blackPixel_count)])

%Q1.5
[a1,b1,c1]= my_function(A(:, :, 1));
disp(a1)
disp(b1)


[a2,b2,c2]= my_function(A(:, :, 2));
disp(a2)
disp(b2)


[a3,b3,c3]= my_function(A(:, :, 3));
disp(a3)
disp(b3)

%Q1.6
w = zeros(650,600,3);
w(:,:,1) = c1;
w(:,:,2) = c2;
w(:,:,3) = c3;

figure()
image(w)
saveas(gcf,'ngc6543a-new.jpg') 

%the image after modification becomes more distorted. at first the colors
%are clear and symbolize an atom like shape, however in the modified photo
%the colors are much more intense and one cannot truly tell what the image
%is of. In addition, the darker colors of the original image turn black
%while the lighter colors above 128 become more bright.

%Q1.7
figure;

tiledlayout('Flow')
nexttile;
imshow(A);
title('Image before modification');
axis off;
nexttile;
plot(w,2);
title('Image after modification');
axis off;

print(3,'ngc6543a-twoimages.jpg') 



