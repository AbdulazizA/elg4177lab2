function soundSignal = key2note(X, keyNum, dur)
    % KEY2NOTE Produce a sinusoidal waveform corresponding to a
    % given piano key number
    %
    % usage: xx = key2note (X, keynum, dur)
    %
    % xx = the output sinusoidal waveform
    % X = complex amplitude for the sinusoid, X = A*exp(j*phi).
    % keynum = the piano keyboard number of the desired note
    % dur = the duration (in seconds) of the output note
    %
    middleCFreq = 440;
    
    fs = 11025; %-- or use 8000 Hz
    tt = 0:(1/fs):dur;
    %part 3.1
    freq = middleCFreq*2^((keyNum-49)/12); %the -49 reflects the fact that A is key 49
    soundSignal = real(X*exp(2i*pi*freq*tt));
    
    plot(tt, soundSignal);
end

