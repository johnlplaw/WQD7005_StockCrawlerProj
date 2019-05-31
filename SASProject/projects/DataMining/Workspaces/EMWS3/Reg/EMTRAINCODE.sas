*------------------------------------------------------------*;
* Reg: Create decision matrix;
*------------------------------------------------------------*;
data WORK.REP_updownInd(label="REP_updownInd");
  length   REP_updownInd                    $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           DECISION3                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="UP"
           DECISION2="UNCHANGE"
           DECISION3="DOWN"
           ;
REP_updownInd="UP"; COUNT=359; DATAPRIOR=0.2872; TRAINPRIOR=0.2872; DECPRIOR=.; DECISION1=1; DECISION2=0; DECISION3=0;
output;
REP_updownInd="UNCHANGE"; COUNT=422; DATAPRIOR=0.3376; TRAINPRIOR=0.3376; DECPRIOR=.; DECISION1=0; DECISION2=1; DECISION3=0;
output;
REP_updownInd="DOWN"; COUNT=469; DATAPRIOR=0.3752; TRAINPRIOR=0.3752; DECPRIOR=.; DECISION1=0; DECISION2=0; DECISION3=1;
output;
;
run;
proc datasets lib=work nolist;
modify REP_updownInd(type=PROFIT label=REP_updownInd);
label DECISION1= 'UP';
label DECISION2= 'UNCHANGE';
label DECISION3= 'DOWN';
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS3.Part_TRAIN(keep=
REP_updownInd buy high lastDone low open sell vol );
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    REP_updownInd(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    buy high lastDone low open sell vol
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
REP_updownInd
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS3.Part_VALIDATE
outest = EMWS3.Reg_EMESTIMATE
outterms = EMWS3.Reg_OUTTERMS
outmap= EMWS3.Reg_MAPDS namelen=200
;
class
REP_updownInd
;
model REP_updownInd =
buy
high
lastDone
low
open
sell
vol
/level=nominal
coding=DEVIATION
nodesignprint
;
;
code file="C:\JohnLaw\OneDrive\WQD Data Science\WQD7005\SASProject\projects\DataMining\Workspaces\EMWS3\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\JohnLaw\OneDrive\WQD Data Science\WQD7005\SASProject\projects\DataMining\Workspaces\EMWS3\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
