/******************************************************
* Using the DATA Step to Create Macro Variables: Demo *
******************************************************/

/* Section 1 */
proc means data=mc1.storm_damage noprint;
    var Cost;
    output out=work.sumdata mean= median= /autoname;
run;

data _null_;
    set sumdata;
    /*insert CALL SYMPUTX statements */
run;

%put &=avgcost &=medcost;

/* Section 2 */
proc print data=mc1.storm_type_codes;
run;

data _null_;
	set mc1.storm_type_codes;
	call symputx("type", StormType);
run;

%put &=type;
/* %put &=type1 &=type2 &=type3 &=type4 &=type5; */
/* %put &=DS &=ET &=NR &=SS &=TS; */



