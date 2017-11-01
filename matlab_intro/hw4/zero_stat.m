function zero_perc = zero_stat(binarymat)
    n1 = sum(sum(binarymat));
    sm = size(binarymat);
    nmat = sm(1) * sm(2);
    zero_perc = (nmat-n1)/nmat * 100;
end