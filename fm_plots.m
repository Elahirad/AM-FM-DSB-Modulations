close all;
fm_before_md = out.fm_before_md;
fm_after_md = out.fm_after_md;
fm_after_cn = out.fm_after_cn;
fm_after_dmd = out.fm_after_dmd;

FFT_LENGTH = 2^20;

fbmf = abs(fftshift(fft(fm_before_md, FFT_LENGTH)));
f = linspace(-8192*15/2, 8192*15/2, length(fbmf));
figure();
subplot(4,1,1);
plot(f, fbmf);
title("Spectrum of the message signal before modulation", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");
xlim([-1e4, 1e4]);

famf = abs(fftshift(fft(fm_after_md, FFT_LENGTH)));
subplot(4,1,2);
plot(f, famf);
title("spectrum of the FM signal after modulation", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");

facf = abs(fftshift(fft(fm_after_cn, FFT_LENGTH)));
subplot(4,1,3);
plot(f, facf);
title("Spectrum of the FM signal after AWGN channel", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");

fadf = abs(fftshift(fft(fm_after_dmd, FFT_LENGTH)));
subplot(4,1,4);
plot(f, fadf);
title("Spectrum of the signal after demodulation", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");
xlim([-1e4, 1e4]);

figure();
plot(f, fbmf);
title("Spectrum of the message signal", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");
xlim([-1e4, 1e4]);

figure();
plot(f, famf);
title("Spectrum of the modulated signal", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");