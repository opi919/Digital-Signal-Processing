clc;
close all;

f=32;
t= 0:0.001:1;
rawSignal = sin(2*pi*f*t);
signalLength = length(rawSignal);

correlationSize = signalLength+signalLength-1;


