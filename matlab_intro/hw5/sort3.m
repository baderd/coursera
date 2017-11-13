function [small medi large] = sort3(v)
    small =0; medi=0; large=0;
    if v(1) < v(2)
        if v(1) < v(3)
            small = v(1);
            if v(2) < v(3)
                medi = v(2);
                large = v(3);
            else
                medi = v(3);
                large = v(2);
            end
        else
            small = v(3);
            medi = v(1);
            large = v(2);
        end
    else
        if v(2) < v(3)
            small = v(2);
            if v(1) <= v(3)
                medi = v(1);
                large = v(3);
            else
                medi = v(3);
                large = v(1);
            end
        else
            small = v(3);
            medi = v(2);
            large = v(1);
        end
    end
    
end
