function res = halfsum(m)
    sm = size(m);
    
    res=0;
    icol=1;
    for row = sm(1):-1:1
        for col = icol:sm(2)
            res = res + m(row, col);
        end
        if icol == sm(2)
            return
        end
        icol = icol+1;
    end
end