label LOG_lastDone = 'Transformed lastDone';
if lastDone eq . then LOG_lastDone = .;
else do;
if lastDone + 1 > 0 then LOG_lastDone = log(lastDone + 1);
else LOG_lastDone = .;
end;
