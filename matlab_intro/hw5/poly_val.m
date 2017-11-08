function p = poly_val(c0, c, x)
if isempty(c)
    p=c0;
    return
elseif isscalar(c)
    p=c0 + c*x;
    return
else
    csize = size(c);
    % test for row vec
    if csize(1) > csize(2)
        c = c';
        csize = size(c);
    end
    xvec = x .^ (1:csize(2));
    p = c0 + sum(c .* xvec);
end
