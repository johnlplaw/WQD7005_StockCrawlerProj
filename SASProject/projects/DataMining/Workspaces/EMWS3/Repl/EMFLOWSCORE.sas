   
* ;
* Defining New Variables;
* ;
Length REP_updownInd $8;
Label REP_updownInd='Replacement: updownInd';
format REP_updownInd $8.;
REP_updownInd= updownInd;
* ;
* Replace Unknown Class Levels ;
* ;
length _UFORMAT200 $200;
drop   _UFORMAT200;
_UFORMAT200 = " ";
*;
_UFORMAT200 = strip(put(updownInd,$8.));
if ^(_UFORMAT200 in(
"down", "up", "unchange", ""
)) then
REP_updownInd= "unchange";
   
* ;
* Replace Specific Class Levels ;
* ;
length _UFormat200 $200;
drop   _UFORMAT200;
_UFORMAT200 = " ";
* ;
* Variable: updownInd;
* ;
_UFORMAT200 = strip(
put(updownInd,$8.));
if _UFORMAT200 =  "" then
REP_updownInd="unchange";
