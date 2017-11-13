function T = pendulum(L, a0)
    delta_t = 1e-6;
    w = 0;
    delta = a0;
    timesteps = 0;
    if L==0
        T=0;
        return
    end
    
    while delta > 0
       alpha = (-9.8) * sin(delta) / L;
       w = w + alpha * delta_t;
       delta = delta + w * delta_t;
       timesteps = timesteps+1;
    end
    T = timesteps * delta_t * 4;
end
