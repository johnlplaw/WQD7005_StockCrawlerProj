****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_REP_updownInd  $    8; 
LENGTH I_REP_updownInd  $    8; 
LENGTH U_REP_updownInd  $    8; 
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_REP_updownIndup = 'Predicted: REP_updownInd=up' ;
label P_REP_updownInddown = 'Predicted: REP_updownInd=down' ;
label P_REP_updownIndunchange = 'Predicted: REP_updownInd=unchange' ;
label Q_REP_updownIndup = 'Unadjusted P: REP_updownInd=up' ;
label Q_REP_updownInddown = 'Unadjusted P: REP_updownInd=down' ;
label Q_REP_updownIndunchange = 'Unadjusted P: REP_updownInd=unchange' ;
label V_REP_updownIndup = 'Validated: REP_updownInd=up' ;
label V_REP_updownInddown = 'Validated: REP_updownInd=down' ;
label V_REP_updownIndunchange = 'Validated: REP_updownInd=unchange' ;
label R_REP_updownIndup = 'Residual: REP_updownInd=up' ;
label R_REP_updownInddown = 'Residual: REP_updownInd=down' ;
label R_REP_updownIndunchange = 'Residual: REP_updownInd=unchange' ;
label F_REP_updownInd = 'From: REP_updownInd' ;
label I_REP_updownInd = 'Into: REP_updownInd' ;
label U_REP_updownInd = 'Unnormalized Into: REP_updownInd' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_8 $      8; DROP _ARBFMT_8; 
_ARBFMT_8 = ' '; /* Initialize to avoid warning. */


_ARBFMT_8 = PUT( REP_updownInd , $8.);
 %DMNORMCP( _ARBFMT_8, F_REP_updownInd );

******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(high ) AND 
  high  <               0.0925 THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    1;
  P_REP_updownIndup  =     0.14733542319749;
  P_REP_updownInddown  =     0.10658307210031;
  P_REP_updownIndunchange  =     0.74608150470219;
  Q_REP_updownIndup  =     0.14733542319749;
  Q_REP_updownInddown  =     0.10658307210031;
  Q_REP_updownIndunchange  =     0.74608150470219;
  V_REP_updownIndup  =     0.14749262536873;
  V_REP_updownInddown  =     0.10914454277286;
  V_REP_updownIndunchange  =      0.7433628318584;
  I_REP_updownInd  = 'UNCHANGE' ;
  U_REP_updownInd  = 'unchange' ;
  END;
ELSE DO;
  IF  NOT MISSING(vol ) AND 
    vol  <                 90.5 THEN DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_REP_updownIndup  =                    0;
    P_REP_updownInddown  =                    0;
    P_REP_updownIndunchange  =                    1;
    Q_REP_updownIndup  =                    0;
    Q_REP_updownInddown  =                    0;
    Q_REP_updownIndunchange  =                    1;
    V_REP_updownIndup  =                    0;
    V_REP_updownInddown  =                    0;
    V_REP_updownIndunchange  =                    1;
    I_REP_updownInd  = 'UNCHANGE' ;
    U_REP_updownInd  = 'unchange' ;
    END;
  ELSE DO;
    IF  NOT MISSING(high ) AND 
      high  <               0.1125 THEN DO;
      _NODE_  =                    7;
      _LEAF_  =                    3;
      P_REP_updownIndup  =     0.28723404255319;
      P_REP_updownInddown  =     0.28723404255319;
      P_REP_updownIndunchange  =     0.42553191489361;
      Q_REP_updownIndup  =     0.28723404255319;
      Q_REP_updownInddown  =     0.28723404255319;
      Q_REP_updownIndunchange  =     0.42553191489361;
      V_REP_updownIndup  =     0.28089887640449;
      V_REP_updownInddown  =     0.35955056179775;
      V_REP_updownIndunchange  =     0.35955056179775;
      I_REP_updownInd  = 'UNCHANGE' ;
      U_REP_updownInd  = 'unchange' ;
      END;
    ELSE DO;
      IF  NOT MISSING(open ) AND 
        open  <               0.1125 THEN DO;
        _NODE_  =                    9;
        _LEAF_  =                    4;
        P_REP_updownIndup  =     0.88888888888888;
        P_REP_updownInddown  =     0.05555555555555;
        P_REP_updownIndunchange  =     0.05555555555555;
        Q_REP_updownIndup  =     0.88888888888888;
        Q_REP_updownInddown  =     0.05555555555555;
        Q_REP_updownIndunchange  =     0.05555555555555;
        V_REP_updownIndup  =     0.72727272727272;
        V_REP_updownInddown  =     0.09090909090909;
        V_REP_updownIndunchange  =     0.18181818181818;
        I_REP_updownInd  = 'UP' ;
        U_REP_updownInd  = 'up' ;
        END;
      ELSE DO;
        _NODE_  =                   10;
        _LEAF_  =                    5;
        P_REP_updownIndup  =     0.33374689826302;
        P_REP_updownInddown  =     0.50496277915632;
        P_REP_updownIndunchange  =     0.16129032258064;
        Q_REP_updownIndup  =     0.33374689826302;
        Q_REP_updownInddown  =     0.50496277915632;
        Q_REP_updownIndunchange  =     0.16129032258064;
        V_REP_updownIndup  =     0.33793969849246;
        V_REP_updownInddown  =                  0.5;
        V_REP_updownIndunchange  =     0.16206030150753;
        I_REP_updownInd  = 'DOWN' ;
        U_REP_updownInd  = 'down' ;
        END;
      END;
    END;
  END;

*****  RESIDUALS R_ *************;
IF  F_REP_updownInd  NE 'UP' 
AND F_REP_updownInd  NE 'DOWN' 
AND F_REP_updownInd  NE 'UNCHANGE'  THEN DO; 
        R_REP_updownIndup  = .;
        R_REP_updownInddown  = .;
        R_REP_updownIndunchange  = .;
 END;
 ELSE DO;
       R_REP_updownIndup  =  -P_REP_updownIndup ;
       R_REP_updownInddown  =  -P_REP_updownInddown ;
       R_REP_updownIndunchange  =  -P_REP_updownIndunchange ;
       SELECT( F_REP_updownInd  );
          WHEN( 'UP'  ) R_REP_updownIndup  = R_REP_updownIndup  +1;
          WHEN( 'DOWN'  ) R_REP_updownInddown  = R_REP_updownInddown  +1;
          WHEN( 'UNCHANGE'  ) R_REP_updownIndunchange  = 
        R_REP_updownIndunchange  +1;
       END;
 END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

