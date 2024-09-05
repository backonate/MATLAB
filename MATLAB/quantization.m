function quantization(delta)
    % Step 1: Read the image
    img = imread('barbara.pgm');
    imshow(img);
    img = double(img); % Convert to double for arithmetic operations
    
    % Step 2: Get 8-point DCT matrix
    T = dct(eye(8));
    
    % Step 3: Create zero matrix for reconstructed image
    [rows, cols] = size(img);
    reconstructed_img = zeros(rows, cols);
    
    % Step 4: Initialize counter for non-zero coefficients
    non_zero_count = 0;
    
    % Step 5: Process each 8x8 block
    for i = 1:8:rows
        for j = 1:8:cols
            original_block = img(i:i+7, j:j+7);
            
            % Step 5a: Compute 2D DCT coefficients
            original_dct_coefficients = T * original_block * T';
            
            % Step 5b: Quantization and reconstruction
            quantized_dct = round(original_dct_coefficients / delta) * delta;
            
            % Step 5c: Count non-zero coefficients
            non_zero_count = non_zero_count + nnz(quantized_dct);
            
            % Step 5d: Inverse DCT
            reconstructed_block = T' * quantized_dct * T;

            % Step 5e: Display for the first block
            if i==1 && j==1
                    original_block
                    original_dct_coefficients
                    quantized_dct
                    reconstructed_block
            end
                      
            % Store reconstructed block
            reconstructed_img(i:i+7, j:j+7) = reconstructed_block;
        end
    end

    
    % Step 6: Display total number of non-zero coefficients
    disp(['Total Non-zero Coefficients: ', num2str(non_zero_count)]);
    
    % Step 7: Clean up reconstructed image
    round(reconstructed_img);
    reconstructed_img(reconstructed_img > 255) = 255;
    reconstructed_img(reconstructed_img < 0) = 0;
    
    % Step 8: Calculate Mean Squared Error
    mse = sum(sum((img - reconstructed_img).^2)) / (rows * cols);
    disp(['Mean Squared Error: ', num2str(mse)]);
    
    % Step 9: Convert reconstructed image to uint8 and display
    reconstructed_img = uint8(reconstructed_img);
    figure;
    imshow(reconstructed_img);
    
end
