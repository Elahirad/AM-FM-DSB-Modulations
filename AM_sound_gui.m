fig = uifigure('Position',[100 100 400 240], 'Resize', 'off');
lbl = uilabel(fig, 'Text','AM Modulation', 'FontSize',15, 'Position', [150, 210 180, 20], 'FontWeight', 'bold');
btn1 = uibutton(fig, 'Position', [55, 150, 300, 20], 'Text', 'Play Message Signal', 'ButtonPushedFcn', @(btn, event) playMessageSignal(btn, m) );
btn2 = uibutton(fig, 'Position', [55, 110, 300, 20], 'Text', 'Play Demodulated Signal using envelope detector','ButtonPushedFcn', @(btn, event) playDmdSignalEnv(btn, ssp));
btn3 = uibutton(fig, 'Position', [55, 70, 300, 20], 'Text', 'Play Demodulated Signal with synchronous method','ButtonPushedFcn', @(btn, event) playDmdSignalCoh(btn, sss));
btn4 = uibutton(fig, 'Position', [55, 30, 300, 20], 'Text', 'Stop','ButtonPushedFcn', @(btn, event) stopPlaying(btn, event));

function playMessageSignal(btn, data)
    clear sound;
    sound(resample(data, 8192, 400e3), 8192);
end

function playDmdSignalEnv(btn, data)
    clear sound;
    sound(data, 8192);
end

function playDmdSignalCoh(btn, data)
    clear sound;
    sound(data, 8192);
end

function stopPlaying(btn, event)
    clear sound;
end