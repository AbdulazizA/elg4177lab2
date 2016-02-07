function play_scale(enableImprovements)
    %--- play_scale.m
    %---
    scale.keys = [ 40 42 44 45 47 49 51 52 ];
    %--- NOTES: C D E F G A B C
    % key #40 is middle-C
    %
    
	beatLength = 0.5
    scale.durations = beatLength * ones(1,length(scale.keys));
    fs = 11025;
    xx = zeros(1, sum(scale.durations)*fs+length(scale.keys));
    n1 = 1;

	amplitude = 1;

    for kk = 1:length(scale.keys)
        keynum = scale.keys(kk);
        tone = key2note(amplitude,keynum,scale.durations(kk));
		if enableImprovements
			tone = cleanNote(amplitude,keynum,120,4,tone);
		end
        n2 = n1 + length(tone) - 1;
        %part 3.2
        xx(n1:n2) = xx(n1:n2) + tone; %<=== Insert the note
        n1 = n2 + 1;
    end
    
	soundsc( xx, fs);
    
    %part 3.3
    %Function spectrogram of the scale
    %shows frequency content of time signal
    specgram(xx,512,fs);
    zoom on
    %plotspec(xx,fs);
end

