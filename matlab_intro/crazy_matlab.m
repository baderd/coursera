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

% logical operators differ in syntax betw scalars and arrays
[12 4234 435] & [456  54 0]
1 && 1

% inside functions params
% nargin and nargout

% return matrix as vector
randmat = rand(2,3);
randmat(:);




