/********************************************
* Using SQL to Create Macro Variables: Demo *
********************************************/

 /* Section 1 */

proc sql;
select mean(cost) 
    into :avgcost
    from mc1.storm_damage;
quit;

%put &=avgcost;
%put &=sqlobs;

 /* Section 2 */

proc sql;
select *
	from mc1.storm_type_codes;
quit;

/* %put &=type1 &=type2 &=type3 &=type4 &=type5; */
/* %put &=sqlobs; */

