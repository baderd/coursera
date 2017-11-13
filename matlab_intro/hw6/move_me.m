function m = move_me(v, a)
    ia = [];
    if nargin==1
        a = 0;
    end
    for i=1:length(v)
        if v(i)==a
            ia = [ia i];
        elseif v(i)==0
            inull = [inull i];
        end
    end
    
    stay_idx = 1:length(v);
    m = v([setdiff(stay_idx, ia) ia]);
end