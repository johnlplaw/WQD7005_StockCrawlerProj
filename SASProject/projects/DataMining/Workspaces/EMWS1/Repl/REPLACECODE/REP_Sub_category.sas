   
* ;
* Defining: REP_Sub_category;
* ;
Length REP_Sub_category$17;
Label REP_Sub_category='Replacement: Sub_category';
format REP_Sub_category $CHAR17.;
REP_Sub_category=Sub_category;
*;
_UFORMAT200 = strip(put(Sub_category,$CHAR17.));
if ^(_UFORMAT200 in(
"indprod", "consumer", "property", "technology", "construction", "finance"
, "plantation", "transport", "telcomedia", "energy", "utilities", "reits"
, "healthcare", "equity", "islamic", "specialpurposeact", "bond", "closedfund"
, "commodity"
, "" )) then
REP_Sub_category= "";
