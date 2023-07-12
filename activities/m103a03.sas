***********************************************************;
*  Activity 3.03                                          *;
*  1) The intent of the %SCAN function is to return the   *;
*     city from the Location macro variable using only    *;
*     the comma as a delimiter. Run the program and       *;
*     examine the log. Why does the program fail?         *;
*  2) Use %STR to mask the comma in the appropriate       *;
*     places so that the value of the City macro variable *;
*     is Buenos Aires.                                    *;
***********************************************************;

%let location=Buenos Aires, Argentina;
%let city=%scan(&location, 1,,);
%put &=city;




