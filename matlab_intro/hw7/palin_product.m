function n=palin_product(dig, lim)
% dig=2
% lim=500

minnum = 10^(dig-1);
maxnum = 10^dig -1;
palin = [];

for i=minnum:maxnum
    for j=minnum:maxnum
        x =i*j;
        if x >= lim
            break
        else
            xchar = num2str(x);
            if strcmp(xchar, flip(xchar))
               palin = [palin x]; 
            end
        end
    end
end

if isempty(palin)
    n=0;
else
    palin = sort(palin);
    n=palin(end);
end


