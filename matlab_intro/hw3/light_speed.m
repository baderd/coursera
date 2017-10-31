function [v1, v2] = light_speed(dist_km_rowvec)
    mile_in_km = 1.609;
    ls_in_km_min = 300000 * 60;
    v1 = dist_km_rowvec ./ ls_in_km_min;
    v2 = dist_km_rowvec ./ mile_in_km;
end