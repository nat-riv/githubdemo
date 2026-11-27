/* mock births data standing in for the course dataset */
data births;
  call streaminit(716);
  do i = 1 to 80;
    pnc5 = (mod(i,3) = 0);
    preterm = (rand('uniform') < 0.08 + 0.10*pnc5);
    output;
  end;
  drop i;
run;

*Fit logit-risk regression;

proc genmod data = births descending;
		model preterm = pnc5 / link = logit dist = binomial;

		estimate 'Risk unexposed' intercept 1 pnc5 0 ;
		estimate 'Risk exposed' intercept 1 pnc5 1 ;
		estimate 'OR' intercept 0 pnc5 1 ;
run;
