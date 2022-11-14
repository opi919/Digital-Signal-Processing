clc;
close all;

f1=64;
t1= 0:1/f1:1;
rawFirstSignal = sin(2*pi*5*t1);
firstSignalLength = length(rawFirstSignal);

f2=64;
t2=0:1/f2:1;
rawSecSignal = sin(2*pi*5*t2);
secSignalLength = length(rawSecSignal);

correlationSize = firstSignalLength+secSignalLength-1;

%adjusting length
firstSignal = [rawFirstSignal,zeros(1,secSignalLength)];
secSignal = [zeros(1,firstSignalLength),rawSecSignal];

outputSignal = zeros(1,correlationSize);
lag = zeros(1,correlationSize);

size = length(secSignal);
lag_val = secSignalLength*-1;

for n = 1 : correlationSize
    lag(n) = lag_val+1;
    for k = 1 : n
        outputSignal(n) = outputSignal(n) + (firstSignal(k) * secSignal(size - n + k));
    end
    lag_val = lag_val + 1;
end

%correlation function
[f_correlation,f_lag] = xcorr(rawFirstSignal,rawSecSignal);

subplot(421)
plot(rawFirstSignal,'r--o');
title('Input Signal 1');
grid on;

subplot(422)
plot(rawSecSignal,'b--o');
title('Input Signal 2');
grid on;

subplot(413)
plot(lag,outputSignal);
title('Correlation Signal');
grid on;

subplot(414);
plot(f_lag,f_correlation);
title('Correlation (using matlab function)');
grid on;

