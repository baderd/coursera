function [sinmat, avg_sinmat] = sindeg(degree_mat)
    deg_to_rad = pi/180;
    sm = size(degree_mat);
    sinmat = sin(degree_mat .* deg_to_rad);
    avg_sinmat = sum(sum(sinmat)) / (sm(1) * sm(2));
end