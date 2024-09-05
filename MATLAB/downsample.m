%Q2.2
function downsample(imageName)
%Q2.21: Reading the input image
    inpImg = imread(imageName);
    
% Displaying the input image & Displaying pixel values of the first 8x8 block
    figure;
    imshow(inpImg);
    inpImg(1:8, 1:8)
    
%Q2.22: Perform max pooling
    dscaledImg = max_pool(inpImg);
    
%Q2.23: Display the downsampled image &  Display pixel values of the first 4x4 block
    figure;
    imshow(dscaledImg);
    dscaledImg(1:4, 1:4)
    
%Q2.24: Save the downsampled image with postfix '1'
    [~, name, ext] = fileparts(imageName);
    newImg = strcat(name, '1', ext);
    imwrite(dscaledImg, newImg, 'pgm');
    
%Q2.25: call max pooling on the downsampled image in order to downsample again
    finalDscaledImg = max_pool(dscaledImg);
    
% Display the final downsampled image & Display pixel values of the first 2x2 block
    figure;
    imshow(finalDscaledImg);
    finalDscaledImg(1:2, 1:2)
    
% Saving final downsampled image with postfix 2
    newImg = strcat(name, '2', ext);
    imwrite(finalDscaledImg, newImg, 'pgm');
end
