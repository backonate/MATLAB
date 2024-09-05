function outputIMG = lab9upsample(inpArray)
    % Convert input to double
    inpArray = double(inpArray);
    
    % Get input image size
    [rows, cols] = size(inpArray);
    
    % Create output image with twice the size
    outputIMG = zeros(2*rows, 2*cols);
    
    % Copy input to output with step size of 2
    outputIMG(1:2:end, 1:2:end) = inpArray;
    
    % Row interpolation
    outputIMG(:, 2:2:end-1) = (outputIMG(:, 1:2:end-2) + outputIMG(:, 3:2:end)) / 2;
    outputIMG(:, end) = outputIMG(:, end-1);  % Last column of the row

    % Column interpolation
    outputIMG(2:2:end-1, :) = (outputIMG(1:2:end-2, :) + outputIMG(3:2:end, :)) / 2;
    outputIMG(end, :) = outputIMG(end-1, :); % Last row of the column
    
    % Convert to uint8 and return
    outputIMG = uint8(outputIMG);
end