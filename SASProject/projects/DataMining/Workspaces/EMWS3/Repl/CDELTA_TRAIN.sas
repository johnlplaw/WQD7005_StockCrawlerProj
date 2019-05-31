if NAME="updownInd" then ROLE="REJECTED";
else
if NAME="REP_updownInd" then do;
ROLE="TARGET";
LEVEL="NOMINAL";
end;
