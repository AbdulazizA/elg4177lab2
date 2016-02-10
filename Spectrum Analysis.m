    %part 3.3
    %Function spectrogram of the scale
    %shows frequency content of time signal
    fs = 11025;
    xx = zeros(1, sum(scale.durations)*fs+length(scale.keys));
    specgram(xx,512,fs);
