/*************************************************************
* Using the DATA Step to Create Macro Variables: Solution #7 *
*************************************************************/

data _null_;
    set mc1.storm_ocean_Codes;
    call symputx(Ocean,OceanName);
run;

proc print data=sashelp.vmacro;
	var name value;
	where name like "_";
run;
