*------------------------------------------------------------*;
* Reg4: Create decision matrix;
*------------------------------------------------------------*;
data WORK.REP_updownInd;
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
  format   COUNT 10.
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
set EMWS3.Impt2_TRAIN(keep=
LOG_buy LOG_high LOG_lastDone LOG_low LOG_open LOG_sell LOG_vol REP_updownInd );
run;
*------------------------------------------------------------* ;
* Reg4: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    REP_updownInd(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg4: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    LOG_buy LOG_high LOG_lastDone LOG_low LOG_open LOG_sell LOG_vol
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg4: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg4_DMDB
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
* Reg4: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg4_DMDB
validata = EMWS3.Impt2_VALIDATE
outest = EMWS3.Reg4_EMESTIMATE
outterms = EMWS3.Reg4_OUTTERMS
outmap= EMWS3.Reg4_MAPDS namelen=200
;
class
REP_updownInd
;
model REP_updownInd =
LOG_buy
LOG_high
LOG_lastDone
LOG_low
LOG_open
LOG_sell
LOG_vol
/level=nominal
coding=DEVIATION
nodesignprint
;
;
code file="C:\JohnLaw\OneDrive\WQD Data Science\WQD7005\SASProject\projects\DataMining\Workspaces\EMWS3\Reg4\EMPUBLISHSCORE.sas"
group=Reg4
;
code file="C:\JohnLaw\OneDrive\WQD Data Science\WQD7005\SASProject\projects\DataMining\Workspaces\EMWS3\Reg4\EMFLOWSCORE.sas"
group=Reg4
residual
;
run;
quit;
