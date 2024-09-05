function dctNquantization(delta)
    % Reading the image
    imgOrig = imread('barbara.pgm');
    imshow(imgOrig);
    imgOrig = double(imgOrig); % Convert to double for arithmetic operations
    
    % Step 2: Get 8-point DCT matrix
    T = dct(eye(8));
    
    % Step 3: Create zero matrix for reconstructed image
    [rows, cols] = size(imgOrig);
    imgModified = zeros(rows, cols);
    
    % Step 4: Initialize counter for non-zero coefficients
    nonZeroCount = 0;
    
    % Step 5: Process each 8x8 block
    for i = 1:8:rows
        for j = 1:8:cols
            originalBlck = imgOrig(i:i+7, j:j+7);
            
            % Step 5a: Compute 2D DCT coefficients
            origDCTcoefficients = T * originalBlck * T';
            
            % Step 5b: Quantization and reconstruction
            quantizedDCT = round(origDCTcoefficients / delta) * delta;
            
            % Step 5c: Count non-zero coefficients
            nonZeroCount = nonZeroCount + nnz(quantizedDCT);
            
            % Step 5d: Inverse DCT
            ModifiedBlck = T' * quantizedDCT * T;

            % Step 5e: Display for the first block
            if i==1 && j==1
                    originalBlck
                    origDCTcoefficients
                    quantizedDCT
                    ModifiedBlck
            end
                      
            % Store reconstructed block
            imgModified(i:i+7, j:j+7) = ModifiedBlck;
        end
    end

    
    % Step 6: Display total number of non-zero coefficients
    disp(['Total Non-zero Coefficients: ', num2str(nonZeroCount)]);
    
    % Step 7: Clean up reconstructed image
    round(imgModified);
    imgModified(imgModified > 255) = 255;
    imgModified(imgModified < 0) = 0;
    
    % Step 8: Calculate Mean Squared Error
    MSE = sum(sum((imgOrig - imgModified).^2)) / (rows * cols);
    disp(['Mean Squared Error: ', num2str(MSE)]);
    
    % Step 9: Convert reconstructed image to uint8 and display
    imgModified = uint8(imgModified);
    figure;
    imshow(imgModified);
    
end