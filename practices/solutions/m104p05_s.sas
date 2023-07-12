/************************************
* Macro Variable Scope: Solution #5 *
************************************/

 /* Part a. */
 /* Section 1: Macro variables created with %LET */
%macro scope;
%let stormtype1=Some damage;
%let stormtype2=Extensive damage;
%let stormtype3=Devastating damage;
%let stormtype4=Catastrophic damage;
%let stormtype5=Widespread catastrophic damage;
%put _user_;
%mend scope;

%scope

 /* Part b. */
 /* Section 2: Macro variables created with SQL INTO */
%macro scope;
proc sql noprint;
select damage into :stormtype1-
	from mc1.storm_cat
	order by category;
quit;

%let num = &sqlobs;
%put _user_;
%mend scope;

%scope

 /* Part c. */
 /* Section 3: Macro variables created with CALL SYMPUTX */
%macro scope;
data _null_;
	set mc1.storm_cat end=last;
	call symputx(cat('stormtype',_n_),Damage);
	if last=1 then
		call symputx('num',_n_);
run;
%put _user_;
%mend scope;

%scope

%symdel stormtype1 stormtype2 stormtype3 stormtype4 stormtype5 num;

 /* Part d. */
%macro scope;
%local x;
data _null_;
	set mc1.storm_cat end=last;
	call symputx(cat('stormtype',_n_),Damage);
	if last=1 then
		call symputx('num',_n_);
run;
%put _user_;
%mend scope;

%scope

%symdel stormtype1 stormtype2 stormtype3 stormtype4 stormtype5 num;

 /* Part e. */
%macro scope;
data _null_;
	set mc1.storm_cat end=last;
	call symputx(cat('stormtype',_n_),Damage,"L");
	if last=1 then
		call symputx('num',_n_,"L");
run;
%put _user_;
%mend scope;

%scope

%symdel stormtype1 stormtype2 stormtype3 stormtype4 stormtype5 num;