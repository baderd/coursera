function even_mat = even_index(mat)
    sm = size(mat);
    even_row = 2:2:sm(1);
    even_col = 2:2:sm(2);
    even_mat = mat(even_row, even_col);
end