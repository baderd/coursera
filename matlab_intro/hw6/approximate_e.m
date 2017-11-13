function [e, k]=approximate_e(delta)
    e = 1;
    k = 0;
    while exp(1)-e > delta
        k = k+1;
        numerator = 1;
        for f=1:k
            numerator = numerator * f;
        end
        e = e + 1/numerator;
    end
end