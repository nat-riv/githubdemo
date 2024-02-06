
* Fit a linear-risk regression model;
PROC GENMOD data =D.EPID716_3A1 ;
MODEL preterm = mage2 mage2*mage2/ link = linear dist = binomial;
	OUTPUT OUT=a2_2 pred = pred l = l95 u = u95;
	estimate 'Risk of preterm (age 16)' int 1 mage2 16 mage2*mage2 256; * ;
    estimate 'Risk of preterm (age 26)' int 1 mage2 26 mage2*mage2 676; * ;
	estimate 'Risk of preterm (age 40)' int 1 mage2 40; * ;
    estimate 'RD, age 16 vs. age 26' int 0 mage2 -10; 
	estimate 'RD, age 40 vs. age 26' int 0 mage2 14; * ;
	title 'Linear Risk Model for Simple Contnuous Variable of Age';
run;


*Pull request example;
 PROC GENMOD data =ages ;
MODEL preterm = mage14 - mage25 mage27-mage44 / link = identity dist = binomial;
	OUTPUT OUT=a1_1 pred = pred l = l95 u = u95;
	title 'Linear Risk Model for 31 Categories of Age';
	estimate 'Risk of preterm (age 16)' int 1 mage18 1;*need to look at age 16, not 18;
	estimate 'Risk of preterm (age 26)' int 1 ;
	estimate 'Crude RD, age 18 vs. age 26' int 0 mage18 1;
run;




