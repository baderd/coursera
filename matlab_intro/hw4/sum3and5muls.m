function sum35 = sum3and5muls(n)
    threes = 3:3:n;
    fives = 5:5:n;
    uni35 = unique([threes, fives]);
    sum35 = sum(uni35);
end