%Step 1: N = number of bernoulli trials, M = number of experiments, p = success probability 
function lab6bernoulli(N, M, p)
    rng('default'); % Resetting the random number generator
    % Generate N x M matrix of Bernoulli trials
    bern_matrix = (rand(N, M) < p);
    
    % Step 2: Sum of each column in 1d vector (number of successes in each experiment ie 0 or 1)
    colsumvector = sum(bern_matrix);
    
    % Calculating histogram
    edges = -0.5:1:N+0.5; % Bin edges so each value of k is in between edges
    h = histogram(colsumvector, edges); %finding histogram of 1d vector
    
    % Plotting histogram and labeling axes
    title('Histograms Number of Successes');
    xlabel('Number of Successes (k)');
    ylabel('Frequency');
    
    % Estimated probability vector 
    disp('Estimated probability vector:');
    estimatedP = h.Values / M
 
    
    % Step 3: Theoretical probability vector
    disp('Theoretical probability vector:');
    theoreticalP = bino_pk(N, p)

    
    % calculating and displaying average absolute error
    avgabsError = mean(abs(estimatedP - theoreticalP));
    disp(['Average absolute error: ', num2str(avgabsError)]);
    
    % Step 4: Plotting the estimated and theoretical P(k)'s
    figure;
    bar([estimatedP; theoreticalP]');
    title('Estimated vs Theoretical Probabilities of Number of Successes');
    xlabel('Number of Successes (k)');
    ylabel('Probability');
    legend('Estimated', 'Theoretical');
    set(gca, 'XTickLabel',-0.5:1:N+0.5);
end

%step 3: function for thoeretical probability vector
function theoreticalPsuccess = bino_pk(n, p)
    Psuccess = zeros(1, n + 1);
    for k = 0 : n
        Psuccess(k + 1) = nchoosek(n, k) * (p^k) * (1 - p)^(n - k);
    end
    theoreticalPsuccess = Psuccess;
end
