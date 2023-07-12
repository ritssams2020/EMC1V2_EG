%macro varattrsg(lib,dsn,col);
  /* Make sure variables exist so can delete without
	   warning messages in log */
  %global vtype vlength vpos vlabel vformat vexist;
	%symdel vtype vlength vpos vlabel vformat vexist;
	/* Create a fresh set of variables in the global
	   symbol table */
  %global vtype vlength vpos vlabel vformat vexist;

  /* This query values all the attribute variables
     for a specific library.dataset column into global
     macro variables */
  proc sql noprint;
	  select type, length, npos, label, format
           into :vtype trimmed, :vlength trimmed, 
                :vpos trimmed,  :vlabel trimmed, 
                :vformat trimmed
      from dictionary.columns
		 where libname = "&lib"
		   and memname = "&dsn"
			 and upcase(name) = "&col";
	quit;
	%put; %put;
	%put NOTE: From VARATTRSG:;
	%put _user_;
	/* If SQLOBS is zero, that means that the column was
	   not found in the libname.dataset provided - so the
	   vexist macro variable is then set to a 0. Otherwise
	   the variable was found in the dataset and the vexist
	   macro variable is set to a 1 */
	%put &=sqlobs;
	%if &sqlobs > 0 %then %do;
	  %let vexist = 1;
	%end;
	%else %do;
	  %let vexist = 0;
	%end;
%mend varattrsg;

