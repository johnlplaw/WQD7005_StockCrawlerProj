*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_REP_updownInd $ 8;
label I_REP_updownInd = 'Into: REP_updownInd' ;
*** Target Values;
array REG3DRF [3] $8 _temporary_ ('UP' 'UNCHANGE' 'DOWN' );
label U_REP_updownInd = 'Unnormalized Into: REP_updownInd' ;
format U_REP_updownInd $8.;
length U_REP_updownInd $ 8;
*** Unnormalized target values;
array REG3DRU[3] $ 8 _temporary_ ('up      '  'unchange'  'down    ' );

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

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0  _LP1;
_LP0 = 0;
_LP1 = 0;

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1 _P2;
drop _LPMAX;
_LPMAX= 0;
_LP0 =      -0.267280379958 + _LP0;
if _LPMAX < _LP0 then _LPMAX = _LP0;
_LP1 =    -0.10559745441026 + _LP1;
if _LPMAX < _LP1 then _LPMAX = _LP1;
_LP0 = exp(_LP0 - _LPMAX);
_LP1 = exp(_LP1 - _LPMAX);
_LPMAX = exp(-_LPMAX);
_P2 = 1 / (_LPMAX + _LP0 + _LP1);
_P0 = _LP0 * _P2;
_P1 = _LP1 * _P2;
_P2 = _LPMAX * _P2;


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
I_REP_updownInd = REG3DRF[_IY];
U_REP_updownInd = REG3DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
