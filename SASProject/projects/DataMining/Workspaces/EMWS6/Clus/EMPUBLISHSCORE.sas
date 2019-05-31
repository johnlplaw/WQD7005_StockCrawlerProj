*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize buyval ;
drop T_buyval ;
if missing( buyval ) then T_buyval = .;
else T_buyval = (buyval - 13550.9536299499) * 0.00001114535833;

*** Standardize chg ;
drop T_chg ;
if missing( chg ) then T_chg = .;
else T_chg = (chg - 0.00593730339964) * 71.2862617331785;

*** Standardize downcnt ;
drop T_downcnt ;
if missing( downcnt ) then T_downcnt = .;
else T_downcnt = (downcnt - 15.4404404404404) * 0.09135263837716;

*** Standardize downpricesum ;
drop T_downpricesum ;
if missing( downpricesum ) then T_downpricesum = .;
else T_downpricesum = (downpricesum - 0.41546546546546) * 0.94412711101642;

*** Standardize high ;
drop T_high ;
if missing( high ) then T_high = .;
else T_high = (high - 1.48120177913346) * 0.16825330171052;

*** Standardize lastDone ;
drop T_lastDone ;
if missing( lastDone ) then T_lastDone = .;
else T_lastDone = (lastDone - 1.63920565459666) * 0.16649138767014;

*** Standardize low ;
drop T_low ;
if missing( low ) then T_low = .;
else T_low = (low - 1.45505365167219) * 0.17005686073207;

*** Standardize open ;
drop T_open ;
if missing( open ) then T_open = .;
else T_open = (open - 1.46803728165452) * 0.16911536430417;

*** Standardize sellVal ;
drop T_sellVal ;
if missing( sellVal ) then T_sellVal = .;
else T_sellVal = (sellVal - 7801.77002866673) * 0.0000248007144;

*** Standardize unchgcnt ;
drop T_unchgcnt ;
if missing( unchgcnt ) then T_unchgcnt = .;
else T_unchgcnt = (unchgcnt - 17.082082082082) * 0.10559324022608;

*** Standardize upcnt ;
drop T_upcnt ;
if missing( upcnt ) then T_upcnt = .;
else T_upcnt = (upcnt - 28.2582582582582) * 0.08244226796921;

*** Standardize uppricesum ;
drop T_uppricesum ;
if missing( uppricesum ) then T_uppricesum = .;
else T_uppricesum = (uppricesum - 10.710055055055) * 0.0221812223636;

*** Standardize vol ;
drop T_vol ;
if missing( vol ) then T_vol = .;
else T_vol = (vol - 20079.7904259297) * 0.00001371524738;

*** End Class Look-up, Standardization, Replacement ;


*** Omitted Cases;
if _dm_bad then do;
   _SEGMENT_ = .; Distance = .;
   goto CLUSvlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUSvads [5] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 5; CLUSvads [_vqclus] = 0; end;
if not missing( T_buyval ) then do;
   CLUSvads [1] + ( T_buyval - 10.7339799457853 )**2;
   CLUSvads [2] + ( T_buyval - -0.14890000882264 )**2;
   CLUSvads [3] + ( T_buyval - -0.15061778260784 )**2;
   CLUSvads [4] + ( T_buyval - -0.14313435528398 )**2;
   CLUSvads [5] + ( T_buyval - -0.05127028045132 )**2;
end;
else _vqmvar + 1;
if not missing( T_chg ) then do;
   CLUSvads [1] + ( T_chg - -0.35313052964292 )**2;
   CLUSvads [2] + ( T_chg - 22.7155712180782 )**2;
   CLUSvads [3] + ( T_chg - 0.35973208768885 )**2;
   CLUSvads [4] + ( T_chg - 2.79047675006557 )**2;
   CLUSvads [5] + ( T_chg - -0.09008242928478 )**2;
end;
else _vqmvar + 1;
if not missing( T_downcnt ) then do;
   CLUSvads [1] + ( T_downcnt - -0.58835122654521 )**2;
   CLUSvads [2] + ( T_downcnt - 1.05599626424373 )**2;
   CLUSvads [3] + ( T_downcnt - -1.20954916750992 )**2;
   CLUSvads [4] + ( T_downcnt - 1.28239193326539 )**2;
   CLUSvads [5] + ( T_downcnt - -0.02234353239282 )**2;
end;
else _vqmvar + 1;
if not missing( T_downpricesum ) then do;
   CLUSvads [1] + ( T_downpricesum - -0.34882236253024 )**2;
   CLUSvads [2] + ( T_downpricesum - 21.0394332104359 )**2;
   CLUSvads [3] + ( T_downpricesum - 0.10624690497966 )**2;
   CLUSvads [4] + ( T_downpricesum - 3.53860049257748 )**2;
   CLUSvads [5] + ( T_downpricesum - -0.10488535466524 )**2;
end;
else _vqmvar + 1;
if not missing( T_high ) then do;
   CLUSvads [1] + ( T_high - -0.24406743550603 )**2;
   CLUSvads [2] + ( T_high - 24.551319582293 )**2;
   CLUSvads [3] + ( T_high - 0.85968801496923 )**2;
   CLUSvads [4] + ( T_high - 3.13830950094874 )**2;
   CLUSvads [5] + ( T_high - -0.10343061243671 )**2;
end;
else _vqmvar + 1;
if not missing( T_lastDone ) then do;
   CLUSvads [1] + ( T_lastDone - -0.26819181918152 )**2;
   CLUSvads [2] + ( T_lastDone - 24.1571046178226 )**2;
   CLUSvads [3] + ( T_lastDone - 2.34787370844438 )**2;
   CLUSvads [4] + ( T_lastDone - 3.08808943396433 )**2;
   CLUSvads [5] + ( T_lastDone - -0.1094109544511 )**2;
end;
else _vqmvar + 1;
if not missing( T_low ) then do;
   CLUSvads [1] + ( T_low - -0.24305940726453 )**2;
   CLUSvads [2] + ( T_low - 24.5543755454864 )**2;
   CLUSvads [3] + ( T_low - 0.86922397461879 )**2;
   CLUSvads [4] + ( T_low - 3.1341818488125 )**2;
   CLUSvads [5] + ( T_low - -0.10339003202585 )**2;
end;
else _vqmvar + 1;
if not missing( T_open ) then do;
   CLUSvads [1] + ( T_open - -0.2435213399665 )**2;
   CLUSvads [2] + ( T_open - 24.5543025644727 )**2;
   CLUSvads [3] + ( T_open - 0.86432291537691 )**2;
   CLUSvads [4] + ( T_open - 3.13685178707528 )**2;
   CLUSvads [5] + ( T_open - -0.10342580470907 )**2;
end;
else _vqmvar + 1;
if not missing( T_sellVal ) then do;
   CLUSvads [1] + ( T_sellVal - 11.2892336551188 )**2;
   CLUSvads [2] + ( T_sellVal - -0.18684125258824 )**2;
   CLUSvads [3] + ( T_sellVal - -0.19317299694625 )**2;
   CLUSvads [4] + ( T_sellVal - -0.17369335624778 )**2;
   CLUSvads [5] + ( T_sellVal - -0.05315908274049 )**2;
end;
else _vqmvar + 1;
if not missing( T_unchgcnt ) then do;
   CLUSvads [1] + ( T_unchgcnt - 2.35662126805272 )**2;
   CLUSvads [2] + ( T_unchgcnt - -1.38137943595063 )**2;
   CLUSvads [3] + ( T_unchgcnt - -1.02236241918195 )**2;
   CLUSvads [4] + ( T_unchgcnt - -0.92686940193401 )**2;
   CLUSvads [5] + ( T_unchgcnt - 0.01660941081458 )**2;
end;
else _vqmvar + 1;
if not missing( T_upcnt ) then do;
   CLUSvads [1] + ( T_upcnt - -1.29090232325848 )**2;
   CLUSvads [2] + ( T_upcnt - 0.14359313940583 )**2;
   CLUSvads [3] + ( T_upcnt - 1.90785767394702 )**2;
   CLUSvads [4] + ( T_upcnt - -0.41558050421144 )**2;
   CLUSvads [5] + ( T_upcnt - 0.00655956653265 )**2;
end;
else _vqmvar + 1;
if not missing( T_uppricesum ) then do;
   CLUSvads [1] + ( T_uppricesum - -0.23614251447134 )**2;
   CLUSvads [2] + ( T_uppricesum - 0.3657671355874 )**2;
   CLUSvads [3] + ( T_uppricesum - 12.1713678390575 )**2;
   CLUSvads [4] + ( T_uppricesum - 0.08564722916426 )**2;
   CLUSvads [5] + ( T_uppricesum - -0.06426091194745 )**2;
end;
else _vqmvar + 1;
if not missing( T_vol ) then do;
   CLUSvads [1] + ( T_vol - 1.46120091323277 )**2;
   CLUSvads [2] + ( T_vol - -0.26571273105516 )**2;
   CLUSvads [3] + ( T_vol - -0.27476101701592 )**2;
   CLUSvads [4] + ( T_vol - -0.17875260781075 )**2;
   CLUSvads [5] + ( T_vol - -0.00161158214547 )**2;
end;
else _vqmvar + 1;
_vqnvar = 13 - _vqmvar;
if _vqnvar <= 1.9213075574953E-11 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUSvads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 5;
      if CLUSvads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUSvads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (13 / _vqnvar));
end;
CLUSvlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
*------------------------------------------------------------*;
* Clus: Creating Segment Label;
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
