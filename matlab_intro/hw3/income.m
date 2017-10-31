function toti = income(rate_hour, price)
    days_per_week = 6;
    hours_per_day = 2*8;
    num_items = rate_hour .* hours_per_day .* days_per_week
    toti = sum(num_items .* price)
end