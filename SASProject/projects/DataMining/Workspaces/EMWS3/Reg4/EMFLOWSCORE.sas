*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_REP_updownInd $ 8;
label I_REP_updownInd = 'Into: REP_updownInd' ;
*** Target Values;
array REG4DRF [3] $8 _temporary_ ('UP' 'UNCHANGE' 'DOWN' );
label U_REP_updownInd = 'Unnormalized Into: REP_updownInd' ;
format U_REP_updownInd $8.;
length U_REP_updownInd $ 8;
*** Unnormalized target values;
array REG4DRU[3] $ 8 _temporary_ ('up      '  'unchange'  'down    ' );

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

*** Check LOG_buy for missing values ;
if missing( LOG_buy ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check LOG_high for missing values ;
if missing( LOG_high ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check LOG_lastDone for missing values ;
if missing( LOG_lastDone ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check LOG_low for missing values ;
if missing( LOG_low ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check LOG_open for missing values ;
if missing( LOG_open ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check LOG_sell for missing values ;
if missing( LOG_sell ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check LOG_vol for missing values ;
if missing( LOG_vol ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.2872;
   _P1 = 0.3376;
   _P2 = 0.3752;
   goto REG4DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0  _LP1;
_LP0 = 0;
_LP1 = 0;

***  Effect: LOG_buy ;
_TEMP = LOG_buy ;
_LP0 = _LP0 + (   -29.8159209733868 * _TEMP);
_LP1 = _LP1 + (    88.2567349358762 * _TEMP);

***  Effect: LOG_high ;
_TEMP = LOG_high ;
_LP0 = _LP0 + (    56.3928473741552 * _TEMP);
_LP1 = _LP1 + (   -400.071572784571 * _TEMP);

***  Effect: LOG_lastDone ;
_TEMP = LOG_lastDone ;
_LP0 = _LP0 + (    9685.82866698642 * _TEMP);
_LP1 = _LP1 + (    9295.19960366883 * _TEMP);

***  Effect: LOG_low ;
_TEMP = LOG_low ;
_LP0 = _LP0 + (   -20.8324634173241 * _TEMP);
_LP1 = _LP1 + (   -132.456530159121 * _TEMP);

***  Effect: LOG_open ;
_TEMP = LOG_open ;
_LP0 = _LP0 + (   -9402.72996224822 * _TEMP);
_LP1 = _LP1 + (   -8830.26354418332 * _TEMP);

***  Effect: LOG_sell ;
_TEMP = LOG_sell ;
_LP0 = _LP0 + (   -294.553929585442 * _TEMP);
_LP1 = _LP1 + (   -27.1135510256044 * _TEMP);

***  Effect: LOG_vol ;
_TEMP = LOG_vol ;
_LP0 = _LP0 + (    0.90447755217719 * _TEMP);
_LP1 = _LP1 + (    0.76094590089241 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1 _P2;
drop _LPMAX;
_LPMAX= 0;
_LP0 =     8.18746686379073 + _LP0;
if _LPMAX < _LP0 then _LPMAX = _LP0;
_LP1 =     12.2272075310205 + _LP1;
if _LPMAX < _LP1 then _LPMAX = _LP1;
_LP0 = exp(_LP0 - _LPMAX);
_LP1 = exp(_LP1 - _LPMAX);
_LPMAX = exp(-_LPMAX);
_P2 = 1 / (_LPMAX + _LP0 + _LP1);
_P0 = _LP0 * _P2;
_P1 = _LP1 * _P2;
_P2 = _LPMAX * _P2;

REG4DR1:

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
I_REP_updownInd = REG4DRF[_IY];
U_REP_updownInd = REG4DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
