clear all;
close all;
%% Initialization
load handel.mat
Fs = 400e3;
y = resample(y.', Fs, 8192);
t = linspace(0, length(y)/Fs, length(y));
fc = 100e3;
ka = 1;
c = cos(2*pi*fc*t);
m = y;
clear y;
envelope = (1+ka*m);
s = (1+ka*m).*c;
NFFT = length(t);
f = -Fs/2:Fs/NFFT:Fs/2-Fs/NFFT;

%% Generating AM Signal
figure
subplot(2, 1, 1)
plot(t, s, 'r', LineWidth=2, DisplayName='AM Modulated Signal');
hold on
plot(t, abs(hilbert(s)), 'g', LineWidth=2, DisplayName='Envelope');
title("AM Modulated Signal");
xlabel('$Time (Sec)$', Interpreter='latex');
grid on
legend
subplot(2,1,2)
plot(t, m, 'r', LineWidth=2);
title('Message Signal');
xlabel('$Time (Sec)$', Interpreter='latex');
grid on

%% Demodulating The Signal using Envelope Detector
demod_envelope = abs(hilbert(s)) - 1;

figure
subplot(2,1,1)
plot(t, demod_envelope, 'r', LineWidth=2, DisplayName='Detected Envelope')
title('Demodulated AM Signal using Envelope Detector');
xlabel('$Time (Sec)$', Interpreter='latex');
grid on
legend

subplot(2,1,2)
plot(t, m, 'r', LineWidth=2);
title('Message Signal');
xlabel('$Time (Sec)$', Interpreter='latex');
grid on

ssp = resample(demod_envelope, 8192, Fs);
%% Demodulating The Signal using Synchronous Method
load('LPF_Audio.mat');
d = s.*cos(2*pi*fc*t);
figure
subplot(2,1,1)
md = filter(Hd, d) - 0.5;
plot(t, md, 'r', LineWidth=2);
title('Demodulated Signal using Synchronous method');
grid on;
subplot(2,1,2)
plot(t, m, 'r', LineWidth=2);
title('Message Signal');
grid on;

sss = resample(md, 8192, Fs);
%% FFT
M = abs(fftshift(fft(m)));
S = abs(fftshift(fft(s)));
MD = abs(fftshift(fft(md)));
DEMOD_ENV = abs(fftshift(fft(demod_envelope)));
figure
subplot(4,1,1)
plot(f, M, LineWidth=2);
xlabel("$Frequency (Hz)$", Interpreter="latex");
ylabel("$M(f)$", Interpreter="latex");
xlim([-6e3, 6e3]);
title("Frequency Spectrum of Message Signal");
subplot(4,1,2)
plot(f, S, LineWidth=2);
xlabel("$Frequency (Hz)$", Interpreter="latex");
ylabel("$S(f)$", Interpreter="latex");
title("Frequency Spectrum of Modulated Signal");
subplot(4,1,3)
plot(f, MD, LineWidth=2);
xlabel("$Frequency (Hz)$", Interpreter="latex");
ylabel("$\widehat{M}(f)$", Interpreter="latex");
xlim([-6e3, 6e3]);
title("Frequency Spectrum of Demodulated Signal using Synchron method");
subplot(4,1,4)
plot(f, DEMOD_ENV, LineWidth=2);
xlabel("$Frequency (Hz)$", Interpreter="latex");
ylabel("$\widehat{M}(f)$", Interpreter="latex");
xlim([-6e3, 6e3]);
title("Frequency Spectrum of Demodulated Signal using Envelope Detector");

AM_sound_gui();
