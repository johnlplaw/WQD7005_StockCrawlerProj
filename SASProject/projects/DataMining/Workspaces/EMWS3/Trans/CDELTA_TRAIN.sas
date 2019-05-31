*------------------------------------------------------------*;
* Computed Code;
*------------------------------------------------------------*;

if NAME="LOG_buy" then do;
   COMMENT = "log(buy  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="buy" then delete;

if NAME="LOG_high" then do;
   COMMENT = "log(high  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="high" then delete;

if NAME="LOG_lastDone" then do;
   COMMENT = "log(lastDone  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="lastDone" then delete;

if NAME="LOG_low" then do;
   COMMENT = "log(low  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="low" then delete;

if NAME="LOG_open" then do;
   COMMENT = "log(open  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="open" then delete;

if NAME="LOG_sell" then do;
   COMMENT = "log(sell  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="sell" then delete;

if NAME="LOG_vol" then do;
   COMMENT = "log(vol  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="vol" then delete;
