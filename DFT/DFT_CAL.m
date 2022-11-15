function [y] = DFT_CAL(signal,N)

y = zeros(1,N,'double');
for k = 1 : N
    for n = 1:N
       y(k) = y(k) + (signal(n) * exp(-1j * 2 * pi * (k-1) * (n-1)/N)); 
    end
end
end