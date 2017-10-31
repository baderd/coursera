function topmat = top_right(mat, n)
    sm = size(mat);
    rowidx = 1:n;
    colidx = sm(2)-n+1:sm(2);
    topmat = mat(rowidx, colidx);
end