function mygrad = mygradient(y, x)
    % Calculate the numerical differentiation using forward difference for the
    % first sample, backward difference for the last sample, and central
    % difference for other samples of the input vectors x and y.

    % Initialize mygrad vector
    mygrad = zeros(size(y));

    % Forward difference for the first sample
    mygrad(1) = (y(2) - y(1)) / (x(2) - x(1));

    % Central difference for the middle samples
    for i = 2:length(y)-1
        mygrad(i) = (y(i+1) - y(i-1)) / (x(i+1) - x(i-1));
    end

    % Backward difference for the last sample
    mygrad(end) = (y(end) - y(end-1)) / (x(end) - x(end-1));
end

