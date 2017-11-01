function qmat = intquad(n, m)
    qmat = zeros(2*n, 2*m);
    qmat(1:n, m+1:end) = ones(n,m);
    qmat(n+1:end, 1:m) = 2*ones(n,m);
    qmat(n+1:end, m+1:end) = 3*ones(n,m);
end