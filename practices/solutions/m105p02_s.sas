/**********************************************
* Generating Data-Dependent Code: Solution #2 *
**********************************************/

%macro basinxls;

libname storm xlsx "&path/BasinStorms.xlsx";

%if &syslibrc ne 0 %then %do;
    %put ERROR: BasinStorms.xlsx was not successfully assigned. Check the path and filename.;
    %return;
%end;

%else %do;
	proc sql noprint;
	select Basin, compress(BasinName)
	    into :basin1-, :basinname1-
	    from mc1.storm_basin_codes;
	quit;
	
	%do i=1 %to &sqlobs;
	data storm.&&basinname&i.._Storms;
		set mc1.storm_final;
		where Basin="&&basin&i";
	run;
	%end;
%end;

libname storm clear;
%mend basinxls;

%basinxls