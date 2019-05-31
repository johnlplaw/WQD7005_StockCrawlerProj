if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'HIGH'
'LASTDONE'
'LOW'
'OPEN'
'SELL'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg2: Rejected using stepwise selection";
end;
end;
