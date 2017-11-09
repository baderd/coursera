function mbd = spherical_mirror_aberr(fn,D)
    delta_x = 0.01;
    x = 0:delta_x:D/2;
    
    %fn = f/D
    f = fn * D;
    
    % get d
    % delta = arcsin(x / (2*f));
    % sin(delta) = x/(2*f);
    d = 2*f * tan(2*delta) * (1/cos(delta) -1);
end
