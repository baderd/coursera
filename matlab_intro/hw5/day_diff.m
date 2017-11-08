function dd = day_diff(m1, d1, m2, d2)
    monlen = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];    
    % scalar
    if ~(isscalar(m1) && isscalar(d1) && isscalar(m2) && isscalar(d2))
        dd = -1;
        fprintf("no scalar\n");
        return;
    end
    %integer
    if ~( ceil(m1)==floor(m1) && ceil(d1)==floor(d1)...
            && ceil(m2)==floor(m2) && ceil(d2)==floor(d2))
        dd = -1;
        fprintf("no int\n");
        return;
    end
    
    % max value
    if ~(m1<13 && m2<13 && d1<32 && d2<32 ...
            && m1>0 && m2>0 && d1>0 && d2>0)
        dd = -1;
        fprintf("extreme\n");
        return;
    end
    % valid dates
    if ~(d1<= monlen(m1) && d2<= monlen(m2))
        dd = -1;
        fprintf("no valid day\n");
        return;
    end
   
        
    tot1 = sum(monlen(1:m1-1)) + d1;
    tot2 = sum(monlen(1:m2-1)) + d2;
    dd = abs(tot1 - tot2);
end
