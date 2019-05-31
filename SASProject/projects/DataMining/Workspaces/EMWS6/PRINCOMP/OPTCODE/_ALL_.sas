**********************************************************;
**** Begin scoring code for principal components analysis;
**********************************************************;
LENGTH _FORMAT $200;
LENGTH _NORMFMT $%DMNORLEN;
;
/************************************************/
* Impute missing values for interval variables;
/************************************************/
;
if buyval=. then _D1 = 0;
else _D1=(buyval-13550.9536299499)/89723.449904709;
if chg=. then _D2 = 0;
else _D2=(chg-0.00593730339964)/0.01402794838285;
if downcnt=. then _D3 = 0;
else _D3=(downcnt-15.4404404404404)/10.946591338406;
if downpricesum=. then _D4 = 0;
else _D4=(downpricesum-0.41546546546546)/1.05917941380098;
if high=. then _D5 = 0;
else _D5=(high-1.48120177913346)/5.94341977146135;
if lastDone=. then _D6 = 0;
else _D6=(lastDone-1.63920565459666)/6.00631668697012;
if low=. then _D7 = 0;
else _D7=(low-1.45505365167219)/5.88038609965592;
if open=. then _D8 = 0;
else _D8=(open-1.46803728165452)/5.91312329376146;
if sellVal=. then _D9 = 0;
else _D9=(sellVal-7801.77002866673)/40321.4191220332;
if unchgcnt=. then _D10 = 0;
else _D10=(unchgcnt-17.082082082082)/9.47030319231533;
if upcnt=. then _D11 = 0;
else _D11=(upcnt-28.2582582582582)/12.129700269447;
if uppricesum=. then _D12 = 0;
else _D12=(uppricesum-10.710055055055)/45.0831781769102;
if vol=. then _D13 = 0;
else _D13=(vol-20079.7904259297)/72911.5539700116;
;
DROP _FORMAT _NORMFMT
_D1
_D2
_D3
_D4
_D5
_D6
_D7
_D8
_D9
_D10
_D11
_D12
_D13
;
