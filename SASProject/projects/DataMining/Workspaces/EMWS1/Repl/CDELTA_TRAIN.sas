if NAME="Category" then ROLE="REJECTED";
else
if NAME="REP_Category" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="Sub_category" then ROLE="REJECTED";
else
if NAME="REP_Sub_category" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="comp_code" then ROLE="REJECTED";
else
if NAME="REP_comp_code" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="stock_code" then ROLE="REJECTED";
else
if NAME="REP_stock_code" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
