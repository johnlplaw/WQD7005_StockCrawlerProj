   
* ;
* Defining: REP_Category;
* ;
Length REP_Category$8;
Label REP_Category='Replacement: Category';
format REP_Category $CHAR8.;
REP_Category=Category;
*;
_UFORMAT200 = strip(put(Category,$CHAR8.));
if ^(_UFORMAT200 in(
"main", "warrants", "ace", "bond", "etf"
, "" )) then
REP_Category= "";
