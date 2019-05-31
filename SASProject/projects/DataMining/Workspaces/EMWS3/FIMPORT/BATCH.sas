*------------------------------------------------------------*;
* FIMPORT: Creating EM5BATCH data sets;
*------------------------------------------------------------*;
%let EM_ACTION = run;
%let EM_DEBUG =;
*------------------------------------------------------------*;
* Create workspace data set;
*------------------------------------------------------------*;
data workspace;
length property $64 value $100;
property= 'PROJECTLOCATION';
value= "C:\JohnLaw\OneDrive\WQD Data Science\WQD7005\SASProject\projects";
output;
property= 'PROJECTNAME';
value= "DataMining";
output;
property= 'WORKSPACENAME';
value= "EMWS3";
output;
property= 'SUMMARYDATASET';
value= 'summary';
output;
property= 'NUMTASKS';
value= 'SINGLE';
output;
property= 'EDITMODE';
value= 'M';
output;
property= 'DEBUG';
value= "&&EM_DEBUG";
output;
property= 'UNLOCK';
value= 'N';
output;
property= 'FORCERUN';
value= 'Y';
output;
run;
*------------------------------------------------------------*;
* Create actions data set:;
*------------------------------------------------------------*;
%macro emaction;
%let actionstring = %upcase(&EM_ACTION);
%if %index(&actionstring, RUN) or %index(&actionstring, REPORT) %then %do;
data actions;
length id $12 action $40;
id="FIMPORT";
%if %index(&actionstring, RUN) %then %do;
action='run';
output;
%end;
%if %index(&actionstring, REPORT) %then %do;
action='report';
output;
%end;
run;
%end;
%mend;
%emaction;
*------------------------------------------------------------*;
* Execute the actions;
*------------------------------------------------------------*;
%em5batch(execute, workspace=workspace, action=actions);
