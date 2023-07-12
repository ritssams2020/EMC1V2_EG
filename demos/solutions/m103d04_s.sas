/*****************************************************
* Using SQL to Create Macro Variables: Demo Solution *
*****************************************************/

/* Steps 1-2 */

proc sql;
select mean(cost) 
    into :avgcost
    from mc1.storm_damage;
quit;

%put &=avgcost;
%put &=sqlobs;

/* Step 3 */

proc sql noprint;
select mean(cost) format=dollar20. 
    into :avgcost trimmed
    from mc1.storm_damage;
quit;

%put &=avgcost;
%put &=sqlobs;

/* Step 4 */

proc sql noprint;
select mean(cost) format=dollar20.,
       median(cost) format=dollar20. 
    into :avgcost trimmed,
         :medcost trimmed
    from mc1.storm_damage;
quit;

%put &=avgcost;
%put &=medcost;
%put &=sqlobs;

/* Step 5 */
proc sql;
select *
	from mc1.storm_type_codes;
quit;

*%put &=type1 &=type2 &=type3 &=type4 &=type5;
*%put &=sqlobs;

/* Steps 6-7 */

proc sql noprint;
select StormType
	into :Type1-
	from mc1.storm_type_codes;
quit;

%put &=type1 &=type2 &=type3 &=type4 &=type5; 
%put &=sqlobs;

/* Steps 8-9 */

proc sql noprint;
select StormType
	into :typelist separated by ", "
	from mc1.storm_type_codes;
quit;

%put &=typelist; 
%put &=sqlobs;







