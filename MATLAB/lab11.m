function lab11(cfg, N)
    % Defining the sample vector x
    x = linspace(0, 3, N);

    % Selecting the function based on cfg value
    if cfg == 1
        y = sin(x);
    elseif cfg == 2
        y = exp(-x) .* sin(x);
    end

    % Calculating the gradient 
    slope = gradient(y, x);

    % Calculating the forward difference and backward difference approximations
    forwardDiff = diff(y)./diff(x);
    backwardDiff = diff(y)./diff(x);
    
    % Calling mygradient function to calculate derivative
    derivative = mygradient(y, x);

    % Plotting the different graphs
    figure;
    plot(x, y, 'g-', 'LineWidth', 2); hold on;
    plot(x, slope, 'b-.', 'LineWidth', 1.5);
    legend('Original graph (y)', 'gradient()')
    xlabel('x');
    ylabel('y');

    figure;
    plot(x, slope, 'b-', 'LineWidth', 1.5); hold on;
    plot(x(1:length(x)-1), forwardDiff, 'r--', 'LineWidth', 1.5);
    plot(x(2:length(x)), backwardDiff, 'k:', 'LineWidth', 1.5);
    plot(x, derivative, 'm-.', 'LineWidth', 1.5); 
    grid on;
    legend('gradient()', 'Forward difference', 'Backward difference', 'mygradient()');
    xlabel('x');
    ylabel('y');
    

    % Calculating mean absolute errors
    errorForward = mean(abs(slope(1:length(slope)-1) - forwardDiff));
    errorBackward = mean(abs(slope(2:length(slope)) - backwardDiff));
    errorMyGrad = mean(abs(slope - derivative));
    

    disp(['Mean Absolute Error (Forward Difference): ', num2str(errorForward)]);
    disp(['Mean Absolute Error (Backward Difference): ', num2str(errorBackward)]);
    disp(['Mean Absolute Error (mygradient()): ', num2str(errorMyGrad)]);
    disp(['Error vector: ',num2str(slope - derivative)])
end
