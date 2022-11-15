clc; close all;

f1=1000;
a1 = 3;
f2=2000;
a2=5;


N=30;
fs = 6000;
T = 1/fs;
ts = 0 : T : (N-1)/fs;

s = a1*sin(2*pi*f1*ts) + a2*sin(2*pi*f2*ts + (3*pi)/4);
% Corrupt the signal with zero-mean white noise
signal = s + 4*1;

% matlab fft function
dft_f = fft(signal, N);
freq = linspace(0, fs , N);

% calculate dft
dft = DFT_CAL(signal,N);

idft = IDFT_CAL(dft,N);

subplot(4,2,[1,2])
plot(ts,signal,'-o');
title('Input Signal');

subplot(423)
stem(freq,abs(dft));
title('Magnitude');

subplot(424)
stem(freq,angle(dft));
title('Phase');

subplot(425)
stem(freq,abs(dft_f));
title('Magnitude (fft)');

subplot(426)
stem(freq,angle(dft_f));
title('Phase (fft)');

subplot(4,2,[7,8])
plot(ts,idft,'r-o');
title('Inverse DFT');
