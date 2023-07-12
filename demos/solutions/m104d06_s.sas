/***************************************************************
* Using the DATA Step to Create Macro Variables: Demo Solution *
***************************************************************/

/* Step 1 */

proc means data=mc1.storm_damage noprint;
    var Cost;
    output out=work.sumdata mean= median= /autoname;
run;

/* Step 2 */

proc means data=mc1.storm_damage noprint;
    var Cost;
    output out=work.sumdata mean= median= /autoname;
run;

data _null_;
    set sumdata;
	call symputx("avgcost", cost_mean);
	call symputx("medcost", cost_median);
run;
%put &=avgcost &=medcost;

/* Step 3 */

proc means data=mc1.storm_damage noprint;
    var Cost;
    output out=work.sumdata mean= median= /autoname;
run;

data _null_;
    set sumdata;
	call symputx("avgcost", put(cost_mean, dollar20.));
	call symputx("medcost", put(cost_median, dollar20.));
run;

%put &=avgcost &=medcost;

/* Step 4 */

proc print data=mc1.storm_type_codes;
run;

data _null_;
	set mc1.storm_type_codes;
	call symputx("type", StormType);
run;

%put &=type;
*%put &=type1 &=type2 &=type3 &=type4 &=type5;


/* Step 5-6 */

proc print data=mc1.storm_type_codes;
run;

data _null_;
	set mc1.storm_type_codes;
	call symputx(cats("type", _n_), StormType);
run;

%put &=type1 &=type2 &=type3 &=type4 &=type5;

/* Step 7-8 */

data _null_;
	set mc1.storm_type_codes;
	call symputx(Type, StormType);
run;

%put &=DS &=ET &=NR &=SS &=TS;

/* Step 9 */

data _null_;
    set mc1.Storm_Type_Codes end=last;
    call symputx(Type,StormType);
    if last then call symputx('dsobs',_n_);
run;

%put &=DS &=ET &=NR &=SS &=TS &=dsobs;