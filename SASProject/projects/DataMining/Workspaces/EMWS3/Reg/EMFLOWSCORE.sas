*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_REP_updownInd $ 8;
label I_REP_updownInd = 'Into: REP_updownInd' ;
*** Target Values;
array REGDRF [3] $8 _temporary_ ('UP' 'UNCHANGE' 'DOWN' );
label U_REP_updownInd = 'Unnormalized Into: REP_updownInd' ;
format U_REP_updownInd $8.;
length U_REP_updownInd $ 8;
*** Unnormalized target values;
array REGDRU[3] $ 8 _temporary_ ('up      '  'unchange'  'down    ' );

*** Generate dummy variables for REP_updownInd ;
drop _Y ;
label F_REP_updownInd = 'From: REP_updownInd' ;
length F_REP_updownInd $ 8;
F_REP_updownInd = put( REP_updownInd , $8. );
%DMNORMIP( F_REP_updownInd )
if missing( REP_updownInd ) then do;
   _Y = .;
end;
else do;
   if F_REP_updownInd = 'DOWN'  then do;
      _Y = 2;
   end;
   else if F_REP_updownInd = 'UNCHANGE'  then do;
      _Y = 1;
   end;
   else if F_REP_updownInd = 'UP'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;

drop _DM_BAD;
_DM_BAD=0;

*** Check buy for missing values ;
if missing( buy ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check high for missing values ;
if missing( high ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check lastDone for missing values ;
if missing( lastDone ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check low for missing values ;
if missing( low ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check open for missing values ;
if missing( open ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check sell for missing values ;
if missing( sell ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check vol for missing values ;
if missing( vol ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.2872;
   _P1 = 0.3376;
   _P2 = 0.3752;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0  _LP1;
_LP0 = 0;
_LP1 = 0;

***  Effect: buy ;
_TEMP = buy ;
_LP0 = _LP0 + (   -140.421890566658 * _TEMP);
_LP1 = _LP1 + (   -116.902200825853 * _TEMP);

***  Effect: high ;
_TEMP = high ;
_LP0 = _LP0 + (    85.7834283797324 * _TEMP);
_LP1 = _LP1 + (   -90.5344036836417 * _TEMP);

***  Effect: lastDone ;
_TEMP = lastDone ;
_LP0 = _LP0 + (     4032.9032129325 * _TEMP);
_LP1 = _LP1 + (    3915.77638464877 * _TEMP);

***  Effect: low ;
_TEMP = low ;
_LP0 = _LP0 + (    50.9046619244044 * _TEMP);
_LP1 = _LP1 + (    43.4339379364386 * _TEMP);

***  Effect: open ;
_TEMP = open ;
_LP0 = _LP0 + (   -3994.82272395389 * _TEMP);
_LP1 = _LP1 + (   -3809.49439234872 * _TEMP);

***  Effect: sell ;
_TEMP = sell ;
_LP0 = _LP0 + (   -34.1145164028864 * _TEMP);
_LP1 = _LP1 + (    58.6445056614437 * _TEMP);

***  Effect: vol ;
_TEMP = vol ;
_LP0 = _LP0 + (  3.0817959456157E-7 * _TEMP);
_LP1 = _LP1 + ( -1.4946535923803E-7 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1 _P2;
drop _LPMAX;
_LPMAX= 0;
_LP0 =     8.07498227439651 + _LP0;
if _LPMAX < _LP0 then _LPMAX = _LP0;
_LP1 =     9.53083457367732 + _LP1;
if _LPMAX < _LP1 then _LPMAX = _LP1;
_LP0 = exp(_LP0 - _LPMAX);
_LP1 = exp(_LP1 - _LPMAX);
_LPMAX = exp(-_LPMAX);
_P2 = 1 / (_LPMAX + _LP0 + _LP1);
_P0 = _LP0 * _P2;
_P1 = _LP1 * _P2;
_P2 = _LPMAX * _P2;

REGDR1:

*** Residuals;
if (_Y = .) then do;
   R_REP_updownIndup = .;
   R_REP_updownIndunchange = .;
   R_REP_updownInddown = .;
end;
else do;
    label R_REP_updownIndup = 'Residual: REP_updownInd=up' ;
    label R_REP_updownIndunchange = 'Residual: REP_updownInd=unchange' ;
    label R_REP_updownInddown = 'Residual: REP_updownInd=down' ;
   R_REP_updownIndup = - _P0;
   R_REP_updownIndunchange = - _P1;
   R_REP_updownInddown = - _P2;
   select( _Y );
      when (0)  R_REP_updownIndup = R_REP_updownIndup + 1;
      when (1)  R_REP_updownIndunchange = R_REP_updownIndunchange + 1;
      when (2)  R_REP_updownInddown = R_REP_updownInddown + 1;
   end;
end;

*** Posterior Probabilities and Predicted Level;
label P_REP_updownIndup = 'Predicted: REP_updownInd=up' ;
label P_REP_updownIndunchange = 'Predicted: REP_updownInd=unchange' ;
label P_REP_updownInddown = 'Predicted: REP_updownInd=down' ;
P_REP_updownIndup = _P0;
_MAXP = _P0;
_IY = 1;
P_REP_updownIndunchange = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
P_REP_updownInddown = _P2;
if (_P2 >  _MAXP + 1E-8) then do;
   _MAXP = _P2;
   _IY = 3;
end;
I_REP_updownInd = REGDRF[_IY];
U_REP_updownInd = REGDRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
