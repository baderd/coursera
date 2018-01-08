function res_class = integerize(mat)
    vecmat = mat(:);
    res_class = 'NONE';
    for it = {'int8', 'int16', 'int32' , 'int64'}
        iclass = it{1};
        if all(intmin(iclass) <= vecmat) & all(vecmat <= intmax(iclass))
            res_class = iclass;
            return;
        end
    end
end

