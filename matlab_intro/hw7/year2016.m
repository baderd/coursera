function y = year2016(m)

if ~isscalar(m) || m<1 || m>12 || floor(m)~=ceil(m) 
   y=[];
   return
end

% m=2;
all_months = {'January', 'February', 'March', 'April','May', 'June', 'July', ...
    'August','September', 'October', 'November', 'December'};
mname = all_months{m};
l = eomday(2016, m);  
y=[];  

for d = 1:l
    [~, wdname] = weekday(datenum([num2str(d, '%02d') '.' mname '.2016' ], 'dd.mmmm.yyyy'));
    myday.month = mname;
    myday.date = d;
    myday.day = wdname;
    y = [y myday];
end

y = y';
