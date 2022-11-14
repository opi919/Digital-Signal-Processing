clc;
close all;

t=-30:30;
rawInput = sin(pi* t/10)./(pi* t/10);
rawInput(t==0) = 1;
rawImpulse = [zeros(1,3),ones(1,8),zeros(1,3)];


inputLength = length(rawInput);
impulseLength = length(rawImpulse);
convolutionSize = inputLength+impulseLength -1;

%adjusting input and impulse signal length
inputSignal = [rawInput,zeros(1,impulseLength)];
impulseSignal = [rawImpulse,zeros(1,inputLength)];

convo = zeros(1,convolutionSize);

for n = 1: convolutionSize
   for k = 1: n
        convo(n) = convo(n) + inputSignal(k)*impulseSignal(n-k+1);
   end
end

f_convo = conv(rawInput,rawImpulse);

subplot(421);
stem(rawInput);
title('Input Signal');
grid on;

subplot(422);
stem(rawImpulse);
title('Impulse Signal');
grid on;

subplot(413);
stem(convo);
title('convoluted signal');
grid on;

subplot(414);
stem(f_convo);
title('convoluted signal(Matlab conv function)');
grid on;



