function ss=spiral_diag_sum(n)
    if n==0
        ss=0;
    elseif n==1
        ss=1;
    else
        ss=1;
        layer=2;
        lastmax=1;
        for i=3:+2:n
            newmax = i*i;
            corners = lastmax:layer:newmax;
            ss = ss + sum(corners(2:end));
            lastmax = newmax;
            layer = layer+2;
        end
    end
end