function [p, ind]= max_product(v,n)
    p = -Inf;
    ind = -1;
    if length(v) < n
        p = 0;
        ind = -1;
        return
    end
    
    for starti=1:length(v)-n+1
        act_prod = 1;
        for j=starti:starti+n-1
            act_prod = act_prod * v(j);
        end
        if act_prod > p
            p = act_prod;
            ind = starti;
        end
    end
end