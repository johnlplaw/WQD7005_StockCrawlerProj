*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;

%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    buyval chg downcnt downpricesum high lastDone low open sellVal unchgcnt upcnt
   uppricesum vol
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS6.FIMPORT_train
dmdbcat=WORK.EM_DMDB
maxlevel = 513
;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* PRINCOMP: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
    buyval chg downcnt downpricesum high lastDone low open sellVal unchgcnt upcnt
   uppricesum vol
%mend INPUTS;
proc dmneurl data=EMWS6.FIMPORT_train dmdbcat=WORK.EM_DMDB
outstat=EMWS6.PRINCOMP_OUTSTAT outclass=EMWS6.PRINCOMP_OUTCLASS
CORR
NOMONITOR
;
var %INPUTS;
;
run;
