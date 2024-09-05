function lab7thresh(T)
    
    load handel.mat; % Loading audio signal
    y = y(1:25600); % Taking first 25600 samples

    
    figure; % Ploting the original signal
    plot(y);
    title('Original Signal');

    
    sound(y, Fs); % Playing original signal
    pause(5); % Waiting for sound to finish
  
    y2 = y; %making a copy, Time domain and thresholding to be able to calculate MAE
    y2(abs(y2) < T) = 0;

    
    MAEy2 = mean(abs(y2 - y)); % Calculating MAE for time domain thresholding of c
    fprintf('MAE for y2 with T = %.1f: %f\n', T, MAEy2);

    
    figure; % Ploting the processed signal
    plot(y2);
    title(['Time Domain Processing with Threshold T = ' num2str(T)]);

    sound(y2, Fs); % Playing the processed signal
    pause(5); % Waiting for sound to finish

    
    y3 = y; % obtaining DCT domain thresholding by making another copy 
    blockSize = 64;

    for i = 1:blockSize:length(y3)-blockSize+1 %dividing d into blocks of 64 samples
        block = y3(i:i+blockSize-1);
        dctBlock = dct(block); %transforming signal into DCT
        dctBlock(abs(dctBlock) < T) = 0;
        y3(i:i+blockSize-1) = idct(dctBlock);
    end

    
    MAEy3 = mean(abs(y3 - y)); % Calculating MAE for DCT domain thresholding (d)
    fprintf('MAE for y3 with T = %.1f: %f\n', T, MAEy3);

    
    figure; % Plotting the DCT domain processed signal
    plot(y3);
    title(['DCT Domain Processing with Threshold T = ' num2str(T)]);

    
    sound(y3, Fs); % Playing the DCT domain processed signal (d)
    pause(5); % Wait for sound to finish
end

