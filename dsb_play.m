fig = uifigure('Position',[100 100 240 240], 'Resize', 'off');
lbl = uilabel(fig, 'Text','DSB-SC Modulation', 'FontSize',15, 'Position', [50, 210 180, 20], 'FontWeight', 'bold');
btn1 = uibutton(fig, 'Position', [45, 150, 150, 20], 'Text', 'Play Message Signal', 'ButtonPushedFcn', @(btn, event) playMessageSignal(btn, data) );
btn2 = uibutton(fig, 'Position', [45, 110, 150, 20], 'Text', 'Play Demodulated Signal','ButtonPushedFcn', @(btn, event) playDmdSignal(btn, out.s2));
btn3 = uibutton(fig, 'Position', [45, 70, 150, 20], 'Text', 'Stop','ButtonPushedFcn', @(btn, event) stopPlaying());

function playMessageSignal(~, data)
    clear sound;
    sound(data(:,2), 8192);
end

function playDmdSignal(~, s2)
    clear sound;
    sound(s2, 8192);
end

function stopPlaying()
    clear sound;
end