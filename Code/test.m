fs = 100;                                % Sample frequency (Hz)
t = 0:1/fs:10-1/fs;                      % 10 sec sample
x = (1.3)*sin(2*pi*15*t) + (1.7)*sin(2*pi*40*(t-2)) + 2.5*gallery('normaldata',size(t),4); % 15 Hz component ,40 Hz component,  Gaussian noise

figure;
plot(t,x)
figure;
plot(t,(1.3)*sin(2*pi*15*t))
figure;
plot(t,(1.7)*sin(2*pi*40*(t-2)))
figure;
plot(t,2.5*gallery('normaldata',size(t),4))


keyboard();
m = length(x);          % Window length
n = pow2(nextpow2(m));  % Transform length
y = fft(x,n);           % DFT
f = (0:n-1)*(fs/n);     % Frequency range
power = y.*conj(y)/n;   % Power of the DFT

figure;
plot(f,power)
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf Periodogram}')

y0 = fftshift(y);          % Rearrange y values
f0 = (-n/2:n/2-1)*(fs/n);  % 0-centered frequency range
power0 = y0.*conj(y0)/n;   % 0-centered power

figure;
plot(f0,power0)
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf 0-Centered Periodogram}')