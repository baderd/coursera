function res = dial(input)

uppletter = char((1:26)-1+'A');
legalletter = ['0123456789', uppletter];


if ~all(ismember(input, legalletter)) || length(input)>16 || ismember(1, regexp(input, '0'))
   res=uint64(0);
   return;
end

dick.A = '2';
dick.B = '2';
dick.C = '2';
dick.D = '3';
dick.E = '3';
dick.F = '3';
dick.G = '4';
dick.H = '4';
dick.I = '4';
dick.J = '5';
dick.K = '5';
dick.L = '5';
dick.M = '6';
dick.N = '6';
dick.O = '6';
dick.P = '7';
dick.Q = '7';
dick.R = '7';
dick.S = '7';
dick.T = '8';
dick.U = '8';
dick.V = '8';
dick.W = '9';
dick.X = '9';
dick.Y = '9';
dick.Z = '9';

res = [];
for i = input
    if isnan(str2double(i))
        appchar = dick.(i);
    else
        appchar = i;
    end

    res = [res appchar];
end


res = uint64(str2double(cellstr(res)));

end