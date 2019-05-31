   
* ;
* Defining: REP_comp_code;
* ;
Length REP_comp_code$12;
Label REP_comp_code='Replacement: comp_code';
format REP_comp_code $CHAR12.;
REP_comp_code=comp_code;
*;
_UFORMAT200 = strip(put(comp_code,$CHAR12.));
if ^(_UFORMAT200 in(
"AASIA", "AAX", "AAX-WA", "ABFMY1", "ABLEGRP", "ABMB", "ABMB-CX", "ABMB-CY"
, "ACME", "ACOSTEC", "ADVCON", "ADVENTA", "ADVPKG", "AEM", "AEM-WA", "AEMULUS"
, "AEON", "AEONCR", "AEONCR-LA", "AFFIN", "AFUJIYA", "AHB", "AHB-WB", "AHEALTH"
, "AHP", "AIM", "AIRASIA", "AIRPORT", "AIRPORT-C2", "AIRPORT-C3", "AIRPORT-C4"
, "AIRPORT-C5", "AIRPORT-C6", "AIRPORT-C7", "AISB", "AJI", "AJIYA", "AJIYA-WA"
, "ALAM", "ALAQAR", "ALCOM", "ALLIANZ", "ALLIANZ-PA", "ALSREIT", "AMBANK"
, "AMBANK-C10", "AMBANK-C11", "AMBANK-C12", "AMBANK-C13", "AMEDIA", "AMFIRST"
, "AMPROP", "AMPROP-PA", "AMPROP-PB", "AMTEK", "AMTEL", "AMVERTON", "AMWAY"
, "ANALABS", "ANCOM", "ANCOMLB", "ANNJOO", "ANNJOO-PA", "ANZO", "ANZO-WA"
, "ANZO-WB", "ANZO-WC", "APB", "APEX", "APFT", "APM", "APOLLO", "APPASIA"
, "APPASIA-WA", "ARANK", "ARK", "ARK-WB", "ARMADA", "ARREIT", "ASB", "ASDION"
, "ASDION-WB", "ASIABRN", "ASIAFLE", "ASIAPAC", "ASIAPAC-LC", "ASIAPAC-WB"
, "ASIAPLY", "ASIAPLY-PA", "ASIAPLY-WA", "ASIAPLY-WB", "ASTINO", "ASTRO"
, "ASTRO-C10", "ASTRO-C11", "ASTRO-C12", "ASTRO-C13", "AT", "AT-WB", "ATAIMS"
, "ATLAN", "ATRIUM", "ATTA", "ATTA-LA", "ATTA-PA", "ATTA-WB", "ATTA-WC"
, "ATURMJU", "ATURMJU-PA", "AVI", "AWC", "AWC-WA", "AXIATA", "AXIATA-C28"
, "AXIATA-C29", "AXIATA-C30", "AXIATA-C31", "AXIATA-C32", "AXIATA-C33"
, "AXIATA-C34", "AXIATA-C35", "AXIATA-C36", "AXREIT", "AYER", "AYS", "AZRB"
, "AZRB-WA", "BAHVEST", "BAHVEST-WA", "BARAKAH", "BAT", "BAUTO", "BCB"
, "BCMALL", "BDB", "BENALEC", "BERTAM", "BHIC", "BIG", "BIMB", "BIMB-WA"
, "BINTAI", "BINTAI-WA", "BIOHLDG", "BIOHLDG-WA", "BIOOSMO", "BIPORT"
, "BJASSET", "BJASSET-WB", "BJCORP", "BJCORP-C10", "BJCORP-C11", "BJCORP-LD"
, "BJCORP-LE", "BJCORP-WB", "BJCORP-WC", "BJFOOD", "BJLAND", "BJMEDIA"
, "BJTOTO", "BJTOTO-CW", "BKAWAN", "BLDPLNT", "BOILERM", "BONIA", "BORNOIL"
, "BORNOIL-WC", "BORNOIL-WD", "BOXPAK", "BOXPAK-WA", "BPLANT", "BPPLAS"
, "BPURI", "BRAHIMS", "BREM", "BRIGHT", "BSLCORP", "BSTEAD", "BTECH", "BTM"
, "BTM-WA", "BTM-WB", "BURSA", "BURSA-C18", "BURSA-C20", "BURSA-C21"
, "BURSA-C22", "CAB", "CAB-WA", "CABNET", "CABNET-WA", "CAELY", "CAELY-WA"
, "CAMRES", "CANONE", "CAP", "CAREPLS", "CARIMIN", "CARING", "CARLSBG", "CBIP"
, "CBIP-WA", "CCB", "CCK", "CCK-WA", "CCM", "CENSOF", "CENSOF-WB", "CEPAT"
, "CEPCO", "CFM", "CHEETAH", "CHGP", "CHGP-WA", "CHHB", "CHHB-WB"
, "CHINAETF-MYR", "CHINAETF-USD", "CHINHIN", "CHINTEK", "CHINWEL", "CHOOBEE"
, "CHUAN", "CICB", "CIHLDG", "CIMB", "CIMB-C38", "CIMB-C40", "CIMB-C41"
, "CIMB-C42", "CIMB-C43", "CIMB-C44", "CIMB-C45", "CIMB-C46", "CIMBA40"
, "CIMBC50", "CJCEN", "CLIQ", "CME", "CME-LA", "CME-WA", "CMMT", "CMSB"
, "CMSB-C13", "CMSB-C14", "CMSB-C15", "CNASIA", "CNI", "CNOUHUA", "COASTAL"
, "COCOLND", "COMCORP", "COMFORT", "COMPLET", "COMPUGT", "CONNECT"
, "CONNECT-PA", "CONNECT-WA", "CONNECT-WB", "CRESBLD", "CRESNDO", "CSCENIC"
, "CSCSTEL", "CSL", "CUSCAPI", "CVIEW", "CWG", "CYL", "CYMAO", "CYPARK"
, "DAIBOCI", "DAIBOCI-WB", "DAIMAN", "DANCO", "DANCO-WA", "DATAPRP", "DAYA"
, "DAYANG", "DBE", "DBE-WB", "DBHD", "DBHD-WA", "DEGEM", "DELEUM", "DESTINI"
, "DGB", "DGB-WB", "DGSB", "DIALOG", "DIGI", "DIGI-C24", "DIGI-C25", "DIGI-C26"
, "DIGI-C27", "DIGI-C28", "DIGISTA", "DIGISTA-WB", "DIN040000223"
, "DIN042300721", "DIN045801028", "DKLS", "DKSH", "DLADY", "DNEX", "DNEX-WD"
, "DNONCE", "DNONCE-WA", "DOLMITE", "DOLPHIN", "DOLPHIN-WA", "DOMINAN"
, "DOMINAN-WA", "DPIH", "DPS", "DPS-WB", "DRBHCOM", "DSONIC", "DSONIC-WA"
, "DUFU", "DUTALND", "EAH", "EAH-WC", "EAH-WD", "EAH-WE", "EASTLND", "EATECH"
, "ECM", "ECOFIRS", "ECOFIRS-WC", "ECOHLDS", "ECONBHD", "ECONBHD-WA", "ECOWLD"
, "ECOWLD-CQ", "ECOWLD-CR", "ECOWLD-CS", "ECOWLD-CT", "ECOWLD-WA", "EDARAN"
, "EDEN", "EDEN-WB", "EDGENTA", "EDUSPEC", "EFFICEN", "EFORCE", "EFORCE-WA"
, "EG", "EG-PA", "EG-WC", "EIG", "EITA", "EKA", "EKOVEST", "EKOVEST-CQ"
, "EKOVEST-CR", "EKOVEST-CS", "EKOVEST-CT", "EKOVEST-WB", "EKSONS", "ELKDESA"
, "ELKDESA-LA", "ELSOFT", "EMETALL", "EMICO", "ENCORP", "ENGKAH", "ENGTEX"
, "ENRA", "EPMB", "ESAFE", "ESCERAM", "EUPE", "EURO", "EUROSP", "EVERGRN"
, "EWEIN", "EWINT", "EWINT-WA", "FACBIND", "FAJAR", "FAJAR-WB", "FAREAST"
, "FARLIM", "FAVCO", "FBMKLCI-EA", "FCW", "FGV", "FGV-C52", "FGV-C54"
, "FGV-C55", "FGV-C56", "FGV-C57", "FGV-C58", "FGV-C59", "FGV-C60", "FGV-C61"
, "FGV-C62", "FGV-C63", "FGV-C64", "FGV-C65", "FGV-C66", "FGV-C67", "FGV-C68"
, "FGV-C69", "FIAMMA", "FIBON", "FIHB", "FIHB-PA", "FIHB-PB", "FIMACOR"
, "FITTERS", "FITTERS-WB", "FLBHD", "FOCUS", "FOCUS-WC", "FOCUSP", "FPGROUP"
, "FPI", "FREIGHT", "FRONTKN", "FSBM", "FSBM-WA", "G3", "G3-WA", "GADANG"
, "GADANG-WB", "GAMUDA", "GAMUDA-C51", "GAMUDA-C53", "GAMUDA-C54", "GAMUDA-C55"
, "GAMUDA-C56", "GAMUDA-C57", "GAMUDA-C58", "GAMUDA-C59", "GAMUDA-C60"
, "GAMUDA-C61", "GAMUDA-C62", "GAMUDA-C63", "GAMUDA-WE", "GASMSIA", "GBGAQRS"
, "GBGAQRS-WB", "GCB", "GCE", "GDB", "GDEX", "GDEX-CN", "GDEX-WB", "GENETEC"
, "GENM", "GENP", "GENP-WA", "GENTING", "GESHEN", "GETS", "GFM", "GFM-WC"
, "GHLSYS", "GHLSYS-CA", "GKENT", "GLBHD", "GLOMAC", "GLOTEC", "GLOTEC-WA"
, "GMUTUAL", "GNB", "GOB", "GOB-WA", "GOCEAN", "GOCEAN-WA", "GOLDETF"
, "GOODWAY", "GOPENG", "GPA", "GPA-WA", "GPACKET", "GPACKET-WB", "GPHAROS"
, "GRANFLO", "GREENYB", "GSB", "GTRONIC", "GTRONIC-CR", "GTRONIC-CS"
, "GTRONIC-CT", "GTRONIC-CU", "GTRONIC-CV", "GTRONIC-CW", "GUH", "GUNUNG"
, "GUNUNG-WB", "GUOCO", "HAIO", "HALEX", "HANDAL", "HAPSENG", "HAPSENG-CX"
, "HARBOUR", "HARBOUR-WC", "HARISON", "HARNLEN", "HARTA", "HBGLOB", "HCK"
, "HCK-WA", "HEIM", "HEKTAR", "HENGYUAN", "HEVEA", "HEVEA-WB", "HEXZA"
, "" )) then
REP_comp_code= "";