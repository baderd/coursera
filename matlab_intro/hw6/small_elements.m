function idxs = small_elements(m)
    idxs = [];
    sm = size(m);
    for j = 1:sm(2)
        for i = 1:sm(1)
            if m(i,j) < i*j
                idxs = [idxs; [i j]];
            end
        end
    end
end