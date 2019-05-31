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
  IF  NOT MISSING(open ) AND
                  0.0125 <= open  THEN DO;
    IF  NOT MISSING(lastDone ) AND
      lastDone  <               0.0125 THEN DO;
      _NODE_  =                   10;
      _LEAF_  =                    6;
      P_REP_updownIndup  =                    0;
      P_REP_updownInddown  =                    1;
      P_REP_updownIndunchange  =                    0;
      Q_REP_updownIndup  =                    0;
      Q_REP_updownInddown  =                    1;
      Q_REP_updownIndunchange  =                    0;
      V_REP_updownIndup  =                    0;
      V_REP_updownInddown  =                    1;
      V_REP_updownIndunchange  =                    0;
      I_REP_updownInd  = 'DOWN' ;
      U_REP_updownInd  = 'down' ;
      END;
    ELSE DO;
      _NODE_  =                   11;
      _LEAF_  =                    7;
      P_REP_updownIndup  =     0.25324675324675;
      P_REP_updownInddown  =     0.15584415584415;
      P_REP_updownIndunchange  =     0.59090909090909;
      Q_REP_updownIndup  =     0.25324675324675;
      Q_REP_updownInddown  =     0.15584415584415;
      Q_REP_updownIndunchange  =     0.59090909090909;
      V_REP_updownIndup  =     0.25503355704697;
      V_REP_updownInddown  =      0.1744966442953;
      V_REP_updownIndunchange  =     0.57046979865771;
      I_REP_updownInd  = 'UNCHANGE' ;
      U_REP_updownInd  = 'unchange' ;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(high ) AND
                    0.0075 <= high  THEN DO;
      IF  NOT MISSING(lastDone ) AND
        lastDone  <               0.0075 THEN DO;
        IF  NOT MISSING(open ) AND
                        0.0075 <= open  THEN DO;
          _NODE_  =                   21;
          _LEAF_  =                    3;
          P_REP_updownIndup  =                    0;
          P_REP_updownInddown  =                    1;
          P_REP_updownIndunchange  =                    0;
          Q_REP_updownIndup  =                    0;
          Q_REP_updownInddown  =                    1;
          Q_REP_updownIndunchange  =                    0;
          V_REP_updownIndup  =                    0;
          V_REP_updownInddown  =                    1;
          V_REP_updownIndunchange  =                    0;
          I_REP_updownInd  = 'DOWN' ;
          U_REP_updownInd  = 'down' ;
          END;
        ELSE DO;
          _NODE_  =                   20;
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
        END;
      ELSE DO;
        IF  NOT MISSING(open ) AND
          open  <               0.0075 THEN DO;
          _NODE_  =                   22;
          _LEAF_  =                    4;
          P_REP_updownIndup  =                    1;
          P_REP_updownInddown  =                    0;
          P_REP_updownIndunchange  =                    0;
          Q_REP_updownIndup  =                    1;
          Q_REP_updownInddown  =                    0;
          Q_REP_updownIndunchange  =                    0;
          V_REP_updownIndup  =                    1;
          V_REP_updownInddown  =                    0;
          V_REP_updownIndunchange  =                    0;
          I_REP_updownInd  = 'UP' ;
          U_REP_updownInd  = 'up' ;
          END;
        ELSE DO;
          _NODE_  =                   23;
          _LEAF_  =                    5;
          P_REP_updownIndup  =     0.02439024390243;
          P_REP_updownInddown  =                    0;
          P_REP_updownIndunchange  =     0.97560975609756;
          Q_REP_updownIndup  =     0.02439024390243;
          Q_REP_updownInddown  =                    0;
          Q_REP_updownIndunchange  =     0.97560975609756;
          V_REP_updownIndup  =      0.1060606060606;
          V_REP_updownInddown  =                    0;
          V_REP_updownIndunchange  =     0.89393939393939;
          I_REP_updownInd  = 'UNCHANGE' ;
          U_REP_updownInd  = 'unchange' ;
          END;
        END;
      END;
    ELSE DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
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
    END;
  END;
ELSE DO;
  IF  NOT MISSING(vol ) AND
    vol  <                 90.5 THEN DO;
    _NODE_  =                    6;
    _LEAF_  =                    8;
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
      IF  NOT MISSING(open ) AND
        open  <               0.0925 THEN DO;
        _NODE_  =                   16;
        _LEAF_  =                    9;
        P_REP_updownIndup  =     0.78571428571428;
        P_REP_updownInddown  =     0.07142857142857;
        P_REP_updownIndunchange  =     0.14285714285714;
        Q_REP_updownIndup  =     0.78571428571428;
        Q_REP_updownInddown  =     0.07142857142857;
        Q_REP_updownIndunchange  =     0.14285714285714;
        V_REP_updownIndup  =     0.85714285714285;
        V_REP_updownInddown  =                    0;
        V_REP_updownIndunchange  =     0.14285714285714;
        I_REP_updownInd  = 'UP' ;
        U_REP_updownInd  = 'up' ;
        END;
      ELSE DO;
        IF  NOT MISSING(lastDone ) AND
                        0.1025 <= lastDone  THEN DO;
          IF  NOT MISSING(open ) AND
            open  <               0.1025 THEN DO;
            _NODE_  =                   30;
            _LEAF_  =                   12;
            P_REP_updownIndup  =                    1;
            P_REP_updownInddown  =                    0;
            P_REP_updownIndunchange  =                    0;
            Q_REP_updownIndup  =                    1;
            Q_REP_updownInddown  =                    0;
            Q_REP_updownIndunchange  =                    0;
            V_REP_updownIndup  =                    1;
            V_REP_updownInddown  =                    0;
            V_REP_updownIndunchange  =                    0;
            I_REP_updownInd  = 'UP' ;
            U_REP_updownInd  = 'up' ;
            END;
          ELSE DO;
            _NODE_  =                   31;
            _LEAF_  =                   13;
            P_REP_updownIndup  =     0.08333333333333;
            P_REP_updownInddown  =                0.125;
            P_REP_updownIndunchange  =     0.79166666666666;
            Q_REP_updownIndup  =     0.08333333333333;
            Q_REP_updownInddown  =                0.125;
            Q_REP_updownIndunchange  =     0.79166666666666;
            V_REP_updownIndup  =     0.07407407407407;
            V_REP_updownInddown  =     0.18518518518518;
            V_REP_updownIndunchange  =     0.74074074074074;
            I_REP_updownInd  = 'UNCHANGE' ;
            U_REP_updownInd  = 'unchange' ;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(open ) AND
                          0.1025 <= open  THEN DO;
            _NODE_  =                   29;
            _LEAF_  =                   11;
            P_REP_updownIndup  =                    0;
            P_REP_updownInddown  =                    1;
            P_REP_updownIndunchange  =                    0;
            Q_REP_updownIndup  =                    0;
            Q_REP_updownInddown  =                    1;
            Q_REP_updownIndunchange  =                    0;
            V_REP_updownIndup  =                    0;
            V_REP_updownInddown  =                    1;
            V_REP_updownIndunchange  =                    0;
            I_REP_updownInd  = 'DOWN' ;
            U_REP_updownInd  = 'down' ;
            END;
          ELSE DO;
            _NODE_  =                   28;
            _LEAF_  =                   10;
            P_REP_updownIndup  =     0.15151515151515;
            P_REP_updownInddown  =     0.27272727272727;
            P_REP_updownIndunchange  =     0.57575757575757;
            Q_REP_updownIndup  =     0.15151515151515;
            Q_REP_updownInddown  =     0.27272727272727;
            Q_REP_updownIndunchange  =     0.57575757575757;
            V_REP_updownIndup  =     0.10714285714285;
            V_REP_updownInddown  =     0.53571428571428;
            V_REP_updownIndunchange  =     0.35714285714285;
            I_REP_updownInd  = 'UNCHANGE' ;
            U_REP_updownInd  = 'unchange' ;
            END;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(open ) AND
        open  <               0.1125 THEN DO;
        _NODE_  =                   18;
        _LEAF_  =                   14;
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
        IF  NOT MISSING(high ) AND
          high  <               0.4125 THEN DO;
          _NODE_  =                   26;
          _LEAF_  =                   15;
          P_REP_updownIndup  =      0.3063973063973;
          P_REP_updownInddown  =     0.45454545454545;
          P_REP_updownIndunchange  =     0.23905723905723;
          Q_REP_updownIndup  =      0.3063973063973;
          Q_REP_updownInddown  =     0.45454545454545;
          Q_REP_updownIndunchange  =     0.23905723905723;
          V_REP_updownIndup  =     0.29966329966329;
          V_REP_updownInddown  =     0.48484848484848;
          V_REP_updownIndunchange  =     0.21548821548821;
          I_REP_updownInd  = 'DOWN' ;
          U_REP_updownInd  = 'down' ;
          END;
        ELSE DO;
          _NODE_  =                   27;
          _LEAF_  =                   16;
          P_REP_updownIndup  =     0.34970530451866;
          P_REP_updownInddown  =     0.53438113948919;
          P_REP_updownIndunchange  =     0.11591355599214;
          Q_REP_updownIndup  =     0.34970530451866;
          Q_REP_updownInddown  =     0.53438113948919;
          Q_REP_updownIndunchange  =     0.11591355599214;
          V_REP_updownIndup  =     0.36072144288577;
          V_REP_updownInddown  =     0.50901803607214;
          V_REP_updownIndunchange  =     0.13026052104208;
          I_REP_updownInd  = 'DOWN' ;
          U_REP_updownInd  = 'down' ;
          END;
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
 
drop _LEAF_;
