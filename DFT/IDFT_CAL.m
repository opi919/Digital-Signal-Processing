function [y] = IDFT_CAL(signal,N)
    
    y = zeros(1,N);
    
    for n =1 : N
        for k = 1: N
            y(n) = y(n) + (signal(k) * exp(1j * 2 * pi * (k-1) * (n-1)/N));
        end
    end
    y = (1/N)*real(y);
end
        