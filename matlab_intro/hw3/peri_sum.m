function psum = peri_sum(mat)
    sm = size(mat);
    vec = [mat(1,1:end), mat(end, 1:end), mat(2:end-1, 1)', mat(2:end-1, end)'];
    psum = sum(vec);
end