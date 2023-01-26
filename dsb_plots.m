dsb_before_md = out.dsb_before_md;
dsb_after_md = out.dsb_after_md;
dsb_after_cn = out.dsb_after_cn;
dsb_after_dmd = out.dsb_after_dmd;

dbmf = abs(fftshift(fft(dsb_before_md)));
f = linspace(-81920/2, 81920/2, length(dbmf));
figure();
subplot(4,1,1);
plot(f, dbmf);
title("Spectrum of the message signal before modulation", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");
xlim([-5e4, 5e4]);

damf = abs(fftshift(fft(dsb_after_md)));
subplot(4,1,2);
plot(f, damf);
title("spectrum of the DSB signal after modulation", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");
xlim([-5e4, 5e4]);

dacf = abs(fftshift(fft(dsb_after_cn)));
subplot(4,1,3);
plot(f, dacf);
title("Spectrum of the DSB signal after AWGN channel", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");
xlim([-5e4, 5e4]);

dadf = abs(fftshift(fft(dsb_after_dmd)));
subplot(4,1,4);
plot(f, dadf);
title("Spectrum of the signal after demodulation", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");
xlim([-5e4, 5e4]);

figure();
plot(f, dbmf);
title("Spectrum of the message signal", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");
xlim([-1.5e4, 1.5e4]);

figure();
plot(f, damf);
title("Spectrum of the modulated signal", Interpreter="latex");
xlabel("Frequency (Hz)", Interpreter="latex");
xlim([-3e4, 3e4]);