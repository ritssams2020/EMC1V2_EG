/**********************************************
* Generating Data-Dependent Code: Practice #2 *
**********************************************/

libname storm xlsx "&path/NAStorms.xlsx";

data storm.NorthAtlantic_Storms;
	set mc1.storm_final;
	where Basin="NA";
run;

libname storm clear;