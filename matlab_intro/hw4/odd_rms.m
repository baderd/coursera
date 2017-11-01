function orms = odd_rms(n)
    allint = 1:2*n;
    oddint = 1:2:max(allint);
    orms = sqrt(mean(oddint .^2));
end