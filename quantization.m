clc;
close all;

t = 0:0.001:1;
f=2;

cSignal = 10 * sin(2 * pi * f * t) + 20 * sin(2 * pi * 2*f * t); %continuous signal
plot(t,cSignal);
hold on;
ylabel('Amplitude');
xlabel('Sampling');
grid on;

fs=40;
ts=0:1/fs:1;

sSignal = 10 * sin(2 * pi * f * ts) + 20 * sin(2 * pi * 2*f * ts);  %sampled signal
plot(ts,sSignal,'--o');
hold on;

nBits = 1;
qLvl = 2^(nBits);

xMax = max(sSignal);
xMin = min(sSignal);
sFactor = round((xMax-xMin)/qLvl);

qSignal = round(sSignal/sFactor)*sFactor;
plot(ts,qSignal,'g','DisplayName',char({'Quantized signal'}));
legend('location', 'best');
