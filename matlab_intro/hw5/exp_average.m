function res = exp_average(in, w)
    persistent out;
    persistent b;
    %reset
    if nargin==0
        out = [];
        b  = [];
    end
    % fct
    if nargin==2
        out = in;
        b = w;
    elseif nargin==1 && isempty(b)
        out = in;
        b = 0.1;
    else
        lastout = out;
        x = in;
        out = b * x + (1-b) * lastout;
    end
    res = out;
end
