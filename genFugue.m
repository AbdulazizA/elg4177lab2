function genFugue(enableImprovements)
	load bach_fugue.mat

	fs = 11025;

	bpm = 80;
	amplitude = 1;

	beatLength = 60/bpm;
	pulseLength = beatLength/4;

	n1 = 1;

	lengthInPulses = 0;
	for n = 1:length(theVoices)
		finalNoteIndex = length(theVoices(n).startPulses);
		if finalNoteIndex~=0
			finalNoteStart = theVoices(n).startPulses(finalNoteIndex);
			finalLengthOfChannel = finalNoteStart+theVoices(n).durations(finalNoteIndex);
		else
			finalLengthOfChannel = 0;		
		end

		if finalLengthOfChannel>lengthInPulses
			lengthInPulses = finalLengthOfChannel;
		end
	end

	finalSignal = zeros(1,lengthInPulses*pulseLength*fs);
	for n = 1:length(theVoices)
		channelSignal = zeros(1,lengthInPulses*pulseLength*fs);
		for m = 1:length(theVoices(n).noteNumbers);
			n1 = floor(theVoices(n).startPulses(m)*pulseLength*fs)+1;
			
			keyNum = theVoices(n).noteNumbers(m);
			noteType = 16/theVoices(n).durations(m);
			inputNoteLength = theVoices(n).durations(m)*pulseLength;

			tone = key2note(amplitude,keyNum,inputNoteLength); %generate base tone

			if enableImprovements			
				tone = cleanNote(amplitude,keyNum,bpm,noteType,tone); %add harmonics, envelope
			end

			n2 = n1 + length(tone) - 1;
			channelSignal(n1:n2) = channelSignal(n1:n2)+tone;
		end
		finalSignal = finalSignal + channelSignal;
	end

	soundsc(finalSignal,fs);
end
