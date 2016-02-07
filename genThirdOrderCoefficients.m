function coefficients = genThirdOrderCoefficients(initialVal,finalVal,timeInterval)
	%produce the coefficients of a third-order polynomial with the following attributes:
	% - derivative of 0 at t=0
	% - derivative of 0 at t=t_final
	% - equal to y_0 at t=0
	% - equal to y_final at t=t_final

	coefficients(1) = initialVal;
	coefficients(2) = 0;
	coefficients(3) = 3.0*(finalVal-initialVal)/timeInterval^2.0;
	coefficients(4) = -2.0*(finalVal-initialVal)/timeInterval^3.0;
end
