if NAME = "v_updownpercent" then delete;
else 
if NAME    = "IMP_v_updownpercent"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
