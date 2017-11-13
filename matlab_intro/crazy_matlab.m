% 
% Matlab features, I would not think of
%

% ellipsis for multiline commands
long_sum = sum([ 1 ...
    2 ...
    3 ...
    ]);

% max() returns both maximum and its index if needed
[maxi, idx_maxi] = max([1 10 2 3]);

% also size() results can be assigned to two scalars
[rows, cols] = size(rand(2,3));

% diag() creates a matrix with given input on diagonal
dd = diag([1 3 56 9]);

% restart random number generator
rng(0);
rr = rand;
rng(0);
rr - rand;

% basic plot and legend
plot(1:2, rand(2));
legend('a','b');
close()

% every non-zero number is TRUE
if -1
    fprintf("this was true\n")
end
if 0.25
    fprintf("this was true\n")
end






