clear all
close all

permcombs = [];

for n = 2 : 5
    for k = 0:n
        combs = nchoosek(n,k);
        perms = factorial(n)/factorial(n-k);
        permcombs = [permcombs; n, k,combs,perms];
    end
end

tbl = array2table(permcombs, 'VariableNames', ...
    {'n', 'k', 'C(n, k)', 'P(n, k)'})