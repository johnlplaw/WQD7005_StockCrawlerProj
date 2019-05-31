*;
*MEAN-MAX-MIN-MEDIAN-MIDRANGE AND ROBUST ESTIMATES;
*;
format IMP_v_updownpercent BEST12.0;
label IMP_v_updownpercent = 'Imputed v_updownpercent';
IMP_v_updownpercent = v_updownpercent;
if missing(v_updownpercent) then IMP_v_updownpercent = 0.630759941;
