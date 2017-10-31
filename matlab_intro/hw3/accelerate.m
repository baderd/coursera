function amag = accelerate(F1,F2,m)
    sumf = F1 + F2
    acc = sumf' ./ m
    amag = sqrt(sum(acc .^2))
end