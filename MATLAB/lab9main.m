% Reading and displaying the original image
origIMG = imread('cameraman.pgm');
imshow(origIMG);

fprintf('Original Image Size: %d x %d\n', size(origIMG));

% Displaying the last 2x2 block
lastBlckIMG = origIMG(end-1:end, end-1:end);
fprintf('Last 2x2 block of Original Image:\n');
disp(lastBlckIMG);

% Upsampling the original image
upsampledIMG = lab9upsample(origIMG);

% Displaying the upsampled image
figure;
imshow(upsampledIMG);

fprintf('Upsampled Image Size: %d x %d\n', size(upsampledIMG));


% Displaying the last 4x4 block of upsampled image
lastBlckUnsmpled = upsampledIMG(end-3:end, end-3:end);
fprintf('Last 4x4 block of Upsampled Image:\n');
disp(lastBlckUnsmpled);

% Saving the upsampled image
saveas(gcf, "camerman2.pgm");

% Upsampleing the upsampled image again
upsampledX2 = lab9upsample(upsampledIMG);

% Displaying the twice upsampled image
figure;
imshow(upsampledX2);

fprintf('Twice Upsampled Image Size: %d x %d\n', size(upsampledX2));

% Displaying the last 8x8 block of twice upsampled image
last_block_upsampled_twice = upsampledX2(end-7:end, end-7:end);
fprintf('Last 8x8 block of Twice Upsampled Image:\n');
disp(last_block_upsampled_twice);
%saving the displayed image
saveas(gcf, "camerman4.pgm");



