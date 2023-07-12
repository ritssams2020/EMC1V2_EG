/*************************************
* Validating Parameters: Solution #5 *
*************************************/

%macro stormchart(basin, season) / minoperator;
proc sql noprint;
select min(season), max(season)
	into :minseason trimmed, :maxseason trimmed
	from mc1.storm_final;
quit;

%if &season<&minseason or &season>&maxseason %then %do;
    %put ERROR: Valid Seasons are between &minseason and &maxseason;
%end;

%else %do;
	proc sql noprint;
	select Basin
	    into :basinlist separated by " "
	    from mc1.storm_basin_codes;
	quit;
	%if &basin in &basinlist %then %do;
		title1 "Storm Frequency by Type";
		title2 "&basin Basin, &season Season";
		proc sgplot data=mc1.storm_final noborder;
			vbar StormType / filltype=gradient;
		    where Basin="&basin" and Season=&season;
		    yaxis grid;
		run;
		title;
	%end;
	%else %do;
	    %put ERROR: &basin is an invalid basin code. Basin codes include &basinlist..;
	%end;
%end;
%mend stormchart;

%stormchart(NA,2020)
%stormchart(EP,2010)
%stormchart(AA,2010)


