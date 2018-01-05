function cent=centuries(y)
% y=1

if ~isscalar(y) || floor(y) ~=ceil(y) || y <1 || y >3000
    cent = '';
    return
end

roman = {'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'};

num1 = ceil(y/100);
rest = mod(num1, 10);
if rest==0
    x='';
else
    x = roman(rest);
end

cent = repelem('X', floor(num1/10));
cent = char(strcat(cent, x))



