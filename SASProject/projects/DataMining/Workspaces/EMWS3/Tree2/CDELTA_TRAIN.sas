if upcase(NAME) = "BUY" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LOW" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_REP_UPDOWNINDDOWN" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_REP_UPDOWNINDUNCHANGE" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_REP_UPDOWNINDUP" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "SELL" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
