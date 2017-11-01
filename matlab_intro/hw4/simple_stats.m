function stats = simple_stats(mat)
    sm = size(mat);
    stats = zeros(sm(1), 4);
    stats(:,1) = mean(mat')';
    stats(:,2) = median(mat')';
    stats(:,4) = max(mat')';
    stats(:,3) = min(mat')';
end