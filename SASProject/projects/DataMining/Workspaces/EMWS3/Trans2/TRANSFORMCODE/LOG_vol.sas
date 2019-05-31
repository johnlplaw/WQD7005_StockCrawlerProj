label LOG_vol = 'Transformed vol';
if vol eq . then LOG_vol = .;
else do;
if vol + 1 > 0 then LOG_vol = log(vol + 1);
else LOG_vol = .;
end;
