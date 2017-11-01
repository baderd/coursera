function rmat = reverse_diag(n)
    rmat = zeros(n, n);
    revidx = (n:-1:1)+(0:n-1)*n;
    rmat(revidx) = 1;
end