function flipped_vec = flip_it(vec)
    sm = size(vec);
    idx = sm(2):-1:1;
    flipped_vec = vec(idx);
end