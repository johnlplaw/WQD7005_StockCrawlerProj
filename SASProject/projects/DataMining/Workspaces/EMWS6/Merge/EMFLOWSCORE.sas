*------------------------------------------------------------*;
* Merge: Score Code of path 1;
*------------------------------------------------------------*;
data &em_score_output;
set &em_score_output;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: SAMPLE;
* NODE: FIMPORT;
*------------------------------------------------------------*;
data em_Merge_path1;
set &em_score_output;
run;
*------------------------------------------------------------*;
* Merge: Score Code of path 2;
*------------------------------------------------------------*;
data &em_score_output;
set &em_score_output;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: SAMPLE;
* NODE: FIMPORT;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: princompanalysis Class;
* TYPE: MODIFY;
* NODE: PRINCOMP;
*------------------------------------------------------------*;
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
/****************************************/
* Principal Component 1;
/****************************************/
;
label PC_1 = "Principal Component 1";
PC_1 =
-0.03296009*_D1+
0.3901494046*_D2+
0.1279075281*_D3+
0.3943197458*_D4+
0.4069287077*_D5+
0.404315916*_D6+
0.4066766738*_D7+
0.4068114795*_D8+
-0.036953276*_D9+
-0.103889225*_D10+
-0.033113006*_D11+
0.0405245418*_D12+
-0.002760747*_D13;
/****************************************/
* Principal Component 2;
/****************************************/
;
label PC_2 = "Principal Component 2";
PC_2 =
0.506211409*_D1+
0.008589787*_D2+
0.1995980467*_D3+
0.0376934032*_D4+
0.0199943257*_D5+
-0.006269401*_D6+
0.0198736034*_D7+
0.019978002*_D8+
0.5202068389*_D9+
0.3371749078*_D10+
-0.441180429*_D11+
-0.208582243*_D12+
0.2805959661*_D13;
/****************************************/
* Principal Component 3;
/****************************************/
;
label PC_3 = "Principal Component 3";
PC_3 =
0.3828532562*_D1+
0.0141173842*_D2+
-0.581135599*_D3+
-0.05892999*_D4+
0.0684378985*_D5+
0.1099829438*_D6+
0.0694733577*_D7+
0.0688635745*_D8+
0.3759478874*_D9+
0.0869299193*_D10+
0.4559657662*_D11+
0.3406316559*_D12+
-0.113382944*_D13;
/****************************************/
* Principal Component 4;
/****************************************/
;
label PC_4 = "Principal Component 4";
PC_4 =
0.1588083642*_D1+
0.0120176504*_D2+
0.2642934255*_D3+
0.0429445933*_D4+
-0.070690592*_D5+
-0.05271125*_D6+
-0.07185793*_D7+
-0.071261988*_D8+
0.1682729957*_D9+
-0.666775421*_D10+
0.2760555711*_D11+
0.1415842814*_D12+
0.5619294504*_D13;
/****************************************/
* Principal Component 5;
/****************************************/
;
label PC_5 = "Principal Component 5";
PC_5 =
-0.128741293*_D1+
-0.051612626*_D2+
0.1208934503*_D3+
-0.083067728*_D4+
-0.020385888*_D5+
0.0863016873*_D6+
-0.019299292*_D7+
-0.01984605*_D8+
-0.107011314*_D9+
0.2439986617*_D10+
-0.297486825*_D11+
0.8566328069*_D12+
0.2393982112*_D13;
/****************************************/
* Principal Component 6;
/****************************************/
;
label PC_6 = "Principal Component 6";
PC_6 =
-0.270804669*_D1+
0.0072493827*_D2+
-0.403871*_D3+
-0.058790819*_D4+
0.0727600275*_D5+
0.0399826911*_D6+
0.0736172292*_D7+
0.0730809341*_D8+
-0.178269956*_D9+
0.3109417772*_D10+
0.1245672457*_D11+
-0.259178455*_D12+
0.7288592047*_D13;
/****************************************/
* Principal Component 7;
/****************************************/
;
label PC_7 = "Principal Component 7";
PC_7 =
-0.009417518*_D1+
0.7388662797*_D2+
-0.120030121*_D3+
0.3931600262*_D4+
-0.256412675*_D5+
-0.250071447*_D6+
-0.264538191*_D7+
-0.260555313*_D8+
-0.013468977*_D9+
0.1180239508*_D10+
0.0039479416*_D11+
0.0668686089*_D12+
0.0159723952*_D13;
/****************************************/
* Principal Component 8;
/****************************************/
;
label PC_8 = "Principal Component 8";
PC_8 =
0.6932993414*_D1+
0.0161931241*_D2+
-0.012743238*_D3+
-0.035858427*_D4+
0.0054443575*_D5+
0.0044861298*_D6+
0.0057532404*_D7+
0.005541379*_D8+
-0.71666776*_D9+
0.0220706687*_D10+
0.0002556866*_D11+
-0.008450501*_D12+
0.0577991894*_D13;
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
*------------------------------------------------------------*;
* TOOL: Clustering;
* TYPE: EXPLORE;
* NODE: Clus3;
*------------------------------------------------------------*;
*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize PC_1 ;
drop T_PC_1 ;
if missing( PC_1 ) then T_PC_1 = .;
else T_PC_1 = (PC_1 - 7.5444072077356E-14) * 0.41311105392193;

*** Standardize PC_2 ;
drop T_PC_2 ;
if missing( PC_2 ) then T_PC_2 = .;
else T_PC_2 = (PC_2 - 3.5688280270057E-15) * 0.66464502800318;

*** Standardize PC_3 ;
drop T_PC_3 ;
if missing( PC_3 ) then T_PC_3 = .;
else T_PC_3 = (PC_3 - 4.0723180583435E-15) * 0.75372794858759;

*** Standardize PC_4 ;
drop T_PC_4 ;
if missing( PC_4 ) then T_PC_4 = .;
else T_PC_4 = (PC_4 - -6.1529026785157E-16) * 0.90620831186419;

*** Standardize PC_5 ;
drop T_PC_5 ;
if missing( PC_5 ) then T_PC_5 = .;
else T_PC_5 = (PC_5 - -8.0252788065322E-15) * 1.09133458469806;

*** Standardize PC_6 ;
drop T_PC_6 ;
if missing( PC_6 ) then T_PC_6 = .;
else T_PC_6 = (PC_6 - 2.4493323063228E-15) * 1.20481174644611;

*** Standardize PC_7 ;
drop T_PC_7 ;
if missing( PC_7 ) then T_PC_7 = .;
else T_PC_7 = (PC_7 - 1.4166404119178E-13) * 2.53199659979449;

*** Standardize PC_8 ;
drop T_PC_8 ;
if missing( PC_8 ) then T_PC_8 = .;
else T_PC_8 = (PC_8 - 3.4307412599821E-15) * 2.82159294015647;

*** End Class Look-up, Standardization, Replacement ;


*** Omitted Cases;
if _dm_bad then do;
   _SEGMENT_ = .; Distance = .;
   goto CLUS3vlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUS3vads [37] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 37; CLUS3vads [_vqclus] = 0; end;
if not missing( T_PC_1 ) then do;
   CLUS3vads [1] + ( T_PC_1 - 8.61641163616144 )**2;
   CLUS3vads [2] + ( T_PC_1 - 4.10187420568367 )**2;
   CLUS3vads [3] + ( T_PC_1 - -0.65292676172603 )**2;
   CLUS3vads [4] + ( T_PC_1 - -0.26607812320425 )**2;
   CLUS3vads [5] + ( T_PC_1 - -0.42257589575639 )**2;
   CLUS3vads [6] + ( T_PC_1 - 7.33262629250672 )**2;
   CLUS3vads [7] + ( T_PC_1 - -0.49986801427183 )**2;
   CLUS3vads [8] + ( T_PC_1 - -0.24587405480452 )**2;
   CLUS3vads [9] + ( T_PC_1 - -0.24779193830531 )**2;
   CLUS3vads [10] + ( T_PC_1 - -0.86905573671425 )**2;
   CLUS3vads [11] + ( T_PC_1 - 0.16122601821417 )**2;
   CLUS3vads [12] + ( T_PC_1 - 0.16860178794427 )**2;
   CLUS3vads [13] + ( T_PC_1 - 5.08653799594628 )**2;
   CLUS3vads [14] + ( T_PC_1 - -0.41823460611635 )**2;
   CLUS3vads [15] + ( T_PC_1 - 0.63919923207389 )**2;
   CLUS3vads [16] + ( T_PC_1 - 2.60127300618919 )**2;
   CLUS3vads [17] + ( T_PC_1 - -0.50288848464287 )**2;
   CLUS3vads [18] + ( T_PC_1 - -0.16805383381997 )**2;
   CLUS3vads [19] + ( T_PC_1 - -0.06187135156309 )**2;
   CLUS3vads [20] + ( T_PC_1 - 0.9938924249163 )**2;
   CLUS3vads [21] + ( T_PC_1 - 0.02297096856985 )**2;
   CLUS3vads [22] + ( T_PC_1 - 0.19010781604934 )**2;
   CLUS3vads [23] + ( T_PC_1 - -0.03256765554499 )**2;
   CLUS3vads [24] + ( T_PC_1 - 0.21828457130233 )**2;
   CLUS3vads [25] + ( T_PC_1 - 2.0416108219665 )**2;
   CLUS3vads [26] + ( T_PC_1 - -0.2118253131177 )**2;
   CLUS3vads [27] + ( T_PC_1 - 4.87847625144793 )**2;
   CLUS3vads [28] + ( T_PC_1 - -1.00494550755827 )**2;
   CLUS3vads [29] + ( T_PC_1 - 23.6267824322772 )**2;
   CLUS3vads [30] + ( T_PC_1 - -0.49000617748674 )**2;
   CLUS3vads [31] + ( T_PC_1 - -0.57022839405754 )**2;
   CLUS3vads [32] + ( T_PC_1 - 0.73805540013846 )**2;
   CLUS3vads [33] + ( T_PC_1 - 0.03758332679869 )**2;
   CLUS3vads [34] + ( T_PC_1 - -0.48605632146872 )**2;
   CLUS3vads [35] + ( T_PC_1 - -0.54629184077716 )**2;
   CLUS3vads [36] + ( T_PC_1 - -0.28937733158671 )**2;
   CLUS3vads [37] + ( T_PC_1 - -0.30209263533366 )**2;
end;
else _vqmvar + 1;
if not missing( T_PC_2 ) then do;
   CLUS3vads [1] + ( T_PC_2 - 0.12479707260166 )**2;
   CLUS3vads [2] + ( T_PC_2 - -1.28296266871975 )**2;
   CLUS3vads [3] + ( T_PC_2 - 6.6134626526631 )**2;
   CLUS3vads [4] + ( T_PC_2 - 0.40139374796875 )**2;
   CLUS3vads [5] + ( T_PC_2 - 0.1097114478866 )**2;
   CLUS3vads [6] + ( T_PC_2 - 0.26503707263583 )**2;
   CLUS3vads [7] + ( T_PC_2 - 3.38680896407622 )**2;
   CLUS3vads [8] + ( T_PC_2 - -0.35602732013481 )**2;
   CLUS3vads [9] + ( T_PC_2 - 4.91293899798522 )**2;
   CLUS3vads [10] + ( T_PC_2 - 10.8292505865774 )**2;
   CLUS3vads [11] + ( T_PC_2 - -3.39361908583967 )**2;
   CLUS3vads [12] + ( T_PC_2 - -1.85544489787868 )**2;
   CLUS3vads [13] + ( T_PC_2 - 0.17913150044382 )**2;
   CLUS3vads [14] + ( T_PC_2 - 0.13366838957965 )**2;
   CLUS3vads [15] + ( T_PC_2 - -0.00863635774195 )**2;
   CLUS3vads [16] + ( T_PC_2 - 0.14917076025873 )**2;
   CLUS3vads [17] + ( T_PC_2 - 5.17528438598299 )**2;
   CLUS3vads [18] + ( T_PC_2 - -2.08524416274474 )**2;
   CLUS3vads [19] + ( T_PC_2 - 0.47567076232526 )**2;
   CLUS3vads [20] + ( T_PC_2 - -0.06110366613994 )**2;
   CLUS3vads [21] + ( T_PC_2 - -0.74776035083248 )**2;
   CLUS3vads [22] + ( T_PC_2 - 1.26946088523501 )**2;
   CLUS3vads [23] + ( T_PC_2 - 1.11758504800478 )**2;
   CLUS3vads [24] + ( T_PC_2 - -1.3043598235682 )**2;
   CLUS3vads [25] + ( T_PC_2 - 0.66740434150039 )**2;
   CLUS3vads [26] + ( T_PC_2 - 5.37116951147653 )**2;
   CLUS3vads [27] + ( T_PC_2 - 0.08246497627348 )**2;
   CLUS3vads [28] + ( T_PC_2 - 14.6652314207353 )**2;
   CLUS3vads [29] + ( T_PC_2 - 1.10621689553393 )**2;
   CLUS3vads [30] + ( T_PC_2 - 1.85129414722589 )**2;
   CLUS3vads [31] + ( T_PC_2 - 5.86308962077346 )**2;
   CLUS3vads [32] + ( T_PC_2 - -3.95315422468417 )**2;
   CLUS3vads [33] + ( T_PC_2 - 0.1343894356149 )**2;
   CLUS3vads [34] + ( T_PC_2 - 1.97768076047712 )**2;
   CLUS3vads [35] + ( T_PC_2 - 2.21731474645736 )**2;
   CLUS3vads [36] + ( T_PC_2 - 3.50146041433769 )**2;
   CLUS3vads [37] + ( T_PC_2 - -1.13606523899642 )**2;
end;
else _vqmvar + 1;
if not missing( T_PC_3 ) then do;
   CLUS3vads [1] + ( T_PC_3 - 2.77853544113129 )**2;
   CLUS3vads [2] + ( T_PC_3 - 3.92882414302299 )**2;
   CLUS3vads [3] + ( T_PC_3 - 5.06246077490903 )**2;
   CLUS3vads [4] + ( T_PC_3 - -0.07077960400659 )**2;
   CLUS3vads [5] + ( T_PC_3 - 1.47174456715352 )**2;
   CLUS3vads [6] + ( T_PC_3 - -0.01614901793406 )**2;
   CLUS3vads [7] + ( T_PC_3 - 2.21311514804751 )**2;
   CLUS3vads [8] + ( T_PC_3 - 0.38011386932552 )**2;
   CLUS3vads [9] + ( T_PC_3 - -0.5335740568503 )**2;
   CLUS3vads [10] + ( T_PC_3 - 7.50908719495878 )**2;
   CLUS3vads [11] + ( T_PC_3 - 4.79918977004863 )**2;
   CLUS3vads [12] + ( T_PC_3 - 2.93022669641688 )**2;
   CLUS3vads [13] + ( T_PC_3 - -0.37779733871332 )**2;
   CLUS3vads [14] + ( T_PC_3 - 2.19142475776821 )**2;
   CLUS3vads [15] + ( T_PC_3 - -0.7143473948 )**2;
   CLUS3vads [16] + ( T_PC_3 - -0.25307412741511 )**2;
   CLUS3vads [17] + ( T_PC_3 - 2.54545299019137 )**2;
   CLUS3vads [18] + ( T_PC_3 - 2.36425249203081 )**2;
   CLUS3vads [19] + ( T_PC_3 - -0.73965860010372 )**2;
   CLUS3vads [20] + ( T_PC_3 - -0.64472384021543 )**2;
   CLUS3vads [21] + ( T_PC_3 - 0.93086368459283 )**2;
   CLUS3vads [22] + ( T_PC_3 - -1.47684016037016 )**2;
   CLUS3vads [23] + ( T_PC_3 - -1.0144630874061 )**2;
   CLUS3vads [24] + ( T_PC_3 - 1.92804213894986 )**2;
   CLUS3vads [25] + ( T_PC_3 - -1.33189989971921 )**2;
   CLUS3vads [26] + ( T_PC_3 - -0.97133179810353 )**2;
   CLUS3vads [27] + ( T_PC_3 - 0.26445136684113 )**2;
   CLUS3vads [28] + ( T_PC_3 - 11.0166065639888 )**2;
   CLUS3vads [29] + ( T_PC_3 - 4.65343802319933 )**2;
   CLUS3vads [30] + ( T_PC_3 - 1.58666159428261 )**2;
   CLUS3vads [31] + ( T_PC_3 - 4.02105122482519 )**2;
   CLUS3vads [32] + ( T_PC_3 - 6.02839159885806 )**2;
   CLUS3vads [33] + ( T_PC_3 - -0.82031987390287 )**2;
   CLUS3vads [34] + ( T_PC_3 - 3.41720377823927 )**2;
   CLUS3vads [35] + ( T_PC_3 - 1.50719898036142 )**2;
   CLUS3vads [36] + ( T_PC_3 - -0.04343294612936 )**2;
   CLUS3vads [37] + ( T_PC_3 - 1.06302968889179 )**2;
end;
else _vqmvar + 1;
if not missing( T_PC_4 ) then do;
   CLUS3vads [1] + ( T_PC_4 - -2.25050304991152 )**2;
   CLUS3vads [2] + ( T_PC_4 - -0.48590593635098 )**2;
   CLUS3vads [3] + ( T_PC_4 - 1.32075459488837 )**2;
   CLUS3vads [4] + ( T_PC_4 - -1.10806015806787 )**2;
   CLUS3vads [5] + ( T_PC_4 - 0.15398614635946 )**2;
   CLUS3vads [6] + ( T_PC_4 - 0.37700260849148 )**2;
   CLUS3vads [7] + ( T_PC_4 - -0.01464178468089 )**2;
   CLUS3vads [8] + ( T_PC_4 - -0.27610933521808 )**2;
   CLUS3vads [9] + ( T_PC_4 - 8.22130808818323 )**2;
   CLUS3vads [10] + ( T_PC_4 - 2.37882468564894 )**2;
   CLUS3vads [11] + ( T_PC_4 - 2.87757593022091 )**2;
   CLUS3vads [12] + ( T_PC_4 - 0.88757263808928 )**2;
   CLUS3vads [13] + ( T_PC_4 - 0.52722862227735 )**2;
   CLUS3vads [14] + ( T_PC_4 - 1.24940751662956 )**2;
   CLUS3vads [15] + ( T_PC_4 - 0.57205413481484 )**2;
   CLUS3vads [16] + ( T_PC_4 - 0.11493283386226 )**2;
   CLUS3vads [17] + ( T_PC_4 - 1.88743646611182 )**2;
   CLUS3vads [18] + ( T_PC_4 - 1.68330518293983 )**2;
   CLUS3vads [19] + ( T_PC_4 - 0.7799542532139 )**2;
   CLUS3vads [20] + ( T_PC_4 - 0.72673107662822 )**2;
   CLUS3vads [21] + ( T_PC_4 - 0.07347221095655 )**2;
   CLUS3vads [22] + ( T_PC_4 - 3.83205896691142 )**2;
   CLUS3vads [23] + ( T_PC_4 - 2.58188791066295 )**2;
   CLUS3vads [24] + ( T_PC_4 - 0.49527771637055 )**2;
   CLUS3vads [25] + ( T_PC_4 - -0.17491108939101 )**2;
   CLUS3vads [26] + ( T_PC_4 - 10.1400370304835 )**2;
   CLUS3vads [27] + ( T_PC_4 - -0.06181163273371 )**2;
   CLUS3vads [28] + ( T_PC_4 - 3.72321706892844 )**2;
   CLUS3vads [29] + ( T_PC_4 - -3.8599084313548 )**2;
   CLUS3vads [30] + ( T_PC_4 - -0.93461970112188 )**2;
   CLUS3vads [31] + ( T_PC_4 - 1.36384612630777 )**2;
   CLUS3vads [32] + ( T_PC_4 - 3.36488673282303 )**2;
   CLUS3vads [33] + ( T_PC_4 - 0.24173441381106 )**2;
   CLUS3vads [34] + ( T_PC_4 - 1.61878018035245 )**2;
   CLUS3vads [35] + ( T_PC_4 - -1.46067920647467 )**2;
   CLUS3vads [36] + ( T_PC_4 - 3.73823990655946 )**2;
   CLUS3vads [37] + ( T_PC_4 - 0.65995940149351 )**2;
end;
else _vqmvar + 1;
if not missing( T_PC_5 ) then do;
   CLUS3vads [1] + ( T_PC_5 - 2.34196004144236 )**2;
   CLUS3vads [2] + ( T_PC_5 - 9.28441373000867 )**2;
   CLUS3vads [3] + ( T_PC_5 - -1.61363970534124 )**2;
   CLUS3vads [4] + ( T_PC_5 - 0.3685632240646 )**2;
   CLUS3vads [5] + ( T_PC_5 - -1.00524071729022 )**2;
   CLUS3vads [6] + ( T_PC_5 - -1.5549320647559 )**2;
   CLUS3vads [7] + ( T_PC_5 - -0.4007445149459 )**2;
   CLUS3vads [8] + ( T_PC_5 - -0.28008214386875 )**2;
   CLUS3vads [9] + ( T_PC_5 - 3.2325497835277 )**2;
   CLUS3vads [10] + ( T_PC_5 - -1.72505750622588 )**2;
   CLUS3vads [11] + ( T_PC_5 - 10.8652311666946 )**2;
   CLUS3vads [12] + ( T_PC_5 - 5.79027645834518 )**2;
   CLUS3vads [13] + ( T_PC_5 - -1.10947339063513 )**2;
   CLUS3vads [14] + ( T_PC_5 - -1.8040963369848 )**2;
   CLUS3vads [15] + ( T_PC_5 - -0.24236471473213 )**2;
   CLUS3vads [16] + ( T_PC_5 - -0.26715610919666 )**2;
   CLUS3vads [17] + ( T_PC_5 - 0.10022595823155 )**2;
   CLUS3vads [18] + ( T_PC_5 - 2.35071559822847 )**2;
   CLUS3vads [19] + ( T_PC_5 - 0.27208794918349 )**2;
   CLUS3vads [20] + ( T_PC_5 - -0.38509741010335 )**2;
   CLUS3vads [21] + ( T_PC_5 - 0.77061156612741 )**2;
   CLUS3vads [22] + ( T_PC_5 - 1.4217226062772 )**2;
   CLUS3vads [23] + ( T_PC_5 - 0.8265889743691 )**2;
   CLUS3vads [24] + ( T_PC_5 - 3.04959461443755 )**2;
   CLUS3vads [25] + ( T_PC_5 - 0.35880907694292 )**2;
   CLUS3vads [26] + ( T_PC_5 - 4.06358516769792 )**2;
   CLUS3vads [27] + ( T_PC_5 - -1.02584943569941 )**2;
   CLUS3vads [28] + ( T_PC_5 - -3.79117368113514 )**2;
   CLUS3vads [29] + ( T_PC_5 - -2.46666261208581 )**2;
   CLUS3vads [30] + ( T_PC_5 - -0.27577782326259 )**2;
   CLUS3vads [31] + ( T_PC_5 - -1.24263768338442 )**2;
   CLUS3vads [32] + ( T_PC_5 - 15.3672580276079 )**2;
   CLUS3vads [33] + ( T_PC_5 - 0.03750739261928 )**2;
   CLUS3vads [34] + ( T_PC_5 - -2.20994521207025 )**2;
   CLUS3vads [35] + ( T_PC_5 - 0.31199311359902 )**2;
   CLUS3vads [36] + ( T_PC_5 - 1.57381504921767 )**2;
   CLUS3vads [37] + ( T_PC_5 - -0.96667854647423 )**2;
end;
else _vqmvar + 1;
if not missing( T_PC_6 ) then do;
   CLUS3vads [1] + ( T_PC_6 - 1.89685461975059 )**2;
   CLUS3vads [2] + ( T_PC_6 - -1.33395332110785 )**2;
   CLUS3vads [3] + ( T_PC_6 - -3.23870872461563 )**2;
   CLUS3vads [4] + ( T_PC_6 - 0.46117797414306 )**2;
   CLUS3vads [5] + ( T_PC_6 - 0.29313288589069 )**2;
   CLUS3vads [6] + ( T_PC_6 - -0.52632224874162 )**2;
   CLUS3vads [7] + ( T_PC_6 - -0.85788892637319 )**2;
   CLUS3vads [8] + ( T_PC_6 - 0.2982784361972 )**2;
   CLUS3vads [9] + ( T_PC_6 - 10.4551725364602 )**2;
   CLUS3vads [10] + ( T_PC_6 - -3.71870946496318 )**2;
   CLUS3vads [11] + ( T_PC_6 - -3.79667422675504 )**2;
   CLUS3vads [12] + ( T_PC_6 - -1.44676011762818 )**2;
   CLUS3vads [13] + ( T_PC_6 - -0.84352951485704 )**2;
   CLUS3vads [14] + ( T_PC_6 - -0.3543181452679 )**2;
   CLUS3vads [15] + ( T_PC_6 - -0.74790977827219 )**2;
   CLUS3vads [16] + ( T_PC_6 - -0.18270242095085 )**2;
   CLUS3vads [17] + ( T_PC_6 - 0.41468656191529 )**2;
   CLUS3vads [18] + ( T_PC_6 - -0.99365222343619 )**2;
   CLUS3vads [19] + ( T_PC_6 - 0.31524725399831 )**2;
   CLUS3vads [20] + ( T_PC_6 - -0.79805482878374 )**2;
   CLUS3vads [21] + ( T_PC_6 - -0.0580635954295 )**2;
   CLUS3vads [22] + ( T_PC_6 - 4.25193803103072 )**2;
   CLUS3vads [23] + ( T_PC_6 - 2.15271364636028 )**2;
   CLUS3vads [24] + ( T_PC_6 - -0.68306868282355 )**2;
   CLUS3vads [25] + ( T_PC_6 - -1.13613107131649 )**2;
   CLUS3vads [26] + ( T_PC_6 - 13.3100287138142 )**2;
   CLUS3vads [27] + ( T_PC_6 - 0.09228436564907 )**2;
   CLUS3vads [28] + ( T_PC_6 - -9.00182136430077 )**2;
   CLUS3vads [29] + ( T_PC_6 - 5.09524837560379 )**2;
   CLUS3vads [30] + ( T_PC_6 - -0.17106079960484 )**2;
   CLUS3vads [31] + ( T_PC_6 - -2.70694959040217 )**2;
   CLUS3vads [32] + ( T_PC_6 - -5.23661243306197 )**2;
   CLUS3vads [33] + ( T_PC_6 - -0.67025218802241 )**2;
   CLUS3vads [34] + ( T_PC_6 - -1.84054771083151 )**2;
   CLUS3vads [35] + ( T_PC_6 - 1.04007032543037 )**2;
   CLUS3vads [36] + ( T_PC_6 - 4.20038401176327 )**2;
   CLUS3vads [37] + ( T_PC_6 - 0.28043106602033 )**2;
end;
else _vqmvar + 1;
if not missing( T_PC_7 ) then do;
   CLUS3vads [1] + ( T_PC_7 - -10.2615371570439 )**2;
   CLUS3vads [2] + ( T_PC_7 - -7.34513957191565 )**2;
   CLUS3vads [3] + ( T_PC_7 - 0.00424320848775 )**2;
   CLUS3vads [4] + ( T_PC_7 - 0.1378948481223 )**2;
   CLUS3vads [5] + ( T_PC_7 - -0.16465582142137 )**2;
   CLUS3vads [6] + ( T_PC_7 - 13.6367742106998 )**2;
   CLUS3vads [7] + ( T_PC_7 - 0.06596517500857 )**2;
   CLUS3vads [8] + ( T_PC_7 - 0.08982587319577 )**2;
   CLUS3vads [9] + ( T_PC_7 - -0.08357019107745 )**2;
   CLUS3vads [10] + ( T_PC_7 - 0.05103548151984 )**2;
   CLUS3vads [11] + ( T_PC_7 - 0.57489690975093 )**2;
   CLUS3vads [12] + ( T_PC_7 - 1.00200251660134 )**2;
   CLUS3vads [13] + ( T_PC_7 - 6.32903008698394 )**2;
   CLUS3vads [14] + ( T_PC_7 - -0.5591011486467 )**2;
   CLUS3vads [15] + ( T_PC_7 - 0.6638568561021 )**2;
   CLUS3vads [16] + ( T_PC_7 - -3.47168017180331 )**2;
   CLUS3vads [17] + ( T_PC_7 - 0.05460750267903 )**2;
   CLUS3vads [18] + ( T_PC_7 - -0.17985242087596 )**2;
   CLUS3vads [19] + ( T_PC_7 - -0.16325171783525 )**2;
   CLUS3vads [20] + ( T_PC_7 - 3.01895081348701 )**2;
   CLUS3vads [21] + ( T_PC_7 - 0.2941980334193 )**2;
   CLUS3vads [22] + ( T_PC_7 - 1.10493196299423 )**2;
   CLUS3vads [23] + ( T_PC_7 - -0.11511418307725 )**2;
   CLUS3vads [24] + ( T_PC_7 - 1.52362812233729 )**2;
   CLUS3vads [25] + ( T_PC_7 - -6.14087951228497 )**2;
   CLUS3vads [26] + ( T_PC_7 - -0.15166285611094 )**2;
   CLUS3vads [27] + ( T_PC_7 - 9.24524514963362 )**2;
   CLUS3vads [28] + ( T_PC_7 - -0.31892932275614 )**2;
   CLUS3vads [29] + ( T_PC_7 - -1.11167114605435 )**2;
   CLUS3vads [30] + ( T_PC_7 - 0.27294745514282 )**2;
   CLUS3vads [31] + ( T_PC_7 - -0.33018581687967 )**2;
   CLUS3vads [32] + ( T_PC_7 - 3.80597779095985 )**2;
   CLUS3vads [33] + ( T_PC_7 - -0.4207020760227 )**2;
   CLUS3vads [34] + ( T_PC_7 - -0.53002697473412 )**2;
   CLUS3vads [35] + ( T_PC_7 - 0.62416916809191 )**2;
   CLUS3vads [36] + ( T_PC_7 - -0.25712770805163 )**2;
   CLUS3vads [37] + ( T_PC_7 - -0.24751123233188 )**2;
end;
else _vqmvar + 1;
if not missing( T_PC_8 ) then do;
   CLUS3vads [1] + ( T_PC_8 - 0.53165973085691 )**2;
   CLUS3vads [2] + ( T_PC_8 - 0.03737303074014 )**2;
   CLUS3vads [3] + ( T_PC_8 - 7.41788076825039 )**2;
   CLUS3vads [4] + ( T_PC_8 - 0.05277934042961 )**2;
   CLUS3vads [5] + ( T_PC_8 - -3.75492834313238 )**2;
   CLUS3vads [6] + ( T_PC_8 - -0.41370195381194 )**2;
   CLUS3vads [7] + ( T_PC_8 - -2.68580042964054 )**2;
   CLUS3vads [8] + ( T_PC_8 - 0.09684410080715 )**2;
   CLUS3vads [9] + ( T_PC_8 - 0.89952672905061 )**2;
   CLUS3vads [10] + ( T_PC_8 - -14.8138984446295 )**2;
   CLUS3vads [11] + ( T_PC_8 - -0.29485060602258 )**2;
   CLUS3vads [12] + ( T_PC_8 - -0.02213877693311 )**2;
   CLUS3vads [13] + ( T_PC_8 - -0.48660084936803 )**2;
   CLUS3vads [14] + ( T_PC_8 - -7.78069158834828 )**2;
   CLUS3vads [15] + ( T_PC_8 - -0.06175275315986 )**2;
   CLUS3vads [16] + ( T_PC_8 - -0.13707449718904 )**2;
   CLUS3vads [17] + ( T_PC_8 - -0.80769194785839 )**2;
   CLUS3vads [18] + ( T_PC_8 - -0.08661259910201 )**2;
   CLUS3vads [19] + ( T_PC_8 - 0.01629034159285 )**2;
   CLUS3vads [20] + ( T_PC_8 - -0.05588093374125 )**2;
   CLUS3vads [21] + ( T_PC_8 - 0.06122421699674 )**2;
   CLUS3vads [22] + ( T_PC_8 - 0.80293709924924 )**2;
   CLUS3vads [23] + ( T_PC_8 - 0.24208805939236 )**2;
   CLUS3vads [24] + ( T_PC_8 - 0.03955359931178 )**2;
   CLUS3vads [25] + ( T_PC_8 - -0.15234276261482 )**2;
   CLUS3vads [26] + ( T_PC_8 - 1.01249515852634 )**2;
   CLUS3vads [27] + ( T_PC_8 - 0.07672876572484 )**2;
   CLUS3vads [28] + ( T_PC_8 - 15.7673666397213 )**2;
   CLUS3vads [29] + ( T_PC_8 - 0.28520361438317 )**2;
   CLUS3vads [30] + ( T_PC_8 - 2.55105871483958 )**2;
   CLUS3vads [31] + ( T_PC_8 - -14.6405930171068 )**2;
   CLUS3vads [32] + ( T_PC_8 - -0.33353937547777 )**2;
   CLUS3vads [33] + ( T_PC_8 - -0.0178443873257 )**2;
   CLUS3vads [34] + ( T_PC_8 - 1.75121865158294 )**2;
   CLUS3vads [35] + ( T_PC_8 - -6.16967133830172 )**2;
   CLUS3vads [36] + ( T_PC_8 - -0.62823545110993 )**2;
   CLUS3vads [37] + ( T_PC_8 - 0.0038783669883 )**2;
end;
else _vqmvar + 1;
_vqnvar = 8 - _vqmvar;
if _vqnvar <= 7.2759576141834E-12 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUS3vads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 37;
      if CLUS3vads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUS3vads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (8 / _vqnvar));
end;
CLUS3vlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
*------------------------------------------------------------*;
* Clus3: Creating Segment Label;
*------------------------------------------------------------*;
length _SEGMENT_LABEL_ $80;
label _SEGMENT_LABEL_='Segment Description';
if _SEGMENT_ = 1 then _SEGMENT_LABEL_="Cluster1";
else
if _SEGMENT_ = 2 then _SEGMENT_LABEL_="Cluster2";
else
if _SEGMENT_ = 3 then _SEGMENT_LABEL_="Cluster3";
else
if _SEGMENT_ = 4 then _SEGMENT_LABEL_="Cluster4";
else
if _SEGMENT_ = 5 then _SEGMENT_LABEL_="Cluster5";
else
if _SEGMENT_ = 6 then _SEGMENT_LABEL_="Cluster6";
else
if _SEGMENT_ = 7 then _SEGMENT_LABEL_="Cluster7";
else
if _SEGMENT_ = 8 then _SEGMENT_LABEL_="Cluster8";
else
if _SEGMENT_ = 9 then _SEGMENT_LABEL_="Cluster9";
else
if _SEGMENT_ = 10 then _SEGMENT_LABEL_="Cluster10";
else
if _SEGMENT_ = 11 then _SEGMENT_LABEL_="Cluster11";
else
if _SEGMENT_ = 12 then _SEGMENT_LABEL_="Cluster12";
else
if _SEGMENT_ = 13 then _SEGMENT_LABEL_="Cluster13";
else
if _SEGMENT_ = 14 then _SEGMENT_LABEL_="Cluster14";
else
if _SEGMENT_ = 15 then _SEGMENT_LABEL_="Cluster15";
else
if _SEGMENT_ = 16 then _SEGMENT_LABEL_="Cluster16";
else
if _SEGMENT_ = 17 then _SEGMENT_LABEL_="Cluster17";
else
if _SEGMENT_ = 18 then _SEGMENT_LABEL_="Cluster18";
else
if _SEGMENT_ = 19 then _SEGMENT_LABEL_="Cluster19";
else
if _SEGMENT_ = 20 then _SEGMENT_LABEL_="Cluster20";
else
if _SEGMENT_ = 21 then _SEGMENT_LABEL_="Cluster21";
else
if _SEGMENT_ = 22 then _SEGMENT_LABEL_="Cluster22";
else
if _SEGMENT_ = 23 then _SEGMENT_LABEL_="Cluster23";
else
if _SEGMENT_ = 24 then _SEGMENT_LABEL_="Cluster24";
else
if _SEGMENT_ = 25 then _SEGMENT_LABEL_="Cluster25";
else
if _SEGMENT_ = 26 then _SEGMENT_LABEL_="Cluster26";
else
if _SEGMENT_ = 27 then _SEGMENT_LABEL_="Cluster27";
else
if _SEGMENT_ = 28 then _SEGMENT_LABEL_="Cluster28";
else
if _SEGMENT_ = 29 then _SEGMENT_LABEL_="Cluster29";
else
if _SEGMENT_ = 30 then _SEGMENT_LABEL_="Cluster30";
else
if _SEGMENT_ = 31 then _SEGMENT_LABEL_="Cluster31";
else
if _SEGMENT_ = 32 then _SEGMENT_LABEL_="Cluster32";
else
if _SEGMENT_ = 33 then _SEGMENT_LABEL_="Cluster33";
else
if _SEGMENT_ = 34 then _SEGMENT_LABEL_="Cluster34";
else
if _SEGMENT_ = 35 then _SEGMENT_LABEL_="Cluster35";
else
if _SEGMENT_ = 36 then _SEGMENT_LABEL_="Cluster36";
else
if _SEGMENT_ = 37 then _SEGMENT_LABEL_="Cluster37";
data em_Merge_path2;
set &em_score_output;
run;
*------------------------------------------------------------*;
* Merge: Merging 2 Paths;
*------------------------------------------------------------*;
data &em_score_output;
merge
em_Merge_path1
em_Merge_path2
;
run;
proc datasets lib=WORK nolist;
delete
em_Merge_path1
em_Merge_path2
;
run;
quit;
