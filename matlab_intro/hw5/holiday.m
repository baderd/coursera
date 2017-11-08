function isfree = holiday(m, d)
if m==1 && d==1 || m==7 && d==4 || m==12 && d==25 || m==12 && d==31
    isfree = true;
else
    isfree = false;
end