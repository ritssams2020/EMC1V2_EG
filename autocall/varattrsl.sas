%macro varattrsl;
  /* This query values all the attribute variables
     for a specific library.dataset column into local
     macro variables existing in the calling macro's
     local symbol table */
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
	%put NOTE: From VARATTRSL:;
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
%mend varattrsl;
