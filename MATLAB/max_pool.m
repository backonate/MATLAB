%Q2.1
function output = max_pool(input)
    [m, n] = size(input);
    output = zeros(m/2, n/2, 'uint8');
    for i = 1:m/2
        for j = 1:n/2
            output(i,j) = max(max(input(2*i-1:2*i, 2*j-1:2*j)));
        end
    end
end