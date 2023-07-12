/******************************************************
* How would you insert the current date and time?     *
******************************************************/

title1 "Cars List";
title2 "Created at 10:24 AM on October 9, 2019";
footnote "Environment: SAS 9.4 on Win X64_10PRO"; 
proc print data=sashelp.cars;
run;
title;

/******************************************************
* How would you replace Truck with Wagon or SUV?      *
******************************************************/

title "Trucks by Origin";
proc freq data=sashelp.cars;
	where Type="Truck";
	table Origin;
run;

title "Average Highway MPG for Trucks";
proc means data=sashelp.cars mean maxdec=1;
    where Type="Truck";
    var MPG_Highway;
    class Origin;
run;
title;

/******************************************************
* How would you conditionally run either the PRINT    *
* step or write a custom error message to the log     * 
* depending on the outcome of the DATA step?          *
******************************************************/

data mpg;
	set sashelp.cars;
	AvgMPG=mean(MPG_Highway, MPG_City);
run;

proc print data=mpg;
run;

*%put ERROR: MPG table was not created successfully.;

/******************************************************
* How would you repeat the PRINT step for             *
* 4, 6, and 8 cylinders?                              *
******************************************************/

title "4-Cylinder Cars";
proc print data=sashelp.cars;
	where Cylinders=4;
run;
title;

/******************************************************
* How can you verify all values of Type are included  *
* in the DATA step? What if you want to split the     *
* CARS table by Origin instead?                       *
******************************************************/

data hybrid sedan sports suv truck wagon;
	set sashelp.cars;
	select(Type);
		when("Hybrid") output hybrid;
		when("Sedan") output sedan;
		when("Sports") output sports;
		when("SUV") output suv;
		when("Truck") output truck;
		when("Wagon") output wagon;
		otherwise;
	end;
run;


