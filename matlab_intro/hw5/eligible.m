function has_passed = eligible(v, q)
    avg_gre = mean([v,q]);
    if avg_gre >= 92 && v > 88 && q > 88
        has_passed = true;
    else
        has_passed = false;
    end
end
