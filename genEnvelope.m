function envelope = genEnvelope(bpm,noteType,numSamples)
	%this function uses the ADSR technique to fade notes in and out

	wholeNoteLength = 4/(bpm/60);
	inputNoteLength = wholeNoteLength/noteType;

	riseFallNote     = 32;  %the "note duration type" of the ADR
	riseFallRatio    = 1/2; %this is the ratio of A+D to A+D+R's lengths (rising to falling)
	attackDelayRatio = 2/3; %this is the ratio of A to A+D's lengths
	attackOvershoot  = 1/4; %the fractional overshoot of A
    
	riseFallTime     = wholeNoteLength/riseFallNote;

	%we'll be using 3rd-order polynomials for the ADR components, and a constant for S

	dStart = riseFallTime*riseFallRatio*attackDelayRatio;
	sStart = riseFallTime*riseFallRatio;
	rStart = inputNoteLength-(1-riseFallRatio)*riseFallTime;

	initialVal_a   = 0;
	finalVal_a     = attackOvershoot+1;
	coefficients_a = genThirdOrderCoefficients(initialVal_a,finalVal_a,dStart);

	initialVal_d   = finalVal_a;
	finalVal_d     = 1;
	coefficients_d = genThirdOrderCoefficients(initialVal_d,finalVal_d,sStart-dStart);

	initialVal_r   = 1;
	finalVal_r     = 0;
	coefficients_r = genThirdOrderCoefficients(initialVal_r,finalVal_r,inputNoteLength-rStart);

	t = linspace(0,inputNoteLength,numSamples);

	for k = 1:length(t)
		if t(k)<dStart
			%A component here
			coefficients = coefficients_a;
			adjustedTime = t(k);
		elseif t(k)>=dStart && t(k)<sStart
			%D component here
			coefficients = coefficients_d;
			adjustedTime = t(k)-dStart;
		elseif t(k)>=sStart && t(k)<rStart;
			%S component here
			coefficients = zeros(4);
			coefficients(1) = 1.0;
			adjustedTime = t(k)-sStart;
		else
			%R component here
			coefficients = coefficients_r;
			adjustedTime = t(k)-rStart;
		end

		envelope(k) = coefficients(4)*(adjustedTime)^3+coefficients(3)*(adjustedTime)^2+coefficients(2)*(adjustedTime)+coefficients(1);
	end

	%plot(t,envelope); %uncomment to show geometry of envelope
end
