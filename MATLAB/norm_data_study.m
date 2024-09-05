function norm_data_study(data)
  
    figure;  %plotting histogram with data
    h=histogram(data);

    
    avgGr = mean(data); % Calculating mean and standard deviation 
    stdeviation = std(data, 1);
    disp(['Mean = ', num2str(avgGr)]);
    disp(['Standard Deviation = ', num2str(stdeviation)]);

    
    prblty = zeros(1, 3); % Calculate probabilities
    for i = 1:3
        prblty(i) = sum(abs(data - avgGr) <= i * stdeviation) / numel(data);
    end
    prblty

    % Calculating probabilities with standard normal distribution
    prbltyTotal = [normcdf(1) - normcdf(-1), normcdf(2) - normcdf(-2), normcdf(3) - normcdf(-3)]


    
    absolutError = abs(prbltyTotal - prblty) % Calculating absolute error
end