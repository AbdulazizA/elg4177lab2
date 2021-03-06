function cleanedNote = cleanNote(amplitude,keynum,bpm,noteType,signal)
	harmonicFraction = 0.25;

	wholeNoteLength = 4/(bpm/60);
	inputNoteLength = wholeNoteLength/noteType;
	numSamples = length(signal);
	
	%add the first two harmonics
	%doubling the base frequency requires you to go 12 keys up
	%approximately tripling the base frequency requires you to go 19 keys up
	cleanedNote = signal + key2note(amplitude*harmonicFraction,keynum+12,inputNoteLength);
	cleanedNote = cleanedNote + key2note(amplitude*harmonicFraction,keynum+19,inputNoteLength);
	
	%and an envelope
	cleanedNote = cleanedNote.*genEnvelope(bpm,noteType,numSamples);
end
	
