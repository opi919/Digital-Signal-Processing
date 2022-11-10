clc;
close all;

t = 0:0.001:1;
f=5;

cSignal = sin(2*pi*f*t);
plot(t,cSignal);
hold on;

fs=9;
ts=0:1/fs:1;

sSignal = sin(2*pi*f*ts);
plot(ts,sSignal,'--o');
hold on;

if fs<2*f
   alias_f = abs(f-(round(f/fs)*fs));
   if fs>f
       alias_s = sin(2*pi*alias_f*t + pi);
   else
       alias_s = sin(2*pi*alias_f*t);
   end
   plot(t,alias_s,'r');
   title(['Aliased frequency ' num2str(alias_f) 'Hz']);
else
    title('No aliasing');
end