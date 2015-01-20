/*****************************************************************
PROJECT: 	NEPAL AGRICULTURE - ICIMOD
PURPOSE: 	MANUAL MATCHING PROGRAM TO BE INCLUDED IN 
			00_SN_CLEANING.DO.  
			
AUTHORS: 	SAMPADA KC (YALE)
			DEREK WOLFSON (IPA)
			
NOTES: 		THIS CODE CLEANS UP THE FUZZY MERGE
*******************************************************************/

gen no_match= 0

gen unsure_match= 0

**************************************************
 **WARDID 0111**
local WARDID 0111
br if ward_id == "`WARDID'"
sort sn_member 

replace SN_hhid = "011110" if inlist(hhid, "011110") & sn_member==1

replace SN_hhid = "01112" if inlist(hhid,"01118") & sn_member==2

replace SN_hhid = "01113" if ward_id=="0111" & sn_member==3

replace SN_hhid = "01114" if ward_id=="0111" & sn_member==4 

replace SN_hhid = "01115" if ward_id=="0111" & sn_member==5

replace SN_hhid = "01116" if ward_id=="0111" & sn_member==6

replace no_match = 1 if SN_hhid== "01119" & sn_member==7

replace SN_hhid = "01117" if inlist(hhid,"01114","01113","01111") & sn_member==7
 
replace no_match = 1 if SN_hhid== "011112" & sn_member==8

replace no_match = 1 if SN_hhid== "01119" & sn_member==8

replace SN_hhid = "01118" if inlist(hhid,"01119") & sn_member==8

replace no_match = 1 if SN_hhid== "011112" & sn_member==9

replace no_match = 1 if SN_hhid== "01119" & sn_member==9

replace SN_hhid = "011115" if inlist(hhid,"01112") & sn_member==9

***************************************************
**WARDID 02125**
local WARDID 02125 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "021251" if inlist(hhid,"021259","021258","021251") & sn_member==1 

**UNSURE MATCH**
replace SN_hhid = "021251" & unsure_match = 1 if inlist(hhid,"0212515","021252","0212511","0212514","021254") & sn_member==1 
****   

replace SN_hhid = "021253" if inlist(hhid,"0212511","021252","021255") & sn_member==3 

replace SN_hhid = "021254" if inlist(hhid,"0212514","021255","021254","0212515","021253",""021251","021252") & sn_member==4

replace no_match = 1 if inlist(hhid, "021252","0212511") & sn_member==5

replace SN_hhid = "021255" if inlist(hhid,"0212515") & sn_member==5

replace SN_hhid = "021256" if inlist(hhid,"021251","021257","0212510") & sn_member==6

replace SN_hhid = "0212512" if inlist(hhid,"021259") & sn_member==7

replace SN_hhid = "021258" if inlist(hhid,"021257","021253","0212510") & sn_member==8

**UNSURE MATCH**
replace SN_hhid = "0212511" & unsure_match = 1  if inlist(hhid,"0212512","021255") & sn_member==8
replace SN_hhid = "0212511" & unsure_match = 1  if inlist(hhid,"021252") & sn_member==9
****

replace SN_hhid = "0212510" if inlist(hhid, "021251") & sn_member==9

***************************************************
**WARDID 0227**
local WARDID 0227
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "02272" if ward_id =="0227" & sn_member==2

replace no_match = 1 if inlist(hhid, "02276") & sn_member==9

replace SN_hhid = "022712" if inlist(hhid,"022711") & sn_member==9

replace SN_hhid = "02279" if inlist(hhid,"02278") & sn_member==9

local WARDID 0231 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "02311" if inlist(hhid, "023115","02313","02316","023114","023113") & sn_member==1

replace SN_hhid = "02314" if inlist(hhid,"02317","02319","02318") & sn_member==4

replace SN_hhid = "02315" if inlist(hhid,"02316","023115","023113") & sn_member==5

replace no_match = 1 if inlist(hhid,"023112","023115","023110","023114") & sn_member==7

***************************************************
**WARDID 03111**
local WARDID 03111
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "031111" if inlist(hhid,"031113","031115","031116","031119") & sn_member==1

replace SN_hhid = "031113" if inlist(hhid,"031118","0311114") & sn_member==3

replace SN_hhid = "031114" if ward_id=="03111" & sn_member==4

replace no_match = 1 if inlist(hhid,"031111","031119","031117","031118","031115") & sn_member==5

**UNSURE MATCH**
replace SN_hhid = "031115" & unsure_match = 1  if inlist(hhid,"0311112") & sn_member==5
****

replace SN_hhid = "031115" if inlist(hhid,"031114","031116") & sn_member==5

replace SN_hhid = "031112" if inlist(hhid,"031118","031116") & sn_member==6

replace SN_hhid = "0311110" if inlist(hhid,"0311112") & sn_member==7

replace SN_hhid = "0311113" if inlist(hhid,"0311113") & sn_member==7

replace SN_hhid = "0311114" if inlist(hhid,"0311114") & sn_member==8

***************************************************
**WARDID 0346** 
local WARDID 0346 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "034644" if inlist(hhid,"03468") & sn_member==4

replace SN_hhid = "03467" if inlist(hhid,"03467") & sn_member==5

**UNSURE MATCH**
replace SN_hhid = "034613" & unsure_match = 1 if inlist(hhid,"03466") & sn_member==7
****

***************************************************
**WARDID 0349**
local WARDID 0349 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "03491" if inlist(hhid,"034915","03498","03497") & sn_member==1

replace SN_hhid = "03492" if inlist(hhid,"03491") & sn_member==2

replace SN_hhid = "03493" if inlist(hhid,"03497","03498","03499") & sn_member==3

replace SN_hhid = "03494" if inlist(hhid,"03492","03493","034914") & sn_member==4

**UNSURE MATCH**
replace SN_hhid = "03494" & unsure_match = 1  if inlist(hhid,"03499","034911","03497","03498") & sn_member==4
replace SN_hhid = "03495" & unsure_match = 1  if inlist(hhid,"03497","03492","034911","03498","03491") & sn_member==5
replace SN_hhid = "03496" & unsure_match = 1  if inlist(hhid,"03498") & sn_member==6
****

replace SN_hhid = "034911" if inlist(hhid,"034912") & sn_member==7

replace SN_hhid = "03497" if inlist(hhid,"03497") & sn_member==7

replace SN_hhid = "034910" if inlist(hhid,"034912") & sn_member==8

replace SN_hhid = "03499" if inlist(hhid,"03496","03493") & sn_member==8

***************************************************
**WARDID 0459**
local WARDID 0459
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "04593" if inlist(hhid,"045914") & sn_member==3

replace SN_hhid = "04596" if inlist(hhid,"045911") & sn_member==6

replace SN_hhid = "04596" if inlist(hhid,"045911") & sn_member==6

replace no_match = 1 if inlist(hhid,"04595") & sn_member==8

replace no_match = 1 if inlist(hhid,"04594","04598","04595","04597","04592","045913") & sn_member==9

***************************************************
**WARDID 0483**
local WARDID 0483 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "04831" if inlist(hhid,"04835") & sn_member==1

replace SN_hhid = "04832" if inlist(hhid,"04835","048313") & sn_member==2

replace SN_hhid = "04833" if ward_id=="0483" & sn_member==3

replace SN_hhid = "04834" if inlist(hhid,"048310","04831","04839","04836","048312") & sn_member==4

replace SN_hhid = "04835" if inlist(hhid,"04835","04836","04838","04839","048313") & sn_member==5

replace SN_hhid = "04836" if inlist(hhid,"04835","048313") & sn_member==6

replace SN_hhid = "04837" if inlist(hhid,"04831","04835") & sn_member==7

replace SN_hhid = "048314" if inlist(hhid,"048315") & sn_member==7

replace SN_hhid = "048310" if inlist(hhid,"048313") & sn_member==7

replace SN_hhid = "04838" if inlist(hhid,"04835","04837","04838","04831") & sn_member==8

replace no_match = 1 if inlist(hhid,"04834","04833","048310") & sn_member==8

replace no_match = 1 if inlist(hhid,"048312","04834","048313","048311","04833","04835","048310") & sn_member==9

***************************************************
**WARDID 0489**
local WARDID 0489 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "04891" if ward_id=="0489" & sn_member==1

replace SN_hhid = "04893" if ward_id=="0489" & sn_member==3

replace SN_hhid = "04894" if ward_id=="0489" & sn_member==4

replace SN_hhid = "04895" if ward_id=="0489" & sn_member==5

replace SN_hhid = "048313" if inlist(hhid,"04899","04895","04896","04894") & sn_member==7

***************************************************
**WARDID 0564**
local WARDID 0564  
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "05642" if inlist(hhid,"05641","05648") & sn_member==2

replace SN_hhid = "05644" if inlist(hhid,"05642","05641","05643") & sn_member==4

replace SN_hhid = "05646" if inlist(hhid,"056410","05645","056414") & sn_member==6

replace SN_hhid = "05648" if inlist(hhid,"05647","05644","05648","05641") & sn_member==8

***************************************************
**WARDID 06104**
local WARDID 06104  
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "061041" if inlist(hhid,"061043","061044","061047","061042","061048") & sn_member==1

replace SN_hhid = "061042" if inlist(hhid,"0610411","061049","0610410","061041","061043") & sn_member==2

replace SN_hhid = "061043" if inlist(hhid,"061048","061047") & sn_member==3

replace SN_hhid = "061046" if inlist(hhid,"0610412") & sn_member==6

replace no_match = 1 if inlist(hhid,"0610410","061041","0610411","061046") & sn_member==7

replace SN_hhid = "0610413" if inlist(hhid,"0610413") & sn_member==7

replace SN_hhid = "0610414" if inlist(hhid,"061049") & sn_member==7

replace no_match = 1 if inlist(hhid,"0610410","061041","061046") & sn_member==8

replace SN_hhid = 061048 if inlist(hhid,"061044","061042","061048","061043") & sn_member==8

replace SN_hhid = "0610414" if inlist(hhid,"0610414") & sn_member==8

replace SN_hhid = "0610410" if inlist(hhid,"0610410") & sn_member==9

replace no_match = 1 if inlist(hhid,"061041","061046" & sn_member==9

***************************************************
**WARDID 0679**
local WARDID 0679  
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "06791" if inlist(hhid,"06798","06791","06794","06797") & sn_member==1

replace SN_hhid = "06792" if inlist(hhid,"06791","06797","06794","06796","06798","067912","067913") & sn_member==2

replace SN_hhid = "06793" if inlist(hhid,"06791","067913","06796","06798","06797","06794","06793") & sn_member==3

replace SN_hhid = "06792" if inlist(hhid,"06792") & sn_member==3

replace SN_hhid = "06795" if inlist(hhid,"06795","06798","06794","06791","06796","06797") & sn_member==5

replace SN_hhid = "06796" if ward_id=="0679" & sn_member==6

replace SN_hhid = "067911" if ward_id=="067912" & sn_member==7

replace SN_hhid = "06797" if inlist(hhid,"06797","06796","06794","06798") & sn_member==7

replace SN_hhid = "06798" if inlist(hhid,"06794") & sn_member==8

***************************************************
**WARDID 0694**
local WARDID 0694  
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "06941" if inlist(hhid,"069412","06948") & sn_member==1

replace SN_hhid = "06942" if inlist(hhid,"069413","069415","069414") & sn_member==2

replace SN_hhid = "06944" if inlist(hhid,"069414","06941") & sn_member==4

replace SN_hhid = "06945" if inlist(hhid,"06942") & sn_member==5

replace SN_hhid = "069410" if inlist(hhid,"06941") & sn_member==7

replace SN_hhid = "06948" if inlist(hhid,"06948") & sn_member==8

replace SN_hhid = "06949" if inlist(hhid,"06947") & sn_member==9

***************************************************
**WARDID 110184**
local WARDID 110184  
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1101842" if ward_id=="110184" & sn_member==2

replace SN_hhid = "1101845" if ward_id=="110184" & sn_member==5

replace SN_hhid = "1101847" if inlist(hhid,"1101841","11018411","1101845","1101843","1101842") & sn_member==7

replace SN_hhid = "11018415" if inlist(hhid,"11018415") & sn_member==7

replace SN_hhid = "11018414" if inlist(hhid,"11018415") & sn_member==7

replace SN_hhid = "11018414" if inlist(hhid,"1101843","1101842","1101841") & sn_member==8

replace SN_hhid = "1101847" if inlist(hhid,"11018414","11018415","1101846") & sn_member==8

replace no_match = 1 if inlist(hhid,"11018412") & sn_member==8

replace no_match = 1 if inlist(hhid,"1101849") & sn_member==9

replace SN_hhid = "11018411" if inlist(hhid,"1101842") & sn_member==9

replace SN_hhid = "1101849" if inlist(hhid,"1101849") & sn_member==9

***************************************************
**WARDID 110241**
local WARDID 110241
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1102411" if inlist(hhid,"1102415","1102414","1102417","1102413","hhid
1102416") & sn_member==1

replace SN_hhid = "1102412" if ward_id =="110241" & sn_member==2

replace SN_hhid = "1102413" if ward_id =="110241" & sn_member==3

replace SN_hhid = "1102414" if inlist(hhid,"1102415") & sn_member==4

replace SN_hhid = "1102415" if ward_id =="110241" & sn_member==5

replace SN_hhid = "1102416" if ward_id =="110241" & sn_member==6

replace SN_hhid = "1102419" if inlist(hhid,"1102413") & sn_member==7

replace SN_hhid = "11024112" if inlist(hhid,"1102415","11024113","11024110","1102416","1102412","11024111","1102418","1102417","1102419",") & sn_member==7

replace SN_hhid = "11024115" if inlist(hhid,"1102414") & sn_member==7

replace SN_hhid = "11024115" if inlist(hhid,"1102416","1102415") & sn_member==8

replace SN_hhid = "11024112" if inlist(hhid,"1102413") & sn_member==8

replace SN_hhid = "11024111" if inlist(hhid,"1102411") & sn_member==8

**UNSURE MATCH**
replace SN_hhid = "1102419" & unsure_match = 1  if inlist(hhid,"1102417","1102412") & sn_member==8
****

replace SN_hhid = "11024115" if inlist(hhid,"11024110") & sn_member==9

replace SN_hhid = "11024112" if inlist(hhid,"1102414","11024115") & sn_member==9

replace SN_hhid = "11024114" if inlist(hhid,"1102416","1102415") & sn_member==9

replace SN_hhid = "11024113" if inlist(hhid,"1102411","11024113") & sn_member==9

***************************************************
**WARDID 110253**
local WARDID 110253 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1102532" if ward_id=="110253" & sn_member==2

replace SN_hhid = "1102533" if ward_id=="110253" & sn_member==3

replace SN_hhid = "1102534" if ward_id=="110253" & sn_member==4

replace SN_hhid = "1102535" if ward_id=="110253" & sn_member==5

replace SN_hhid = "11025313" if inlist(hhid,"1102536","11025314","11025313") & sn_member==7

replace SN_hhid = "1102537" if inlist(hhid,"1102538","1102537") & sn_member==7

replace SN_hhid = "11025310" if inlist(hhid,"11025310") & sn_member==7

replace SN_hhid = "11025310" if inlist(hhid,"11025310","11025315") & sn_member==7

replace SN_hhid = "11025310" if inlist(hhid,"11025315","1102532") & sn_member==8

replace SN_hhid = "1102538" if inlist(hhid,"1102537","1102538") & sn_member==8

replace SN_hhid = "11025310" if inlist(hhid,"1102536","1102537") & sn_member==9

replace no_match = 1 if inlist(hhid,"1102531") & sn_member==9

***************************************************
**WARDID 111204**
local WARDID 111204 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1112041" if ward_id=="111204" & sn_member==1

replace SN_hhid = "1112042" if ward_id=="111204" & sn_member==2

replace SN_hhid = "1112043" if inlist(hhid,"11120411","11120412","11120414",11120415","1112044","1112046") & sn_member==3

replace SN_hhid = "1112044" if inlist(hhid,"11120414","11120415") & sn_member==4

replace no_match = 1 if inlist(hhid,"1112044") & sn_member==4

replace no_match = 1 if inlist(hhid,"1112043","11120413","1112047","1112048","11120415","1112046","11120410","1112042") & sn_member==5

replace SN_hhid = "1112045" if inlist(hhid,"1112049","1112045","1112043","1112041","11120413","1112047","11120414","1112048","11120415","1112046","11120410","1112042") & sn_member==5

replace SN_hhid = "1112046" if inlist(hhid,"1112044","11120411","11120412",) & sn_member==5

replace SN_hhid = "1112044" if inlist(hhid,"11120412","11120411") & sn_member==6

replace SN_hhid = "1112046" if inlist(hhid,"11120414","1112045","1112048","11120415","1112041","1112049") & sn_member==6

replace SN_hhid = "1112044" if inlist(hhid,"11120412","11120411") & sn_member==6

replace SN_hhid = "11120411" if inlist(hhid,"1112045") & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "11120411" & unsure_match = 1  if inlist(hhid,"1112044") & sn_member==8
replace SN_hhid = "11120411" & unsure_match = 1  if inlist(hhid,"11120412","11120411") & sn_member==9
****

replace SN_hhid = "11120413" if inlist(hhid,"1112046","11120415","1112042","11120414",) & sn_member==7

replace SN_hhid = "11120412" if inlist(hhid,"1112047") & sn_member==7

replace SN_hhid = "1112047" if inlist(hhid,"11120410","1112044") & sn_member==7

replace SN_hhid = "1112047" if inlist(hhid,"1112042","11120412","1112043","11120413","11120411") & sn_member==8

replace SN_hhid = "1112048" if inlist(hhid,"11120410") & sn_member==8

replace no_match = 1 if inlist(hhid,"1112046") & sn_member==8

replace SN_hhid = "1112047" if inlist(hhid,"1112049","1112043") & sn_member==9

replace SN_hhid = "11120414" if inlist(hhid,"11120414","1112046") & sn_member==9

***************************************************
**WARDID 111264**
local WARDID 111264
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1112641" if ward_id=="111264" & sn_member==1

replace SN_hhid = "1112642" if inlist(hhid,"1112647","1112641","1112644","11126414","11126411","11126415") & sn_member==2

replace SN_hhid = "1112643" if inlist(hhid,"11126415","1112649","1112644",) & sn_member==3

replace SN_hhid = "1112645" if inlist(hhid,"11126410","1112646","1112643",) & sn_member==5
***THIS ONE HAS DUPLICATE HHIDs for sn_hhid 4 and 5 !!!!

replace SN_hhid = "11126415" if inlist(hhid,"1112641") & sn_member==7

replace SN_hhid = "11126410" if inlist(hhid,"1112643","1112642","1112649","1112648","1112646","11126410") & sn_member==7

replace SN_hhid = "11126414" if inlist(hhid,"11126414") & sn_member==7 

replace SN_hhid = "11126415" if inlist(hhid,"11126414","1112645") & sn_member==8

replace SN_hhid = "11126412" if inlist(hhid,"1112648","1112646") & sn_member==8

replace SN_hhid = "1112648" if inlist(hhid,"11126412") & sn_member==9

**UNSURE MATCH**
replace SN_hhid = "1112649" & unsure_match = 1  if inlist(hhid,"11126414") & sn_member==9

***************************************************
**WARDID 111274**
local WARDID 111274
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1112742" if inlist(hhid,"1112748") & sn_member==2

replace SN_hhid = "1112746" if inlist(hhid,"1112747") & sn_member==6

replace SN_hhid = "1112749" if inlist(hhid,"1112743","1112742") & sn_member==8 

***************************************************
**WARDID 112214**
local WARDID 112214 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1122143" if ward_id=="112214" & sn_member==3

replace SN_hhid = "1122145" if inlist(hhid,"1122141") & sn_member==5

replace SN_hhid = "1122146" if inlist(hhid,"1122144","1122142") & sn_member==6

replace SN_hhid = "11221411" if inlist(hhid,"1122141") & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "11221410" & unsure_match = 1 if inlist(hhid,"1122143") & sn_member==7
****

replace SN_hhid = "11221412" if inlist(hhid,"1122144") & sn_member==8

replace SN_hhid = "11221410" if inlist(hhid,"11221412") & sn_member==8 

replace SN_hhid = "11221411" if inlist(hhid,"11221411") & sn_member==8  

replace SN_hhid = "1122148" if inlist(hhid,"1122148") & sn_member==8  

replace SN_hhid = "1122149" if inlist(hhid,"11221410","1122147","1122149") & sn_member==9
 
replace no_match =1 if inlist(hhid,"1122149") & sn_member==9

***************************************************   
**WARDID 112231**
local WARDID 112231 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1122312" if inlist(hhid,"1122316","1122313") & sn_member==2

replace SN_hhid = "1122313" if inlist(hhid,"1122314","11223114") & sn_member==3

replace SN_hhid = "1122314" if inlist(hhid,"1122316","1122313","11223115","11223113","1122312") & sn_member==4

replace SN_hhid = "1122315" if inlist(hhid,"1122314") & sn_member==5

replace SN_hhid = "1122316" if ward_id=="112231" & sn_member==6

replace SN_hhid = "1122312" if inlist(hhid,"1122316") & sn_member==7

replace SN_hhid = "1122318" if inlist(hhid,"11223114","1122319","1122317","1122318","11223111","1122312","1122316") & sn_member==8

replace SN_hhid = "1122318" if inlist(hhid,"11223110") & sn_member==8

replace SN_hhid = "11223111" if inlist(hhid,"11223110") & sn_member==9

***************************************************   
**WARDID 112234**
local WARDID 112234 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1122341" if ward_id=="112234" & sn_member==1

replace SN_hhid = "1122342" if inlist(hhid,"11223414") & sn_member==2

replace SN_hhid = "1122343" if inlist(hhid,"1122343") & sn_member==3

replace no_match =1 if inlist(hhid,"11223411","11223412") & sn_member==3

replace SN_hhid = "1122346" if ward_id=="112234" & sn_member==6

replace SN_hhid = "1122349" if inlist(hhid,"11223415","1122349","11223413","11223414","1122345") & sn_member==7

replace SN_hhid = "1122347" if inlist(hhid,"1122341","11223412") & sn_member==7

replace no_match =1 if inlist(hhid,"1122346") & sn_member==7

replace SN_hhid = "1122349" if inlist(hhid,"11223412","11223411","1122347") & sn_member==8

replace SN_hhid = "1122347" if inlist(hhid,"1122348") & sn_member==8

replace no_match =1 if inlist(hhid,"11223413") & sn_member==8

replace SN_hhid = "1122349" if inlist(hhid,"11223410") & sn_member==9

replace no_match =1 if inlist(hhid,"1122341") & sn_member==9

replace SN_hhid = "1122348" if inlist(hhid,"1122342") & sn_member==9

***************************************************   
**WARDID 116221**
local WARDID 116221 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1162211" if inlist(hhid,"1162218","11622115","11622111","1162219","11622114","11622112","11622110","1162217") & sn_member==1

replace SN_hhid = "1162212" if inlist(hhid,"1162216","1162219","1162217","1162218","1162214","11622110","11622111","11622112") & sn_member==9

replace SN_hhid = "1162213" if inlist(hhid,"1162218","11622110","1162219","11622111") & sn_member==3

replace SN_hhid = "1162211" if inlist(hhid,"11622113") & sn_member==4

replace SN_hhid = "1162214" if inlist(hhid,"11622110","1162213","1162219","11622115") & sn_member==4

replace SN_hhid = "1162215" if inlist(hhid,"1162213") & sn_member==5

replace SN_hhid = "1162218" if inlist(hhid,"1162218") & sn_member==7

replace SN_hhid = "1162217" if inlist(hhid,"1162214") & sn_member==7

replace SN_hhid = "1162219" if inlist(hhid,"1162212") & sn_member==7

replace SN_hhid = "1162218" if inlist(hhid,"11622111") & sn_member==9

replace SN_hhid = "11622115" if inlist(hhid,"11622113","1162215") & sn_member==9

***************************************************   
**WARDID 17138**
local WARDID 17138  
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "171381" if ward_id== "17138" & sn_member==1

replace SN_hhid = "171382" if inlist(hhid,"171383") & sn_member==3 

replace SN_hhid = "171384" if inlist(hhid,"171386") & sn_member==4

replace SN_hhid = "171389" if inlist(hhid,"171386","1713815","1713814","171384") & sn_member==5

replace SN_hhid = "1713812" if inlist(hhid,"171388","1713812","171381") & sn_member==7

replace SN_hhid = "1713813" if inlist(hhid,"171384","171383") & sn_member==7

replace SN_hhid = "1713811" if inlist(hhid,"171386") & sn_member==7

replace SN_hhid = "1713810" if inlist(hhid,"171385") & sn_member==7

replace no_match = 1 if inlist(hhid,"1713814") & sn_member==8

replace SN_hhid = "1713813" if inlist(hhid,"1713812") & sn_member==8

replace SN_hhid = "1713810" if inlist(hhid,"1713810","1713815","171382") & sn_member==8

replace SN_hhid = "1713812" if inlist(hhid,"171384","1713811","171387") & sn_member==8

replace no_match = 1 if inlist(hhid,"171386") & sn_member==8

replace no_match = 1 if inlist(hhid,"171386") & sn_member==9

replace SN_hhid = "1713811" if inlist(hhid,"1713815","1713811","1713814","1713810") & sn_member==9

***************************************************   
**WARDID 17281**
local WARDID 17281  
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "172811" if inlist(hhid,"1728110") & sn_member==1

replace SN_hhid = "172812" if ward_id== "17281" & sn_member==2

replace SN_hhid = "172813" if inlist(hhid,"172811","172812") & sn_member==3

replace SN_hhid = "172815" if ward_id== "17281" & sn_member==5

replace no_match = 1 if inlist(hhid,"172815","1728110","172813") & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "172819" & unsure_match = 1  if inlist(hhid,"172819") & sn_member==7
replace SN_hhid = "1728114" & unsure_match = 1  if inlist(hhid,"172815") & sn_member==7
****

replace SN_hhid = "1728114" if inlist(hhid,"172812","172814","1728114","1728110","172813"."1728115","1728113")
 & sn_member==8

replace SN_hhid = "1728113" if inlist(hhid,"172817") & sn_member==8

replace SN_hhid = "1728114" if inlist(hhid,"172817","172819","172818") & sn_member==9

***************************************************   
**WARDID 18143**
local WARDID 18143  
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "181431" if inlist(hhid,"181436","1814312","181434","181438","181439","181432","181431","1814313") & sn_member==1

replace SN_hhid = "181434" if inlist(hhid,"181431") & sn_member==4

replace SN_hhid = "181435" if inlist(hhid,"181431") & sn_member==5

replace SN_hhid = "181436" if inlist(hhid,"181431") & sn_member==6

replace SN_hhid = "1814314" if inlist(hhid,"181434","181431") & sn_member==7

replace SN_hhid = "1814314" if inlist(hhid,"181438") & sn_member==8

replace SN_hhid = "1814310" if inlist(hhid,"1814312","181431","1814310") & sn_member==8

replace SN_hhid = "1814313" if inlist(hhid,"181434","181431","181435") & sn_member==9

replace SN_hhid = "1814310" if inlist(hhid,"181433") & sn_member==9

***************************************************   
**WARDID 18153**
local WARDID 18153  
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "181531" if inlist(hhid,"181535","1815314") & sn_member==1

replace SN_hhid = "181532" if inlist(hhid,"1815315","181537","1815311") & sn_member==2

replace SN_hhid = "181533" if inlist(hhid,"181532") & sn_member==3

replace SN_hhid = "181536" if inlist(hhid,"1815311") & sn_member==6

replace SN_hhid = "1815311" if inlist(hhid,"1815311") & sn_member==7

replace SN_hhid = "181538" if inlist(hhid,"181535","181536","181534","181533") & sn_member==7

replace SN_hhid = "181538" if inlist(hhid,"181531","181538") & sn_member==8

replace SN_hhid = "181539" if inlist(hhid,"181539") & sn_member==8

replace SN_hhid = "1815315" if inlist(hhid,"181539") & sn_member==8

replace SN_hhid = "181538" if inlist(hhid,"181533","181531","181538","1815310") & sn_member==8

replace SN_hhid = "181537" if inlist(hhid,"1815312") & sn_member==9

replace SN_hhid = "181539" if inlist(hhid,"181539") & sn_member==9

replace SN_hhid = "181538" if inlist(hhid,"1815313","181532") & sn_member==9

***************************************************   
**WARDID  18294**
local WARDID  18294   
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "182941" if inlist(hhid,"182942","182944") & sn_member==1

replace SN_hhid = "182943" if ward_id== "18294" & sn_member==3

replace SN_hhid = "182944" if inlist(hhid,"182945") & sn_member==4

replace SN_hhid = "182946" if inlist(hhid,"1829414","182946","182943") & sn_member==5

replace SN_hhid = "182946" if inlist(hhid,"182945","1829410","1829415","1829412","182949","1829411","182947","182948","1829413") & sn_member==6

replace SN_hhid = "182944" if inlist(hhid,"1829414") & sn_member==6

replace SN_hhid = "182947" if inlist(hhid,"182947","182941") & sn_member==7

replace SN_hhid = "1829414" if inlist(hhid,"182943") & sn_member==7

replace SN_hhid = "182947" if inlist(hhid,"1829410") & sn_member==8

**UNSURE MATCH**
replace SN_hhid = "182947" & unsure_match = 1  if inlist(hhid,"182946") & sn_member==8
****

replace SN_hhid = "1829411" if inlist(hhid,"182941") & sn_member==8

replace SN_hhid = "182947" if inlist(hhid,"182946","182945","182943","182944") & sn_member==9

replace no_match = 1 if inlist(hhid,"182945","1829413") & sn_member==8

replace no_match = 1 if inlist(hhid,"182941") & sn_member==9

replace SN_hhid = "1829411" if inlist(hhid,"182946","182945","182943","182944","182942") & sn_member==9

***************************************************   
**WARDID 19162**
local WARDID 19162 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "191621" if inlist(hhid,"191624") & sn_member==1

replace SN_hhid = "182943" if ward_id== "19162" & sn_member==4

replace SN_hhid = "191625" if ward_id== "19162" & sn_member==5

replace SN_hhid = "191627" if inlist(hhid,"1916213") & sn_member==8

**UNSURE MATCH**
replace SN_hhid = "191629" & unsure_match = 1  if inlist(hhid,"191627","191628") & sn_member==9
****

replace SN_hhid = "1916212" if inlist(hhid,"1916211") & sn_member==9

replace SN_hhid = "1916211" if inlist(hhid,"1916214") & sn_member==9

***************************************************   
**WARDID 19178**
local WARDID 19178 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "191781" if ward_id== "19162" & sn_member==1

replace no_match = 1 if inlist(hhid,"191782") & sn_member==2

replace SN_hhid = "191782" if inlist(hhid,"1917810") & sn_member==2

replace SN_hhid = "191783" if ward_id== "19162" & sn_member==3

replace SN_hhid = "191784" if inlist(hhid,"191785","191782","1917810","191784") & sn_member==4

replace SN_hhid = "191785" if ward_id== "19162" & sn_member==5

**UNSURE MATCH**
replace SN_hhid = "1917812" & unsure_match = 1  if inlist(hhid,"191782") & sn_member==7
replace SN_hhid = "1917811" & unsure_match = 1  if inlist(hhid,"191782") & sn_member==8
replace SN_hhid = "1917812" & unsure_match = 1  if inlist(hhid,"1917811") & sn_member==8
replace SN_hhid = "1917811" & unsure_match = 1  if inlist(hhid,"191786") & sn_member==9
****

replace SN_hhid = "191787" if inlist(hhid,"191783") & sn_member==7

replace SN_hhid = "1917814" if inlist(hhid,"191781") & sn_member==7

replace SN_hhid = "1917814" if inlist(hhid,"1917813","1917815") & sn_member==8

replace SN_hhid = "1917813" if inlist(hhid,"191785","191788","191781") & sn_member==8

***************************************************   
**WARDID 19199**
local WARDID 19199 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "191991" if inlist(hhid,"191991") & sn_member==1

replace SN_hhid = "191992" if inlist(hhid,"191993","191992") & sn_member==2

replace SN_hhid = "191993" if inlist(hhid,"191994") & sn_member==3

replace SN_hhid = "191991" if inlist(hhid,"191997","1919914","191991","1919912") & sn_member==5

replace SN_hhid = "191996" if ward_id== "19199" & sn_member==6

replace SN_hhid = "191996" if ward_id== "19199" & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "1919914" & unsure_match = 1 if inlist(hhid,"191992","191996","1919912","191994") & sn_member==7
replace SN_hhid = "1919914" & unsure_match = 1  if inlist(hhid,"191997","191991","191993") & sn_member==8 
replace SN_hhid = "191999" & unsure_match = 1  if inlist(hhid,"1919915","191996") & sn_member==8
replace SN_hhid = "191999" & unsure_match = 1 if inlist(hhid,"191998") & sn_member==9
replace SN_hhid = "1919914" & unsure_match = 1  if inlist(hhid,"1919912","191994") & sn_member==9
****

replace SN_hhid = "1919913" if inlist(hhid,"1919913") & sn_member==8

***************************************************   
**WARDID 213302**
local WARDID  213302 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2133023" if inlist(hhid,"21330214","21330215","2133024","2133028") & sn_member==3

replace SN_hhid = "2133024" if inlist(hhid,"2133029","21330215","2133028") & sn_member==4

replace SN_hhid = "2133025" if inlist(hhid,"21330211","21330212") & sn_member==5

replace SN_hhid = "2133026" if inlist(hhid,"2133027","21330215") & sn_member==6

replace SN_hhid = "2133027" if inlist(hhid,"2133021") & sn_member==7

replace SN_hhid = "21330212" if inlist(hhid,"2133021","2133027","2133026","21330212") & sn_member==8

replace SN_hhid = "21330215" if inlist(hhid,"2133022") & sn_member==9

***************************************************   
**WARDID 213317**
local WARDID 213317
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2133171" if inlist(hhid,"2133178","2133172") & sn_member==1

replace SN_hhid = "2133172" if inlist(hhid,"21331711","2133175","21331710","2133179","21331712","2133178","2133176") & sn_member==2

replace SN_hhid = "2133174" if inlist(hhid,"2133171","2133175") & sn_member==4

replace SN_hhid = "21331715" if inlist(hhid,"2133177") & sn_member==5

replace SN_hhid = "2133177" if inlist(hhid,"21331714") & sn_member==6

replace SN_hhid = "2133179" if ward_id== "213317" & sn_member==9

***************************************************   
**WARDID 213339**
local WARDID 213339
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2133391" if inlist(hhid,"21333913") & sn_member==1

replace SN_hhid = "2133393" if inlist(hhid,"2133395") & sn_member==3

replace SN_hhid = "2133395" if ward_id== "213339" & sn_member==5

replace SN_hhid = "2133396" if ward_id== "213339" & sn_member==6

replace SN_hhid = "2133397" if ward_id== "213339" & sn_member==7

replace SN_hhid = "21333915" if inlist(hhid,"21333910") & sn_member==9

***************************************************   
**WARDID 214321**
local WARDID 214321
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2143217" if ward_id== "214321" & sn_member==1

replace SN_hhid = "2143212" if inlist(hhid,"21432114","2143214") & sn_member==2

replace SN_hhid = "2143212" if inlist(hhid,"21432112","21432114","2143212","2143218") & sn_member==3

replace SN_hhid = "2143215" if ward_id== "214321" & sn_member==5

replace SN_hhid = "2143216" if ward_id== "214321" & sn_member==6

replace SN_hhid = "2143217" if ward_id== "214321" & sn_member==7

replace SN_hhid = "2143219" if ward_id== "214321" & sn_member==9

***************************************************   
**WARDID 214352**
local WARDID 214352 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2143522" if inlist(hhid,"21435212","21435215") & sn_member==2

replace SN_hhid = "2143528" if inlist(hhid,"21435210","2143528","21435214") & sn_member==8

replace SN_hhid = "2143529" if inlist(hhid,"21435210") & sn_member==9

***************************************************   
**WARDID 214369**
local WARDID 214369  
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2143693" if inlist(hhid,"21435212","21435215") & sn_member==3

replace SN_hhid = "2143694" if ward_id== "214369" & sn_member==4

replace SN_hhid = "2143695" if inlist(hhid,"2143699","21436914") & sn_member==5

replace SN_hhid = "2143696" if ward_id== "214369" & sn_member==6

replace SN_hhid = "2143697" if ward_id== "214369" & sn_member==7

replace SN_hhid = "2143699" if ward_id== "214369" & sn_member==9

***************************************************   
**WARDID 215346**
local WARDID 215346
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2153461" if ward_id== "215346" & sn_member==1

replace SN_hhid = "2153462" if inlist(hhid,"21534611","21534612") & sn_member==2

replace SN_hhid = "2153463" if inlist(hhid,"2153468","2153467") & sn_member==3

replace SN_hhid = "2153466" if inlist(hhid,"2153465","21534613","2153468") & sn_member==6

replace SN_hhid = "2153467" if inlist(hhid,"2153467") & sn_member==6

replace SN_hhid = "2153467" if inlist(hhid,"2153465","21534612","2153468") & sn_member==7

***************************************************   
**WARDID 215393**
local WARDID 215393
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2153933" if inlist(hhid,"2153937") & sn_member==3

replace SN_hhid = "2153936" if inlist(hhid,"2153937","2153931","2153933") & sn_member==6

replace SN_hhid = "21539310" if inlist(hhid,"2153934") & sn_member==7

replace SN_hhid = "21539312" if ward_id== "215393" & sn_member==8

***************************************************   
**WARDID 215406**
local WARDID 215406
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2154061" if inlist(hhid,"21540615","2154063") & sn_member==1

replace SN_hhid = "2154062" if inlist(hhid,"2154065","21540614") & sn_member==2

replace SN_hhid = "2154064" if inlist(hhid,"2154064") & sn_member==4

replace SN_hhid = "2154065" if inlist(hhid,"2154063","2154061","2154065") & sn_member==5

replace SN_hhid = "2154066" if ward_id== "215406" & sn_member==6

replace SN_hhid = "21540610" if inlist(hhid,"2154065","21540614") & sn_member==8

replace SN_hhid = "21540610" if ward_id== "215406" & sn_member==9

***************************************************   
**WARDID 216372**
local WARDID 216372 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2163723" if inlist(hhid,"21637211") & sn_member==3

replace SN_hhid = "2163724" if inlist(hhid,"2163721") & sn_member==4

replace SN_hhid = "2163725" if inlist(hhid,"2163728") & sn_member==5

replace SN_hhid = "2163726" if inlist(hhid,"2163727") & sn_member==6

replace SN_hhid = "21637215" if inlist(hhid,"21637211","2163729","2163728") & sn_member==9

***************************************************   
**WARDID 216388**
local WARDID 216388 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2163881" if ward_id== "216388" & sn_member==1

replace SN_hhid = "2163883" if inlist(hhid,"2163887") & sn_member==3 

replace SN_hhid = "2163884" if inlist(hhid,"2163886","2163882","2163883") & sn_member==4

replace SN_hhid = "2163885" if ward_id== "216388" & sn_member==5

replace SN_hhid = "2163886" if ward_id== "216388" & sn_member==6

replace SN_hhid = "2163887" if inlist(hhid,"2163884") & sn_member==7

replace SN_hhid = "2163888" if inlist(hhid,"21638810","2163884") & sn_member==8

replace SN_hhid = "2163889" if ward_id== "216388" & sn_member==9

***************************************************   
**WARDID  216412**
local WARDID 216412 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2164121" if inlist(hhid,"21641213") & sn_member==1

replace SN_hhid = "2164123" if inlist(hhid,"21641212") & sn_member==3

**UNSURE MATCH**
replace SN_hhid = "2164123" & unsure_match = 1  if inlist(hhid,"2164126") & sn_member==3
****

replace SN_hhid = "21641211" if ward_id== "216412" & sn_member==5

replace SN_hhid = "2164126" if ward_id== "216412" & sn_member==6

replace SN_hhid = "2164127" if ward_id== "216412" & sn_member==7

replace SN_hhid = "2164128" if ward_id== "216412" & sn_member==8

***************************************************   
**WARDID 217422**
local WARDID 217422
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2174221" if ward_id== "217422" & sn_member==1

replace SN_hhid = "2174222" if inlist(hhid,"2174223") & sn_member==2

replace SN_hhid = "2174224" if inlist(hhid,"2174222","2174221","2174226","2174223") & sn_member==4

replace SN_hhid = "2174225" if ward_id== "217422" & sn_member==5

replace SN_hhid = "2174226" if ward_id== "217422" & sn_member==6

replace SN_hhid = "2174227" if ward_id== "217422" & sn_member==7

replace SN_hhid = "2174228" if ward_id== "217422" & sn_member==8

***************************************************   
**WARDID 218431**
local WARDID 218431
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2184312" if ward_id== "218431" & sn_member==2

replace SN_hhid = "2184314" if ward_id== "218431" & sn_member==4

replace SN_hhid = "2184315" if ward_id== "218431" & sn_member==5

replace SN_hhid = "2184317" if inlist(hhid,"2184314") & sn_member==7

replace SN_hhid = "2184318" if inlist(hhid,"21843110") & sn_member==8

***************************************************   
**WARDID 319445**
local WARDID 319445
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "3194451" if inlist(hhid,"31944510") & sn_member==1

replace SN_hhid = "3194456" if inlist(hhid,"3194457") & sn_member==6

replace SN_hhid = "3194458" if inlist(hhid,"31944515","31944510","3194454","3194456") & sn_member==8

replace SN_hhid = "3194459" if inlist(hhid,"3194451","3194456") & sn_member==9

***************************************************   
**WARDID 319452**
local WARDID 319452
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "3194521" if ward_id== "319452" & sn_member==1

replace SN_hhid = "3194523" if ward_id== "319452" & sn_member==3

replace SN_hhid = "3194524" if inlist(hhid,"3194526") & sn_member==4

replace SN_hhid = "3194526" if inlist(hhid,"31945211") & sn_member==6

replace SN_hhid = "3194528" if ward_id== "319452" & sn_member==8

replace SN_hhid = "3194529" if ward_id== "319452" & sn_member==9

***************************************************   
**WARDID 319458**
local WARDID 319458 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3194581" if ward_id== "319458" & sn_member==1

replace SN_hhid = "3194582" if ward_id== "319458" & sn_member==2

replace SN_hhid = "3194585" if ward_id== "319458" & sn_member==5

replace SN_hhid = "3194587" if ward_id== "319458" & sn_member==7

***************************************************   
**WARDID 320467**
local WARDID 320467
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3204673" if inlist(hhid,"3204678") & sn_member==3

replace SN_hhid = "3204676" if inlist(hhid,"3204672") & sn_member==6

replace SN_hhid = "3204678" if ward_id== "320467" & sn_member==8

***************************************************   
**WARDID 320505**
local WARDID 320505
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3205051" if inlist(hhid,"3205051","3205054") & sn_member==1

replace SN_hhid = "3205056" if inlist(hhid,"3205053","3205051","3205052","3205054") & sn_member==6

replace SN_hhid = "3205057" if inlist(hhid,"3205051","3205055") & sn_member==7

***************************************************   
**WARDID 320544**
local WARDID 320544
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3205444" if inlist(hhid,"32054415","3205449") & sn_member==4

replace SN_hhid = "3205057" if inlist(hhid,"3205051","3205055") & sn_member==5

replace SN_hhid = "3205448" if inlist(hhid,"3205441","3205449") & sn_member==8

***************************************************   
**WARDID 321478**
local WARDID 321478
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3214781" if inlist(hhid,"3214784","3214786","3214782","3214785","3214783") & sn_member==1

replace SN_hhid = "3214784" if inlist(hhid,"3214781") & sn_member==4

replace SN_hhid = "3214787" if inlist(hhid,"3214781","3214787") & sn_member==7

replace SN_hhid = "3214789" if inlist(hhid,"3214787","3214781") & sn_member==9

***************************************************   
**WARDID 321518**
local WARDID 321518
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3215181" if inlist(hhid,"32151811") & sn_member==1

replace SN_hhid = "3215182" if inlist(hhid,"3215181") & sn_member==2

replace SN_hhid = "3215185" if inlist(hhid,"3215183","3215181","3215182") & sn_member==5

replace SN_hhid = "3215187" if inlist(hhid,"3215182","3215181") & sn_member==7

replace SN_hhid = "3215188" if inlist(hhid,"3215187") & sn_member==8

replace SN_hhid = "3215189" if inlist(hhid,"3215186","3215182") & sn_member==9

***************************************************   
**WARDID 321534**
local WARDID 321534
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3215341" if inlist(hhid,"3215345","3215346","3215344") & sn_member==1

**UNSURE MATCH**
replace SN_hhid = "3215342" & unsure_match = 1  if inlist(hhid,"3215345","32153412","32153413","32153410") & sn_member==3
replace SN_hhid = "3215343" & unsure_match = 1  if inlist(hhid,"32153414") & sn_member==3
****

replace SN_hhid = "3215344" if ward_id== "321534" & sn_member==4

replace SN_hhid = "3215345" if ward_id== "321534" & sn_member==5

replace SN_hhid = "3215346" if inlist(hhid,"3215342","32153413") & sn_member==6

replace SN_hhid = "3215347" if inlist(hhid,"32153415") & sn_member==7

replace SN_hhid = "3215348" if inlist(hhid,"32153415","3215342","3215344") & sn_member==8

replace no_match = 1 if inlist(hhid,"3215349","3215346","32153413","3215343","32153414","32153411","32153410","32153415") & sn_member==8

***************************************************   
**WARDID 322522**
local WARDID 322522
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3225222" if inlist(hhid,"3225225") & sn_member==2

replace SN_hhid = "3225228" if inlist(hhid,"3225228") & sn_member==8

***************************************************   
**WARDID 322598**
local WARDID 322598
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3225984" if inlist(hhid,"3225986") & sn_member==4

replace SN_hhid = "3225987" if inlist(hhid,"32259811") & sn_member==7

replace SN_hhid = "3225989" if inlist(hhid,"32259811","32259814") & sn_member==9

***************************************************   
**WARDID 323498**
local WARDID 323498
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3234982" if inlist(hhid,"3234986") & sn_member==2

replace SN_hhid = "3234983" if inlist(hhid,"3234989") & sn_member==3

**UNSURE MATCH**
replace SN_hhid = "3234987" & unsure_match = 1  if inlist(hhid,"32349810","32349811") & sn_member==7
****

replace SN_hhid = "3234988" if inlist(hhid,"3234982") & sn_member==8

***************************************************   
**WARDID 323557**
local WARDID 323557 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3235571" if ward_id== "323557" & sn_member==1

replace SN_hhid = "3235572" if ward_id== "323557" & sn_member==2

replace SN_hhid = "32355711" if inlist(hhid,"3235571") & sn_member==6

replace SN_hhid = "3235577" if ward_id== "323557" & sn_member==7

replace SN_hhid = "3235579" if inlist(hhid,"3235573") & sn_member==9

***************************************************   
**WARDID 324563**
local WARDID 324563
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "3245632" if inlist(hhid,"3245634") & sn_member==2

replace SN_hhid = "3245639" if inlist(hhid,"3245635") & sn_member==9

***************************************************   
**WARDID 425603**
local WARDID 425603
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4256031" if ward_id== "425603" & sn_member==1

replace SN_hhid = "4256032" if ward_id== "425603" & sn_member==2

replace SN_hhid = "4256033" if ward_id== "425603" & sn_member==3

replace SN_hhid = "4256034" if ward_id== "425603" & sn_member==4

replace SN_hhid = "4256035" if ward_id== "425603" & sn_member==5

replace no_match = 1 if ward_id== "425603" & sn_member==6

**UNSURE MATCH**
replace SN_hhid = "4256038" & unsure_match = 1  if m00_ == "BHOJ BAHADUR CHAND"
****

replace SN_hhid = "4256039" if inlist(hhid,"4256033") & sn_member==9

***************************************************   
**WARDID 425664**
local WARDID 425664
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4256642" if inlist(hhid,"42566415") & sn_member==2

replace SN_hhid = "4256643" if inlist(hhid,"42566414","4256646") & sn_member==3

**UNSURE MATCH**
replace SN_hhid = "4256646" & unsure_match = 1  if inlist(hhid,"4256647") & sn_member==6
replace SN_hhid = "4256647" & unsure_match = 1  if inlist(hhid,"4256643","42566415") & sn_member==7
****

replace SN_hhid = "4256647" if inlist(hhid,"4256646") & sn_member==7

replace SN_hhid = "4256648" if inlist(hhid,"4256641","42566414","4256649","4256644","4256645","4256642") & sn_member==8

replace SN_hhid = "4256649" if inlist(hhid,"4256648") & sn_member==9

***************************************************   
**WARDID 425748**
local WARDID 425748
br if ward_id == "`WARDID'" 
sort sn_member
 
replace SN_hhid = "4257482" if inlist(hhid,"4257481","4257482") & sn_member==2

replace SN_hhid = "4257484" if inlist(hhid,"4257489") & sn_member==4

**UNSURE MATCH**
replace SN_hhid = "4257486" & unsure_match = 1  if inlist(hhid,"4257482","4257485","4257487","42574812","42574811","4257483","4257484","42574810") & sn_member==6
replace SN_hhid = "4257488" & unsure_match = 1  if inlist(hhid,"4257484") & sn_member==8

***************************************************   
**WARDID  426617**
local WARDID 426617
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4266171" if ward_id== "426617" & sn_member==1

replace SN_hhid = "4266172" if inlist(hhid,"42661715") & sn_member==2

replace SN_hhid = "4266174" if inlist(hhid,"4266179") & sn_member==4

replace SN_hhid = "4266179" if ward_id== "426617" & sn_member==9

***************************************************   
**WARDID 426718**
local WARDID 426718
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4267181" if ward_id== "426718" & sn_member==1

replace SN_hhid = "4267182" if ward_id== "426718" & sn_member==2

replace SN_hhid = "4267183" if inlist(hhid,"4267181") & sn_member==3

replace SN_hhid = "4267186" if ward_id== "426718" & sn_member==6

replace SN_hhid = "42671815" if ward_id== "426718" & sn_member==7

replace SN_hhid = "4267189" if ward_id== "426718" & sn_member==8

replace SN_hhid = "4267188" if ward_id== "426718" & sn_member==9

***************************************************   
**WARDID 426726**
local WARDID 426726 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4267261" if inlist(hhid,"4267262") & sn_member==1

replace SN_hhid = "4267262" if ward_id== "426718" & sn_member==2

replace SN_hhid = "4267264" if inlist(hhid,"42672613","42672615","4267265","42672614","4267261","42672612","4267266","42672611","42672610","4267262","4267264","4267268","4267269") & sn_member==4

replace SN_hhid = "4267265" if inlist(hhid,"4267269") & sn_member==4

replace SN_hhid = "4267265" if ward_id== "426726" & sn_member==5

replace SN_hhid = "4267266" if ward_id== "426726" & sn_member==6

replace SN_hhid = "4267268" if ward_id== "426726" & sn_member==7

replace SN_hhid = "4267269" if ward_id== "426726" & sn_member==9

***************************************************   
**WARDID 427626**
local WARDID 427626 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4276261" if inlist(hhid,"4276264") & sn_member==1

replace SN_hhid = "4276264" if inlist(hhid,"42762611","4276264") & sn_member==4

replace SN_hhid = "42762612" if inlist(hhid,"4276261","4276266") & sn_member==5

replace SN_hhid = "4276267" if inlist(hhid,"42762613","4276268") & sn_member==7

replace SN_hhid = "4276261" if inlist(hhid,"4276268") & sn_member==8

replace SN_hhid = "4276265" if inlist(hhid,"4276264") & sn_member==9

***************************************************   
**WARDID 427691**
local WARDID 427691 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4276911" if ward_id== "427691" & sn_member==1

replace SN_hhid = "4276912" if inlist(hhid,"4276917","4276911","4276918") & sn_member==2

replace SN_hhid = "4276913" if inlist(hhid,"4276915","42769113","42769112","42769110","42769111","4276919","4276912","4276917") & sn_member==3

replace SN_hhid = "4276914" if inlist(hhid,"4276911","4276914","42769112","42769110") & sn_member==4

replace SN_hhid = "4276915" if inlist(hhid,"4276918","42769113","4276911") & sn_member==5

replace SN_hhid = "4276915" if inlist(hhid,"4276918","42769113","4276911") & sn_member==8

replace SN_hhid = "4276918" if ward_id== "427691" & sn_member==8

***************************************************   
**WARDID 427696**
local WARDID 427696
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4276962" if inlist(hhid,"4276968","42769611","4276964") & sn_member==2

replace SN_hhid = "4276963" if inlist(hhid,"4276967","4276964") & sn_member==4

replace SN_hhid = "4276965" if ward_id== "427696" & sn_member==5

replace SN_hhid = "4276966" if inlist(hhid,"4276963","42769614","4276965","4276962","42769613","4276969") & sn_member==6

replace SN_hhid = "4276963" if inlist(hhid,"4276967","4276964") & sn_member==4

**UNSURE MATCH**
replace SN_hhid = "4276968" & unsure_match = 1  if inlist(hhid,"42769614") & sn_member==7
****

***************************************************   
**WARDID  427753**
local WARDID 427753
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4277532" if ward_id== "427753" & sn_member==2

replace SN_hhid = "4277534" if inlist(hhid,"4277536") & sn_member==4

replace no_match = 1 if inlist(hhid,"42775311","4277538") & sn_member==4

replace SN_hhid = "4277535" if inlist(hhid,"42775310") & sn_member==5

replace SN_hhid = "4277536" if inlist(hhid,"42775310") & sn_member==6

replace SN_hhid = "4277538" if inlist(hhid,"4277539","4277537") & sn_member==8

replace SN_hhid = "4277539" if inlist(hhid,"4277537") & sn_member==9

***************************************************   
**WARDID 428632**
local WARDID 428632
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4286321" if ward_id== "428632" & sn_member==1

replace SN_hhid = "4286322" if ward_id== "428632" & sn_member==2

replace SN_hhid = "4286323" if inlist(hhid,"4286322","4286321") & sn_member==3

replace SN_hhid = "4286324" if ward_id== "428632" & sn_member==4

replace SN_hhid = "4286325" if inlist(hhid,"4286322","4286321") & sn_member==5

replace SN_hhid = "4286326" if ward_id== "428632" & sn_member==6

replace SN_hhid = "4286327" if ward_id== "428632" & sn_member==7

replace SN_hhid = "4286328" if ward_id== "428632" & sn_member==8

replace SN_hhid = "4286329" if ward_id== "428632" & sn_member==9

***************************************************   
**WARDID 428657**
local WARDID 428657
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4286571" if ward_id== "428657" & sn_member==1

replace SN_hhid = "4286572" if inlist(hhid,"4286574","4286579") & sn_member==2

replace SN_hhid = "4286573" if inlist(hhid,"4286574") & sn_member==3

replace no_match = 1  if m00_ == "KUSUM KHANAL" or m00_ == "KUSUMA KHANAL" & sn_member==4

**UNSURE MATCH**
replace SN_hhid = "4286576" & unsure_match = 1  if inlist(hhid,"42865712","42865713","4286579","4286578") & sn_member==6
****

replace SN_hhid = "4286577" if inlist(hhid,"4286571") & sn_member==7

replace SN_hhid = "4286578" if inlist(hhid,"4286571") & sn_member==8

***************************************************   
**WARDID  428767**
local WARDID 428767 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4287672" if inlist(hhid,"4287676") & sn_member==2

replace SN_hhid = "4287673" if inlist(hhid,"4287672") & sn_member==3

replace SN_hhid = "4287677" if inlist(hhid,"4287678") & sn_member==7

replace SN_hhid = "4287679" if inlist(hhid,"4287672","4287678","42876710","42876711") & sn_member==9

***************************************************   
**WARDID 428769**
local WARDID 428769
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4287692" if ward_id== "428769" & sn_member==2

replace SN_hhid = "42876913" if ward_id== "428769" & sn_member==3

replace SN_hhid = "4287695" if ward_id== "428769" & sn_member==5

replace SN_hhid = "4287696" if inlist(hhid,"4287696") & sn_member==6

replace SN_hhid = "4287697" if inlist(hhid,"42876915","42876911") & sn_member==7

replace SN_hhid = "4287698" if ward_id== "428769" & sn_member==8

replace SN_hhid = "4287699" if ward_id== "428769" & sn_member==9

***************************************************   
**WARDID 429644**
local WARDID 429644
br if ward_id == "`WARDID'" 
sort sn_member

replace no_match = 1 if inlist(hhid,"4296449","4296442") & sn_member==1

**UNSURE MATCH**
replace SN_hhid = "4296442" & unsure_match = 1  if inlist(hhid,"4296448") & sn_member==2
replace SN_hhid = "4296444" & unsure_match = 1  if inlist(hhid,"4296448") & sn_member==4
replace SN_hhid = "4296445" & unsure_match = 1  if inlist(hhid,"4296442") & sn_member==5
****

replace SN_hhid = "4296448" if inlist(hhid,"4296447") & sn_member==8

replace SN_hhid = "4296447" if ward_id== "429644" & sn_member==9

***************************************************   
**WARDID 429674**
local WARDID 429674
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4296741" if inlist(hhid,"42967413","42967414","42967410") & sn_member==1

replace SN_hhid = "4296743" if ward_id== "429674" & sn_member==3

replace SN_hhid = "42967411" if ward_id== "429674" & sn_member==5

replace SN_hhid = "4296747" if inlist(hhid,"4296743","4296741") & sn_member==7

replace SN_hhid = "4296748" if inlist(hhid,"42967410") & sn_member==8

***************************************************   
**WARDID 429689**
local WARDID 429689
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4296891" if inlist(hhid,"4296897","4296896") & sn_member==1

replace SN_hhid = "4296893" if ward_id== "429689" & sn_member==3

replace SN_hhid = "4296893" if inlist(hhid,"42968913","4296896") & sn_member==4

replace SN_hhid = "4296895" if ward_id== "429689" & sn_member==5

replace SN_hhid = "4296896" if ward_id== "429689" & sn_member==6

replace SN_hhid = "4296897" if ward_id== "429689" & sn_member==7

replace SN_hhid = "4296898" if inlist(hhid,"42968912") & sn_member==8

***************************************************   
**WARDID 430704**
local WARDID 430704 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4307041" if inlist(hhid,"4307046") & sn_member==1

replace SN_hhid = "4307042" if inlist(hhid,"43070412") & sn_member==2

replace SN_hhid = "4307043" if inlist(hhid,"43070411","43070412") & sn_member==3

replace SN_hhid = "4307044" if inlist(hhid,"4307044") & sn_member==4

replace SN_hhid = "4307045" if ward_id== "430704" & sn_member==5

replace SN_hhid = "4307046" if inlist(hhid,"4307044") & sn_member==6

replace SN_hhid = "4307047" if inlist(hhid,"43070412","43070411") & sn_member==7

replace SN_hhid = "4307048" if inlist(hhid,"43070411","43070412") & sn_member==8

***************************************************   
**WARDID 430732**
local WARDID 430732
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4307322" if inlist(hhid,"4307329") & sn_member==2

replace SN_hhid = "4307322" if inlist(hhid,"43073215") & sn_member==3

replace SN_hhid = "4307326" if inlist(hhid,"4307324") & sn_member==6

replace SN_hhid = "4307328" if inlist(hhid,"43073212") & sn_member==8

replace SN_hhid = "4307329" if inlist(hhid,"43073210","4307324","4307328") & sn_member==9

***************************************************   
**WARDID 430772**
local WARDID 430772
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "4307722" if inlist(hhid,"43077212") & sn_member==2

replace SN_hhid = "4307723" if inlist(hhid,"4307722") & sn_member==3

replace SN_hhid = "4307724" if inlist(hhid,"4307724","4307722") & sn_member==4

replace SN_hhid = "4307726" if inlist(hhid,"43077210") & sn_member==6

replace SN_hhid = "4307727" if inlist(hhid,"43077210","43077214","4307724","43077215","4307721") & sn_member==7

replace SN_hhid = "4307729" if inlist(hhid,"43077212","4307721","4307727","43077215","4307728","43077210") & sn_member==9

***************************************************   
**WARDID 531785**
local WARDID 531785
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5317851" if ward_id== "531785" & sn_member==1

replace SN_hhid = "5317852" if ward_id== "531785" & sn_member==2

replace SN_hhid = "5317853" if inlist(hhid,"5317854") & sn_member==3

replace SN_hhid = "5317854" if ward_id== "531785" & sn_member==4

replace no_match = 1 if ward_id== "531785" & sn_member==5

replace SN_hhid = "5317856" if ward_id== "531785" & sn_member==6

replace SN_hhid = "5317857" if ward_id== "531785" & sn_member==7

replace SN_hhid = "5317858" if ward_id== "531785" & sn_member==8

replace SN_hhid = "5317859" if ward_id== "531785" & sn_member==9

***************************************************   
**WARDID 531858**
local WARDID 531858 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5318582" if ward_id== "531858" & sn_member==2

replace SN_hhid = "5318584" if ward_id== "5318589" & sn_member==4

replace SN_hhid = "5318585" if inlist(hhid,"53185812","53185810","5318581","5318589","5318584","5318582") & sn_member==5

replace SN_hhid = "5318586" if ward_id== "531858" & sn_member==6

replace SN_hhid = "5318587" if ward_id== "531858" & sn_member==7

replace SN_hhid = "5318588" if ward_id== "531858" & sn_member==8

***************************************************   
**WARDID 531945**
local WARDID 531945
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5319452" if ward_id== "531945" & sn_member==2

replace SN_hhid = "5319453" if ward_id== "531945" & sn_member==3

replace SN_hhid = "5319455" if ward_id== "531945" & sn_member==5

replace SN_hhid = "5319456" if ward_id== "531945" & sn_member==6

replace SN_hhid = "5319457" if ward_id== "531945" & sn_member==7

replace SN_hhid = "5319458" if ward_id== "531945" & sn_member==8

replace SN_hhid = "5319459" if ward_id== "531945" & sn_member==9

***************************************************   
**WARDID 532792**
local WARDID 532792
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5327922" if ward_id== "531945" & sn_member==1

replace SN_hhid = "5327923" if ward_id== "531945" & sn_member==2 

replace SN_hhid = "5327921" if ward_id== "531945" & sn_member==3

replace SN_hhid = "5327924" if ward_id== "531945" & sn_member==4

replace SN_hhid = "5327926" if inlist(hhid,"5327928") & sn_member==6

replace SN_hhid = "53279214" if inlist(hhid,"53279212","53279211","53279211") & sn_member==7

replace SN_hhid = "53279214" if inlist(hhid,"5327923","5327922","5327926","53279215") & sn_member==8

replace SN_hhid = "53279213" if inlist(hhid,"5327924","5327921") & sn_member==8

**UNSURE MATCH**
replace SN_hhid = "53279213" & unsure_match = 1  if inlist(hhid,"5327923") & sn_member==9
****

replace SN_hhid = "5327922" if inlist(hhid,"5327923") & sn_member==9 

replace SN_hhid = "5327914" if m00_ == "URMILA KHANNAL" & sn_member==9 

***************************************************   
**WARDID 532802**
local WARDID 532802
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5328023" if inlist(hhid,"53280210","53280213") & sn_member==3

replace SN_hhid = "5328024" if ward_id== "532802" & sn_member==4

replace SN_hhid = "5328026" if inlist(hhid,"5328024","5328022","53280210","53280215","5328023") & sn_member==6

replace SN_hhid = "5328027" if inlist(hhid,"5328025","53280210") & sn_member==7

replace no_match = 1  if inlist(hhid,"5328026") & sn_member==9

replace SN_hhid = "5328029" if inlist(hhid,"5328022","5328023","53280215","53280211","5328021","53280213","5328024","53280210","53280214","5328029") & sn_member==9

replace SN_hhid = "53280212" if inlist(hhid,"5328027","5328028") & sn_member==9

***************************************************   
**WARDID 532874**
local WARDID 532874
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5328742" if inlist(hhid,"53287411") & sn_member==2

replace no_match = 1 if inlist(hhid,"5328746","5328741") & sn_member==3

replace SN_hhid = "5328744" if inlist(hhid,"53287413","53287411") & sn_member==4

replace SN_hhid = "5328744" if inlist(hhid,"5328745","5328744") & sn_member==5

replace SN_hhid = "5328746" if inlist(hhid,"53287411") & sn_member==6

replace no_match = 1 if inlist(hhid,"5328743","53287410","5328741","53287412","5328742","5328748","5328746","53287411") & sn_member==7

replace SN_hhid = "5328748" if inlist(hhid,"53287411","5328746") & sn_member==8

replace SN_hhid = "53287411" if inlist(hhid,"5328744") & sn_member==9

***************************************************   
**WARDID 533818**
local WARDID 533818 
br if ward_id == "`WARDID'" 
sort sn_member

replace no_match = 1 if ward_id== "533818" & sn_member==1

replace SN_hhid = "5338182" if ward_id== "533818" & sn_member==2

replace SN_hhid = "5338183" if inlist(hhid,"53381814","53381813","5338187") & sn_member==3

**UNSURE MATCH**
replace SN_hhid = "5338183" & unsure_match = 1  if inlist(hhid,"5338188","5338185","5338181","5338189","53381811","53381812","53381815","53381810") & sn_member==3
****

replace SN_hhid = "5338184" if inlist(hhid,"53381814") & sn_member==4

replace SN_hhid = "5338185"  if ward_id== "533818" & sn_member==5

replace no_match = 1 if inlist(hhid,"53381812","53381810","53381815","5338181","53381811","5338185","5338184","53381813","5338182","5338183","5338188") & sn_member==5

replace SN_hhid = "5338187"  if ward_id== "533818" & sn_member==7

replace SN_hhid = "5338188"  if ward_id== "533818" & sn_member==8

replace SN_hhid = "5338189"  if ward_id== "533818" & sn_member==9

***************************************************   
**WARDID 533835**
local WARDID 533835
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5338351" if inlist(hhid,"5338358","53383515") & sn_member==1

replace no_match = 1 if inlist(hhid,"5338353","5338354","53383512","5338357","5338351") & sn_member==2

replace SN_hhid = "5338353"  if ward_id== "533835" & sn_member==3

replace SN_hhid = "5338355" if inlist(hhid,"5338359") & sn_member==5

replace SN_hhid = "5338355" if inlist(hhid,"5338359") & sn_member==5

replace SN_hhid = "5338356" if inlist(hhid,"5338351","53383512","5338357","53383513","5338356","5338355","53383511","53383514","5338358","5338359") & sn_member==6

replace SN_hhid = "5338358" if inlist(hhid,"5338357","53383513","53383511","5338359","5338358","53383514","53383512","5338352","5338356","53383510") & sn_member==8

replace SN_hhid = "5338359" if inlist(hhid,"5338354","53383510","5338357","5338356","5338355","5338359","53383513","5338351","5338352","53383511") & sn_member==9

***************************************************   
**WARDID 533911**
local WARDID 533911
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5339111"  if ward_id== "533911" & sn_member==1

replace no_match = 1 if inlist(hhid,"53391110","5339111") & sn_member==2

replace SN_hhid = "5339113" if inlist(hhid,"53391110","5339111") & sn_member==3

replace SN_hhid = "5339114"  if ward_id== "533911" & sn_member==4

replace SN_hhid = "5339115"  if ward_id== "533911" & sn_member==5

replace SN_hhid = "5339114"  if ward_id== "533911" & sn_member==6

replace SN_hhid = "5339117" if inlist(hhid,"5339111") & sn_member==7

replace no_match = 1 if inlist(hhid,"5339111","53391112","5339115","53391111") & sn_member==8

replace SN_hhid = "5339119" if inlist(hhid,"5339113","5339114","5339116","5339119","5339111","53391113","5339117") & sn_member==8

replace SN_hhid = "53391110" if inlist(hhid,"5339118") & sn_member==9

***************************************************   
**WARDID 534822**
local WARDID 534822
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5348221" if ward_id== "534822" & sn_member==1

replace SN_hhid = "5348222" if inlist(hhid,"53482215","53482211","5348224","5348221","53482213","53482214","5348229","53482210","5348225") & sn_member==2

**UNSURE MATCH**
replace SN_hhid = "5348222" & unsure_match = 1  if inlist(hhid,"5348228","5348228") & sn_member==2
****

replace SN_hhid = "5348223" if inlist(hhid,"5348222","5348223","5348221") & sn_member==3

replace SN_hhid = "5348224" if m00_== "SHANTI HISKI" & sn_member==4

replace SN_hhid = "5348225" if inlist(hhid,"5348224","53482210","53482212") & sn_member==5

replace SN_hhid = "5348226" if inlist(hhid,"5348227") & sn_member==6

replace SN_hhid = "5348224" if inlist(hhid,"5348229") & sn_member==7

replace SN_hhid = "5348227" if inlist(hhid,"53482210","5348225","53482215","53482212","53482213","5348224","5348226") & sn_member==7

***************************************************   
**WARDID 534887**
local WARDID 534887 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5348873" if inlist(hhid,"5348875","53488713","5348872","5348871","5348879","5348876","5348877","53488712","53488714","5348878","53488715") & sn_member==3

replace no_match = 1 if inlist(hhid,"5348871","53488713","53488710","5348879","5348875","5348878","53488712","5348877","5348874") & sn_member==4

replace SN_hhid = "5348878" if inlist(hhid,"5348872") & sn_member==7

replace SN_hhid = "5348878" if inlist(hhid,"5348876","53488715","5348879","5348874","53488713","5348873","5348871","53488710","5348877","53488710") & sn_member==8

replace SN_hhid = "5348879" if inlist(hhid,"53488711","5348877") & sn_member==9

***************************************************   
**WARDID 534902**
local WARDID 534902 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5349021" if ward_id== "534902" & sn_member==1

replace SN_hhid = "5349022" if inlist(hhid,"5349027","53490215","53490214","53490211") & sn_member==2

replace SN_hhid = "5349023" if inlist(hhid,"5349023") & sn_member==3

replace no_match = 1 if inlist(hhid,"5349025") & sn_member==5

replace SN_hhid = "5349025" if inlist(hhid,"5349022","5349026") & sn_member==5

replace SN_hhid = "5349026" if inlist(hhid,"5349024","53490211","53490212","5349022","53490210") & sn_member==6

replace no_match = 1 if inlist(hhid,"5349023","5349021") & sn_member==6

replace SN_hhid = "5349028" if ward_id== "534902" & sn_member==8

replace SN_hhid = "5349029" if inlist(hhid,"53490211") & sn_member==9

***************************************************   
**WARDID 534906**
local WARDID 534906
br if ward_id == "`WARDID'" 
sort sn_member

replace no_match = 1 if inlist(hhid,"53490614","5349069") & sn_member==1

replace SN_hhid = "5349063" if inlist(hhid,"5349066","5349069","53490614") & sn_member==2

replace no_match = 1 if inlist(hhid,"53490612","53490611","53490610") & sn_member==2

replace SN_hhid = "5349063" if inlist(hhid,"5349063","5349062","5349067","5349068","5349064","53490615","5349065","5349061","53490611","53490612","53490610") & sn_member==3

replace SN_hhid = "5349065" if inlist(hhid,"5349065") & sn_member==5

replace SN_hhid = "5349066" if inlist(hhid,"5349063","5349061","5349062","5349064") & sn_member==5

replace no_match = 1 if inlist(hhid,"53490610","53490612","53490611") & sn_member==5

replace no_match = 1 if inlist(hhid,"5349069") & sn_member==6

replace no_match = 1 if inlist(hhid,"53490610") & sn_member==9

replace SN_hhid = "5349066" if inlist(hhid,"5349063","5349061","5349062","5349064") & sn_member==5

replace SN_hhid = "5349065" if inlist(hhid,"5349061","5349069") & sn_member==6

replace SN_hhid = "5349066" if inlist(hhid,"53490613","5349066","5349065") & sn_member==6

replace SN_hhid = "5349067" if ward_id== "534906" & sn_member==7

replace SN_hhid = "5349068" if inlist(hhid,"53490611","53490610") & sn_member==8

replace SN_hhid = "5349069" if inlist(hhid, "53490610") & sn_member==9

***************************************************   
**WARDID 535841**
local WARDID 535841
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5358411" if inlist(hhid,"5358413","5358416") & sn_member==1

replace SN_hhid = "5358412" if ward_id== "535841" & sn_member==2

replace SN_hhid = "5358414" if ward_id== "535841" & sn_member==4

replace no_match = 1 if inlist(hhid,"5358411","5358412","5358414","53584112","5358419") & sn_member==5

replace SN_hhid = "5358415" if inlist(hhid,"53584113") & sn_member==5

replace SN_hhid = "5358416" if ward_id== "535841" & sn_member==6

replace no_match = 1 if inlist(hhid,"53584115","5358414","5358411","53584112","53584114","53584110","5358419","5358418") & sn_member==7

***************************************************   
**WARDID 535845**
local WARDID 535845
br if ward_id == "`WARDID'" 
sort sn_member

replace no_match = 1 if ward_id== "535845" & sn_member==1

replace SN_hhid = "5358453" if inlist(hhid,"5358452") & sn_member==3

replace SN_hhid = "5358454" if inlist(hhid,"5358459","53584515","53584514","53584511") & sn_member==4

replace SN_hhid = "5358456" if inlist(hhid,"53584515") & sn_member==6

replace SN_hhid = "5358457" if inlist(hhid,"53584515") & sn_member==7

replace SN_hhid = "5358458" if inlist(hhid,"53584515") & sn_member==8

**UNSURE MATCH**
replace SN_hhid = "5358459" & unsure_match = 1  if inlist(hhid,"53584511","5358454") & sn_member==9

***************************************************   
**WARDID 535896**
local WARDID 535896
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5358962" if inlist(hhid,"53584515") & sn_member==2

replace SN_hhid = "5358963" if inlist(hhid,"53589615","5358964","5358962") & sn_member==3

replace SN_hhid = "5358964" if inlist(hhid,"53589615") & sn_member==4

**UNSURE MATCH**
replace SN_hhid = "5358965" & unsure_match = 1  if inlist(hhid,"53589615") & sn_member==5
****

replace SN_hhid = "5358967" if inlist(hhid,"53589614","5358961","5358967") & sn_member==7

replace SN_hhid = "5358969" if inlist(hhid,"5358967","5358965","53589615","5358961") & sn_member==9

replace no_match = 1 if inlist(hhid,"53589613","53589611","5358968","5358962") & sn_member==4

***************************************************   
**WARDID 536866**
local WARDID 536866
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5368661" if ward_id== "536866" & sn_member==1

replace SN_hhid = "5368662" if ward_id== "536866" & sn_member==2

replace SN_hhid = "5368663" if ward_id== "536866" & sn_member==3

replace SN_hhid = "5368664" if ward_id== "536866" & sn_member==4

replace SN_hhid = "5368665" if ward_id== "536866" & sn_member==5

replace SN_hhid = "5368666" if ward_id== "536866" & sn_member==6

replace SN_hhid = "5368667" if inlist(hhid,"53686610","53686614","5368662","53686612") & sn_member==7

replace SN_hhid = "5368668" if inlist(hhid,"53686615") & sn_member==7

replace SN_hhid = "5368668" if inlist(hhid,"5368662","5368664","5368668","53686614","5368664") & sn_member==8

replace SN_hhid = "5368669" if inlist(hhid,"53686614","5368662","5368661","5368668","5368664","53686612","5368669") & sn_member==9

***************************************************   
**WARDID 536922**
local WARDID 536922
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5369222" if inlist(hhid,"5369225","53692211","53692212","5369223","53692210") & sn_member==2

replace SN_hhid = "5369225" if inlist(hhid,"5369222","5369224","5369221") & sn_member==5

replace SN_hhid = "5369226" if ward_id== "536922" & sn_member==6

replace SN_hhid = "5369227" if inlist(hhid,"53692212","5369228") & sn_member==7

replace SN_hhid = "5369228" if inlist(hhid,"5369224") & sn_member==8

replace no_match = 1 if inlist(hhid,"5369224") & sn_member==9

***************************************************   
**WARDID 536937**
local WARDID 536937
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "5369371" if inlist(hhid,"53693711","5369376") & sn_member==1

replace SN_hhid = "5369372" if ward_id== "536937" & sn_member==2

replace SN_hhid = "5369377" if inlist(hhid,"5369372") & sn_member==7

replace SN_hhid = "5369379" if inlist(hhid,"5369372") & sn_member==9

***************************************************   
**WARDID 6371045**
local WARDID 6371045 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "63710453" if ward_id== "6371045" & sn_member==3

replace SN_hhid = "63710454" if ward_id== "6371045" & sn_member==4

replace SN_hhid = "63710455" if ward_id== "6371045" & sn_member==5

replace SN_hhid = "63710456" if ward_id== "6371045" & sn_member==6

replace SN_hhid = "637104514" if inlist(hhid,"63710457","63710455","63710456") & sn_member==7

replace SN_hhid = "637104514" if inlist(hhid,"637104513") & sn_member==8

replace SN_hhid = "63710458" if inlist(hhid,"63710451") & sn_member==8

replace SN_hhid = "637104511" if inlist(hhid,"63710454") & sn_member==9

***************************************************   
**WARDID 637957**
local WARDID 637957 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "6379571" if inlist(hhid,"6379579","6379573") & sn_member==1

replace no_match = 1 if inlist(hhid,"6379573") & sn_member==3

replace SN_hhid = "63795714" if inlist(hhid,"6379579","6379573") & sn_member==7

replace SN_hhid = "63795714" if inlist(hhid,"63795715") & sn_member==8

replace no_match = 1 if inlist(hhid,"63795711") & sn_member==8

replace SN_hhid = "6379578" if inlist(hhid,"6379578") & sn_member==8

replace no_match = 1 if inlist(hhid,"6379579") & sn_member==8

replace SN_hhid = "63795710" if inlist(hhid,"63795714") & sn_member==9

replace SN_hhid = "6379578" if inlist(hhid,"6379575","63795712") & sn_member==9

***************************************************   
**WARDID 637972**
local WARDID 637972
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "6379721" if inlist(hhid,"63797212") & sn_member==1

replace SN_hhid = "6379723" if inlist(hhid,"6379728","63797214","6379723") & sn_member==2

replace SN_hhid = "6379722" if inlist(hhid,"63797215") & sn_member==2

replace no_match = 1 if inlist(hhid,"63797210","6379729") & sn_member==3

replace SN_hhid = "6379725" if inlist(hhid,"6379723","6379728","63797214","63797213","63797211","6379729") & sn_member==4

replace SN_hhid = "6379725" if inlist(hhid,"63797215","6379727","6379724","6379729","6379725","63797210","6379726","6379721") & sn_member==5

replace SN_hhid = "6379725" if inlist(hhid,"63797212") & sn_member==6

replace SN_hhid = "6379726" if inlist(hhid,"6379729","6379722","63797210") & sn_member==6

replace SN_hhid = "63797214" if inlist(hhid,"6379723") & sn_member==7

replace SN_hhid = "63797211" if inlist(hhid,"6379726","6379727") & sn_member==7

replace SN_hhid = "63797214" if inlist(hhid,"6379721","6379724") & sn_member==8

replace no_match = 1 if inlist(hhid,"63797211","63797213","63797213") & sn_member==8

replace SN_hhid = "63797215" if inlist(hhid,"6379726","6379727") & sn_member==9

***************************************************   
**WARDID 6381059**
local WARDID 6381059 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "63810591" if inlist(hhid,"638105912","63810599","638105913","63810594","63810598","638105910") & sn_member==1

replace SN_hhid = "63810592" if inlist(hhid,"638105913") & sn_member==2

**UNSURE MATCH**
replace SN_hhid = "63810594" & unsure_match = 1  if inlist(hhid,"638105914","638105911","638105915") & sn_member==4
****

replace SN_hhid = "63810596" if inlist(hhid,"63810597","63810595","638105915","63810598") & sn_member==6

replace SN_hhid = "638105915" if inlist(hhid,"638105912") & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "638105915" & unsure_match = 1  if inlist(hhid,"638105910") & sn_member==8
****

replace SN_hhid = "63810592" if inlist(hhid,"638105910") & sn_member==8

replace no_match = 1 if inlist(hhid,"63810594") & sn_member==8

replace SN_hhid = "638105911" if inlist(hhid,"638105913") & sn_member==9

***************************************************   
**WARDID 638964**
local WARDID 638964 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "6389645" if inlist(hhid,"63896411","6389642","63896410","6389641") & sn_member==1

replace SN_hhid = "6389642" if inlist(hhid,"6389648","6389649","6389643","63896412","63896415") & sn_member==2

replace SN_hhid = "6389643" if inlist(hhid,"6389649") & sn_member==3

replace SN_hhid = "6389644" if inlist(hhid,"6389642","6389641","63896414","6389648","63896412","6389647","6389645","63896413","6389643") & sn_member==4

replace SN_hhid = "6389641" if inlist(hhid,"6389649","63896414","6389641","6389649","63896413") & sn_member==5

replace SN_hhid = "6389646" if inlist(hhid,"6389644") & sn_member==5

replace SN_hhid = "6389646" if inlist(hhid,"6389646") & sn_member==6

**UNSURE MATCH**
replace SN_hhid = "6389647" & unsure_match = 1  if inlist(hhid,"6389643") & sn_member==7
****

replace SN_hhid = "6389647" if inlist(hhid,"63896412") & sn_member==7

replace SN_hhid = "6389647" if inlist(hhid,"6389648") & sn_member==8

replace SN_hhid = "63896415" if inlist(hhid,"6389645","6389647","63896413") & sn_member==9

replace SN_hhid = "6389647" if inlist(hhid,"63896410") & sn_member==9

***************************************************   
**WARDID 638966**
local WARDID 638966 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "6389663" if ward_id== "638966" & sn_member==3

replace SN_hhid = "6389666" if ward_id== "638966" & sn_member==4

replace SN_hhid = "6389665" if inlist(hhid,"6389667") & sn_member==5

replace SN_hhid = "6389669" if inlist(hhid,"6389661") & sn_member==7

replace SN_hhid = "6389667" if inlist(hhid,"6389664") & sn_member==7

replace SN_hhid = "6389669" if inlist(hhid,"6389662","63896615","6389664") & sn_member==8

replace SN_hhid = "63896613" if inlist(hhid,"63896610","63896614","63896615","63896612","6389663","6389666") & sn_member==9

***************************************************   
**WARDID 6391078**
local WARDID 6391078 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "63910782" if inlist(hhid,"63910789","63910784","639107814","63910781") & sn_member==2

replace no_match = 1 if inlist(hhid,"63910785") & sn_member==2

replace SN_hhid = "63910785" if inlist(hhid,"63910785") & sn_member==3

replace SN_hhid = "63910783" if inlist(hhid,"639107814") & sn_member==4

replace SN_hhid = "63910785" if inlist(hhid,"63910789","639107812","639107813","63910786","63910783","639107811","63910788","63910782","63910784","63910787") & sn_member==5

replace no_match = 1 if inlist(hhid,"63910781") & sn_member==5

replace SN_hhid = "63910786" if inlist(hhid,"639107815") & sn_member==5

replace SN_hhid = "63910786" if inlist(hhid,"63910789","63910788") & sn_member==6

replace SN_hhid = "63910785" if inlist(hhid,"639107810") & sn_member==6

***************************************************   
**WARDID 639986**
local WARDID 639986
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "6399861" if inlist(hhid,"6399865","6399867") & sn_member==1

replace SN_hhid = "6399866" if inlist(hhid,"6399866") & sn_member==4

replace SN_hhid = "6399865" if inlist(hhid,"63998612","63998613") & sn_member==5

replace SN_hhid = "6399866" if ward_id== "639986" & sn_member==6

replace SN_hhid = "6399869" if inlist(hhid,"63998614","6399867","6399863") & sn_member==7

***************************************************   
**WARDID 639987**
local WARDID 639987 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "6399871" if inlist(hhid,"6399872","63998712") & sn_member==1

replace SN_hhid = "6399872" if inlist(hhid,"6399875","6399873","63998711","63998712") & sn_member==2

replace SN_hhid = "6399874" if inlist(hhid,"63998714","63998711") & sn_member==4

replace SN_hhid = "6399875" if inlist(hhid,"63998712","63998711") & sn_member==5

replace SN_hhid = "6399876" if inlist(hhid,"63998711","63998712") & sn_member==6

replace SN_hhid = "63998711" if inlist(hhid,"63998714","63998715","63998713") & sn_member==7

replace SN_hhid = "63998711" if inlist(hhid,"6399873") & sn_member==8

replace SN_hhid = "63998715" if inlist(hhid,"63998711") & sn_member==8

replace SN_hhid = "6399878" if inlist(hhid,"6399876","63998710","63998712") & sn_member==9

replace SN_hhid = "63998710" if inlist(hhid,"6399877") & sn_member==9

***************************************************   
**WARDID 6401028**
local WARDID 6401028 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "64010282" if inlist(hhid,"64010288","640102815","64010281","64010287") & sn_member==2

replace no_match = 1 if inlist(hhid,"6399812") & sn_member==2

replace SN_hhid = "64010286" if inlist(hhid,"64010284","64010287","64010283") & sn_member==6

replace SN_hhid = "64010288" if inlist(hhid,"640102812") & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "64010288" & unsure_match = 1  if inlist(hhid,"640102813") & sn_member==9
****

replace SN_hhid = "64010288" if inlist(hhid,"64010287") & sn_member==9

***************************************************   
**WARDID 6401064**
local WARDID 6401064 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "64010642" if inlist(hhid,"64010648","64010644") & sn_member==1

replace SN_hhid = "64010642" if inlist(hhid,"64010641","64010642","640106415","64010643","640106412") & sn_member==2

replace SN_hhid = "64010643" if inlist(hhid,"64010644","64010648") & sn_member==2

replace SN_hhid = "64010643" if inlist(hhid,"640106412","64010645","64010643","640106410","640106411","640106413","64010641","64010647","640106414") & sn_member==3

replace SN_hhid = "64010644" if inlist(hhid,"640106415","64010648") & sn_member==4

replace SN_hhid = "64010645" if inlist(hhid,"640106410","640106411") & sn_member==5

replace SN_hhid = "64010646" if inlist(hhid,"64010647") & sn_member==6

replace SN_hhid = "640106411" if inlist(hhid,"640106411") & sn_member==7

replace SN_hhid = "640106411" if inlist(hhid,"64010645") & sn_member==8

replace no_match = 1 if inlist(hhid,"64010649","640106413","64010648","64010644") & sn_member==8

replace no_match = 1 if inlist(hhid,"64010641") & sn_member==8

***************************************************   
**WARDID 640997**
local WARDID 640997
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "6409971" if ward_id=="640997" & sn_member==1

replace SN_hhid = "6409977" if ward_id=="640997" & sn_member==2

replace SN_hhid = "6409973" if inlist(hhid,"6409971","64099715","6409978","64099710","6409979","64099713") & sn_member==3

replace SN_hhid = "6409974" if inlist(hhid,"6409971","64099713") & sn_member==4

replace SN_hhid = "6409975" if ward_id=="640997" & sn_member==5

replace SN_hhid = "64099714" if inlist(hhid,"6409972","6409977","6409976","6409971") & sn_member==8

replace SN_hhid = "64099710" if inlist(hhid,"64099714") & sn_member==9

replace SN_hhid = "64099715" if inlist(hhid,"6409976") & sn_member==9

replace SN_hhid = "64099711" if inlist(hhid,"64099710","6409979") & sn_member==9

***************************************************   
**WARDID 6411008**
local WARDID 6411008
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "64110081" if ward_id=="6411008" & sn_member==1

replace SN_hhid = "64110082" if ward_id=="6411008" & sn_member==2

replace SN_hhid = "64110083" if ward_id=="6411008" & sn_member==3

replace SN_hhid = "64110084" if ward_id=="6411008" & sn_member==4

replace SN_hhid = "64110085" if inlist(hhid,"641100813") & sn_member==5

replace SN_hhid = "64110086" if ward_id=="6411008" & sn_member==6

replace SN_hhid = "641100814" if inlist(hhid,"64110086") & sn_member==6

replace SN_hhid = "64110088" if inlist(hhid,"64110088") & sn_member==7

replace SN_hhid = "641100814" if inlist(hhid,"64110087") & sn_member==8

***************************************************   
**WARDID 6411016**
local WARDID 6411016 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "64110161" if ward_id=="6411016" & sn_member==1

replace SN_hhid = "64110162" if ward_id=="6411016" & sn_member==2

replace SN_hhid = "64110162" if inlist(hhid,"641101614") & sn_member==3

replace SN_hhid = "64110164" if ward_id=="6411016" & sn_member==4

replace SN_hhid = "64110166" if inlist(hhid,"64110169","64110162","64110161") & sn_member==6

replace SN_hhid = "641101610" if inlist(hhid,"641101611","641101612","64110166") & sn_member==7

replace SN_hhid = "641101613" if inlist(hhid,"64110164") & sn_member==7

replace SN_hhid = "64110169" if inlist(hhid,"64110168") & sn_member==7

replace SN_hhid = "64110169" if inlist(hhid,"64110161","64110167") & sn_member==8

replace SN_hhid = "64110167" if inlist(hhid,"64110168") & sn_member==8

replace SN_hhid = "64110167" if inlist(hhid,"64110169","64110161") & sn_member==9

***************************************************   
**WARDID 6411087**
local WARDID 6411087
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "64110871" if inlist(hhid,"641108713","641108714") & sn_member==1

replace SN_hhid = "64110874" if ward_id=="6411087" & sn_member==4

replace SN_hhid = "64110875" if ward_id=="6411087" & sn_member==5

replace SN_hhid = "64110878" if inlist(hhid,"64110879","641108712","64110873") & sn_member==7

replace SN_hhid = "641108713" if inlist(hhid,"641108710","64110876") & sn_member==7

replace SN_hhid = "64110877" if inlist(hhid,"64110877") & sn_member==7

replace SN_hhid = "641108712" if inlist(hhid,"641108715") & sn_member==8

replace SN_hhid = "64110877" if inlist(hhid,"64110873","641108711") & sn_member==8

replace SN_hhid = "641108714" if inlist(hhid,"64110875","641108713","641108712","64110876") & sn_member==8

replace no_match = 1 if inlist(hhid,"64110877") & sn_member==8

replace SN_hhid = "641108714" if inlist(hhid,"641108715","64110878") & sn_member==9

replace no_match = 1 if inlist(hhid,"64110876","64110875") & sn_member==9

replace no_match = 1 if inlist(hhid,"64110872") & sn_member==9

replace SN_hhid = "64110877" if inlist(hhid,"641108712") & sn_member==9

replace SN_hhid = "641108712" if inlist(hhid,"641108714") & sn_member==9

***************************************************   
**WARDID 6421031**
local WARDID 6421031
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "64210311" if ward_id=="6421031" & sn_member==1

replace SN_hhid = "64210312" if inlist(hhid,"642103114","642103113","64210319","64210314") & sn_member==2

**UNSURE MATCH**
replace SN_hhid = "64210312" & unsure_match = 1  if inlist(hhid,"642103110","642103111","64210316","64210315","642103112") & sn_member==2
****

replace SN_hhid = "64210313" if inlist(hhid,"642103114") & sn_member==3

replace SN_hhid = "64210314" if ward_id=="6421031" & sn_member==4

replace SN_hhid = "64210315" if ward_id=="6421031" & sn_member==5

replace SN_hhid = "64210316" if ward_id=="6421031" & sn_member==6

replace SN_hhid = "64210317" if inlist(hhid,"64210312","642103113","642103114","64210318") & sn_member==7

replace SN_hhid = "642103110" if inlist(hhid,"642103111") & sn_member==7

replace SN_hhid = "64210318" if inlist(hhid,"64210313","642103114","64210315","64210319","642103113","64210317","64210311","64210314") & sn_member==7

replace no_match = 1 if inlist(hhid,"642103112","64210316","642103115","642103110","642103111") & sn_member==8

replace SN_hhid = "642103112" if inlist(hhid,"642103110") & sn_member==9

replace SN_hhid = "64210317" if inlist(hhid,"64210314","64210319","64210315") & sn_member==9

***************************************************   
**WARDID 6431092**
local WARDID 6431092
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "64310921" if inlist(hhid,"642103110") & sn_member==1

replace SN_hhid = "64310923" if ward_id=="6431092" & sn_member==3

replace SN_hhid = "64310924" if inlist(hhid,"643109210") & sn_member==4

replace SN_hhid = "64310926" if ward_id=="6431092" & sn_member==6

**UNSURE MATCH**
replace SN_hhid = "64310927" & unsure_match = 1  if inlist(hhid,"64310923","643109211","643109210","643109212") & sn_member==7
****

replace SN_hhid = "643109215" if inlist(hhid,"643109214") & sn_member==7

replace SN_hhid = "643109214" if inlist(hhid,"643109213") & sn_member==8

replace no_match = 1 if inlist(hhid,"643109214") & sn_member==9

replace SN_hhid = "64310929" if inlist(hhid,"64310929") & sn_member==9

***************************************************   
**WARDID 6431102**
local WARDID 6431102
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "64311021" if ward_id=="6431102" & sn_member==1

replace SN_hhid = "64311022" if inlist(hhid,"643110213") & sn_member==2

replace SN_hhid = "64311023" if inlist(hhid,"643110213") & sn_member==3

replace SN_hhid = "64311024" if ward_id=="6431102" & sn_member==4

replace SN_hhid = "64311025" if ward_id=="6431102" & sn_member==5

replace SN_hhid = "64311026" if ward_id=="6431102" & sn_member==6

replace SN_hhid = "643110215" if inlist(hhid,"643110211") & sn_member==7

replace SN_hhid = "643110213" if inlist(hhid,"64311022","64311027","64311029","64311028","64311025") & sn_member==7

replace SN_hhid = "64311029" if inlist(hhid,"64311025") & sn_member==8

replace SN_hhid = "64311028" if inlist(hhid,"643110213") & sn_member==9

replace SN_hhid = "64311027" if inlist(hhid,"64311027") & sn_member==9

***************************************************   
**WARDID 6431109**
local WARDID 6431109
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "64311093" if ward_id=="6431109" & sn_member==3

replace SN_hhid = "64311096" if ward_id=="6431109" & sn_member==6

replace SN_hhid = "643110913" if inlist(hhid,"643110915") & sn_member==7

replace SN_hhid = "643110910" if inlist(hhid,"64311092") & sn_member==8

replace SN_hhid = "643110911" if inlist(hhid,"643110910","64311094","643110911","64311093") & sn_member==9

***************************************************   
**WARDID 7441118**
local WARDID 7441118
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74411182" if inlist(hhid,"74411181","74411182","74411185") & sn_member==2

replace SN_hhid = "74411186" if inlist(hhid,"74411183","744111810") & sn_member==6

replace SN_hhid = "74411187" if inlist(hhid,"744111810","74411187","74411184","74411185","74411183","74411181","74411182") & sn_member==7

replace SN_hhid = "74411189" if inlist(hhid,"74411188","74411187","74411182","74411181","74411183") & sn_member==9

***************************************************   
**WARDID 7441205**
local WARDID 7441205
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74412051" if inlist(hhid,"74412056") & sn_member==1

replace SN_hhid = "74412052" if inlist(hhid,"74412056","744120512","74412051","74412055","744120513","74412054") & sn_member==2

**UNSURE MATCH**
replace SN_hhid = "74412052" & unsure_match = 1 if inlist(hhid,"744120511") & sn_member==2
****

replace SN_hhid = "74412053" if ward_id=="7441205" & sn_member==3

replace SN_hhid = "74412054" if inlist(hhid,"744120515") & sn_member==4

replace SN_hhid = "74412055" if inlist(hhid,"74412054") & sn_member==5

replace SN_hhid = "744120511" if inlist(hhid,"744120512") & sn_member==5

**UNSURE MATCH**
replace SN_hhid = "74412054" & unsure_match = 1 if inlist(hhid,"74412057","74412058") & sn_member==5
replace SN_hhid = "74412055" & unsure_match = 1 if inlist(hhid,"744120510") & sn_member==4
replace SN_hhid = "74412055" & unsure_match = 1 if inlist(hhid,"74412056","744120512") & sn_member==5
****

replace SN_hhid = "74412056" if inlist(hhid,"74412053","74412052") & sn_member==6

replace SN_hhid = "74412058" if inlist(hhid,"74412051") & sn_member==8

replace SN_hhid = "74412058" if inlist(hhid,"74412054") & sn_member==9

replace SN_hhid = "74412059" if inlist(hhid,"74412055") & sn_member==9

***************************************************   
**WARDID 7441253**
local WARDID 7441253
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74412532" if ward_id=="7441253" & sn_member==2

replace SN_hhid = "74412533" if inlist(hhid,"74412534") & sn_member==3

replace SN_hhid = "74412534" if inlist(hhid,"74412538") & sn_member==4

replace SN_hhid = "74412536" if ward_id=="7441253" & sn_member==6

replace SN_hhid = "744125311" if inlist(hhid,"74412537") & sn_member==9

***************************************************   
**WARDID 7451123**
local WARDID 7451123
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74511232" if ward_id=="7451123" & sn_member==2

replace SN_hhid = "74511233" if ward_id=="7451123" & sn_member==3

replace SN_hhid = "74511234" if ward_id=="7451123" & sn_member==4

replace SN_hhid = "74511235" if inlist(hhid,"745112313") & sn_member==5

replace SN_hhid = "74511239" if inlist(hhid,"74511237") & sn_member==9

***************************************************   
**WARDID 7451124**
local WARDID 7451124
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74511241" if ward_id=="7451124" & sn_member==1

replace SN_hhid = "74511242" if ward_id=="7451124" & sn_member==2

replace SN_hhid = "74511242" if inlist(hhid,"74511246") & sn_member==3

replace SN_hhid = "74511244" if inlist(hhid,"74511248","74511247","745112410","745112412") & sn_member==4

replace SN_hhid = "74511246" if inlist(hhid,"745112414","745112412","74511248","745112410","74511241","74511242","745112413","74511247") & sn_member==6

replace no_match = 1 if inlist(hhid,"745112410","74511244","745112415") & sn_member==6

replace SN_hhid = "74511247" if inlist(hhid,"74511244","745112410","745112413","745112415","745112412","745112414","745112411","74511243") & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "74511242" & unsure_match = 1 if inlist(hhid,"74511248") & sn_member==7
****

replace SN_hhid = "74511248" if ward_id=="7451124" & sn_member==8

replace SN_hhid = "74511249" if inlist(hhid,"74511245") & sn_member==9

***************************************************   
**WARDID 7451124**
local WARDID 7451124
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74511241" if ward_id=="7451124" & sn_member==1

replace SN_hhid = "74511242" if ward_id=="7451124" & sn_member==2

replace SN_hhid = "74511243" if inlist(hhid,"74511246") & sn_member==3

replace SN_hhid = "74511244" if inlist(hhid,"745112413","745112415","74511248","74511247","745112410","745112412") & sn_member==4

**UNSURE MATCH**
replace SN_hhid = "74511244" & unsure_match = 1 if inlist(hhid,"74511244","74511246","745112414") & sn_member==4
****

replace SN_hhid = "74511246" if ward_id=="7451124" & sn_member==6

replace SN_hhid = "74511247" if ward_id=="7451124" & sn_member==7

replace SN_hhid = "74511248" if ward_id=="7451124" & sn_member==8

replace SN_hhid = "74511249" if inlist(hhid,"74511245") & sn_member==9

***************************************************   
**WARDID 7451165**
local WARDID 7451165
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74511652" if ward_id=="7451165" & sn_member==2

replace SN_hhid = "74511653" if ward_id=="7451165" & sn_member==3

replace SN_hhid = "74511655" if inlist(hhid,"74511655") & sn_member==5

replace SN_hhid = "74511656" if inlist(hhid,"74511651") & sn_member==6

replace SN_hhid = "74511654" if inlist(hhid,"74511654") & sn_member==7

replace SN_hhid = "74511658" if ward_id=="7451165" & sn_member==8

replace SN_hhid = "74511659" if ward_id=="7451165" & sn_member==9

***************************************************   
**WARDID 7461139**
local WARDID 7461139
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74611392" if inlist(hhid,"746113911") & sn_member==2

replace SN_hhid = "74611394" if inlist(hhid,"746113910") & sn_member==4

replace SN_hhid = "74611395" if ward_id=="7461139" & sn_member==5

replace no_match = 1 if inlist(hhid,"746113914") & sn_member==7

replace no_match = 1 if inlist(hhid,"746113914") & sn_member==8

replace SN_hhid = "74611397" if inlist(hhid,"74611396") & sn_member==7

replace SN_hhid = "74611398" if inlist(hhid,"74611399","74611391","74611392","74611394") & sn_member==8

**UNSURE MATCH**
replace SN_hhid = "746113911" & unsure_match = 1 if inlist(hhid,"746113913",") & sn_member==8
replace SN_hhid = "746113911" & unsure_match = 1 if inlist(hhid,"746113912",") & sn_member==9
****

replace SN_hhid = "74611399" if inlist(hhid,"74611395","74611393","74611394","74611396","74611391","74611399","74611392","74611397") & sn_member==9

***************************************************   
**WARDID 7461182**
local WARDID 7461182 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74611821" if ward_id=="7461182" & sn_member==1

replace SN_hhid = "74611822" if inlist(hhid,"74611825") & sn_member==2

replace SN_hhid = "74611824" if ward_id=="7461182" & sn_member==4

replace SN_hhid = "74611826" if inlist(hhid,"74611825") & sn_member==6

replace SN_hhid = "74611827" if inlist(hhid,"74611825","74611828") & sn_member==7

replace SN_hhid = "74611829" if ward_id=="7461182" & sn_member==9

***************************************************   
**WARDID 7461222**
local WARDID 7461222
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74612223" if inlist(hhid,"74612229") & sn_member==3

replace SN_hhid = "74612224" if inlist(hhid,"74612223") & sn_member==4

replace SN_hhid = "74612225" if inlist(hhid,"746122214","74612222") & sn_member==5

replace SN_hhid = "74612227" if inlist(hhid,"74612222") & sn_member==7

replace SN_hhid = "746122210" if ward_id=="7461222" & sn_member==8

replace SN_hhid = "74612229" if ward_id=="7461222" & sn_member==9

***************************************************   
**WARDID 7471145**
local WARDID 7471145
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74711452" if ward_id=="7471145" & sn_member==2

replace SN_hhid = "74711453" if ward_id=="7471145" & sn_member==3

replace SN_hhid = "74711454" if inlist(hhid,"74711454") & sn_member==4

replace SN_hhid = "74711456" if ward_id=="7471145" & sn_member==6

replace SN_hhid = "74711457" if ward_id=="7471145" & sn_member==7

replace SN_hhid = "74711458" if ward_id=="7471145" & sn_member==8

***************************************************   
**WARDID 7471197**
local WARDID 7471197
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74711972" if inlist(hhid,"747119710") & sn_member==2

replace SN_hhid = "74711973" if inlist(hhid,"747119710") & sn_member==3

replace SN_hhid = "74711977" if inlist(hhid,"74711971") & sn_member==7

***************************************************   
**WARDID 7471212**
local WARDID 7471212
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74712121" if inlist(hhid,"74712128","747121213") & sn_member==1

replace SN_hhid = "74712121" if inlist(hhid,"747121211","74712123") & sn_member==3

replace SN_hhid = "74712125" if ward_id=="7471212" & sn_member==5

replace SN_hhid = "74712126" if ward_id=="7471212" & sn_member==6

replace SN_hhid = "74712127" if inlist(hhid,"74712124","74712121","74712122") & sn_member==7

replace SN_hhid = "74712129" if ward_id=="7471212" & sn_member==8

replace SN_hhid = "747121215" if inlist(hhid,"74712124") & sn_member==9

***************************************************   
**WARDID 7481154**
local WARDID 7481154
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74811542" if ward_id=="7481154" & sn_member==2

replace SN_hhid = "74811543" if ward_id=="7481154" & sn_member==3

replace SN_hhid = "74811545" if inlist(hhid,"74811546") & sn_member==5

replace SN_hhid = "74811546" if ward_id=="7481154" & sn_member==6

replace SN_hhid = "74811547" if inlist(hhid,"74811541") & sn_member==7

replace SN_hhid = "74811549" if inlist(hhid,"74811541","74811543") & sn_member==9

***************************************************   
**WARDID 7481178**
local WARDID 7481178
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74811781" if inlist(hhid,"74811782") & sn_member==1

replace SN_hhid = "74811782" if inlist(hhid,"74811783","74811784","74811786") & sn_member==2

replace SN_hhid = "74811783" if ward_id=="7481178" & sn_member==3

replace SN_hhid = "74811784" if inlist(hhid,"74811782","748117812","74811783","748117813","748117814","74811788","74811785","748117815") & sn_member==4

replace SN_hhid = "74811784" if inlist(hhid,"748117811") & sn_member==5

replace SN_hhid = "74811787" if inlist(hhid,"74811782","74811781","74811784","74811783") & sn_member==7

replace SN_hhid = "74811789" if ward_id=="7481178" & sn_member==9

***************************************************   
**WARDID 7481233**
local WARDID 7481233
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74812331" if ward_id=="7481233" & sn_member==1

replace SN_hhid = "74812332" if ward_id=="7481233" & sn_member==2

replace SN_hhid = "74812333" if inlist(hhid,"74812338") & sn_member==3

replace SN_hhid = "74812334" if inlist(hhid,"748123314","748123310","74812338") & sn_member==4

replace SN_hhid = "74812336" if ward_id=="7481233" & sn_member==6

replace SN_hhid = "74812337" if inlist(hhid,"74812331") & sn_member==7

replace SN_hhid = "74812338" if inlist(hhid,"74812337","74812336") & sn_member==8

replace SN_hhid = "74812339" if inlist(hhid,"748123313") & sn_member==9

***************************************************   
**WARDID 7491245**
local WARDID 7491245
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "74912452" if inlist(hhid,"749124513") & sn_member==2

**UNSURE MATCH**
replace SN_hhid = "74912453" if & unsure_match = 1 inlist(hhid,"749124515","74912454","74912457","749124514") & sn_member==3
****

replace SN_hhid = "74912454" if inlist(hhid,"74912451","749124510","749124513") & sn_member==4

replace SN_hhid = "74912455" if inlist(hhid,"74912456") & sn_member==4

replace SN_hhid = "74912455" if inlist(hhid,"749124514","74912459","74912455","749124515","749124512","74912454","74912457","74912458","749124513","74912452") & sn_member==5

replace no_match = 1 if inlist(hhid,"749124515","74912457","74912458","74912459") & sn_member==6

replace SN_hhid = "74912456" if inlist(hhid,"74912452","74912454","749124514","74912453","749124513","749124512") & sn_member==6

replace SN_hhid = "74912455" if inlist(hhid,"74912456") & sn_member==7

replace SN_hhid = "74912458" if ward_id=="7491245" & sn_member==8

***************************************************   
**WARDID 8501263**
local WARDID 8501263
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85012631" if inlist(hhid,"85012634") & sn_member==1

replace SN_hhid = "85012634" if inlist(hhid,"85012633") & sn_member==4

replace SN_hhid = "85012636" if inlist(hhid,"850126313","85012632","850126314") & sn_member==6

replace SN_hhid = "85012639" if ward_id=="8501263" & sn_member==7

replace SN_hhid = "85012638" if inlist(hhid,"850126313","850126314") & sn_member==8

***************************************************   
**WARDID 8501287**
local WARDID 8501287
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85012871" if ward_id=="8501287" & sn_member==1

replace SN_hhid = "85012872" if inlist(hhid,"85012877") & sn_member==2

replace SN_hhid = "85012873" if inlist(hhid,"85012872","850128714") & sn_member==3

replace SN_hhid = "85012875" if inlist(hhid,"85012876","850128715") & sn_member==5

replace SN_hhid = "85012877" if inlist(hhid,"850128715") & sn_member==8

replace SN_hhid = "850128715" if inlist(hhid,"850128714","85012872","85012876") & sn_member==9

***************************************************   
**WARDID 8501364**
local WARDID 8501364
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85013641" if ward_id=="8501364" & sn_member==1

replace SN_hhid = "85013642" if ward_id=="8501364" & sn_member==2

replace SN_hhid = "85013643" if ward_id=="8501364" & sn_member==3

replace SN_hhid = "85013645" if inlist(hhid,"85013648","85013647","85013649") & sn_member==5

replace SN_hhid = "85013646" if inlist(hhid,"850136410") & sn_member==5

replace SN_hhid = "85013646" if  ward_id=="8501364" & sn_member==6

**UNSURE MATCH**
replace SN_hhid = "850136411" & unsure_match = 1 if inlist(hhid,"85013642","85013643","850136415") & sn_member==7
replace SN_hhid = "850136411" & unsure_match = 1 if inlist(hhid,"85013645") & sn_member==8
****
replace SN_hhid = "85013645" if inlist(hhid,"850136410") & sn_member==8

replace SN_hhid = "85013648" if inlist(hhid,"85013648") & sn_member==8

replace SN_hhid = "85013647" if inlist(hhid,"850136415") & sn_member==9

replace SN_hhid = "850136413" if inlist(hhid,"850136414","850136412") & sn_member==9

**UNSURE MATCH**
replace SN_hhid = "85013649" & unsure_match = 1 if inlist(hhid,"85013644") & sn_member==9
****

***************************************************   
**WARDID 8511274**
local WARDID 8511274
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85112744" if  ward_id=="8511274" & sn_member==4

replace SN_hhid = "85112746" if  ward_id=="8511274" & sn_member==6

replace SN_hhid = "85112749" if inlist(hhid,"85112749") & sn_member==7

replace SN_hhid = "85112747" if inlist(hhid,"85112745","85112743","85112747") & sn_member==7

replace SN_hhid = "85112749" if inlist(hhid,"85112748") & sn_member==8

replace no_match = 1 if inlist(hhid,"85112741","85112747",") & sn_member==8

replace SN_hhid = "85112749" if inlist(hhid,"85112745","85112742","85112743","85112741","85112744") & sn_member==9

***************************************************   
**WARDID 8521298**
local WARDID 8521298
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85212982" if inlist(hhid,"85212983") & sn_member==2

replace SN_hhid = "85212983" if ward_id=="8521298" & sn_member==3

replace no_match = 1 if inlist(hhid,"85212988") & sn_member==4

replace SN_hhid = "85212985" if inlist(hhid,"852129811","852129812","852129810","85212982","852129814","85212983") & sn_member==5

replace SN_hhid = "85212986" if inlist(hhid,"852129811") & sn_member==6

replace SN_hhid = "85212989" if inlist(hhid,"852129813") & sn_member==8

replace SN_hhid = "852129812" if inlist(hhid,"852129813") & sn_member==9

***************************************************   
**WARDID 8521343**
local WARDID 8521343
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85213432" if inlist(hhid,"852134315") & sn_member==2

replace no_match = 1 if ward_id=="8521343" & sn_member==3

replace no_match = 1 if ward_id=="8521343" & sn_member==4

replace SN_hhid = "85213435" if inlist(hhid,"85213433") & sn_member==5

replace SN_hhid = "852134314" if inlist(hhid,"85213433") & sn_member==7

replace SN_hhid = "852134312" if inlist(hhid,"85213435","85213436") & sn_member==7

replace SN_hhid = "852134310" if inlist(hhid,"852134311","852134315","85213433") & sn_member==8

***************************************************   
**WARDID 8521356**
local WARDID 8521356
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85213561" if ward_id=="8521356" & sn_member==1

replace SN_hhid = "85213563" if ward_id=="8521356" & sn_member==3

replace SN_hhid = "85213564" if inlist(hhid,"852135615","852135611","85213566","85213561","85213568","852135614","852135610","85213569","85213564","85213565","85213567","85213563") & sn_member==4

replace SN_hhid = "85213564" if inlist(hhid,"852135613","85213562") & sn_member==6

replace SN_hhid = "85213569" if inlist(hhid,"85213567","85213561") & sn_member==7

replace SN_hhid = "852135613" if inlist(hhid,"852135614") & sn_member==7

replace SN_hhid = "85213567" if inlist(hhid,"852135612") & sn_member==7

replace SN_hhid = "85213563" if inlist(hhid,"852135610") & sn_member==8

replace SN_hhid = "85213569" if inlist(hhid,"85213563") & sn_member==9

replace SN_hhid = "852135612" if inlist(hhid,"85213567") & sn_member==9

***************************************************   
**WARDID 8531303**
local WARDID 8531303
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85313034" if ward_id=="8531303" & sn_member==4

**UNSURE MATCH**
replace SN_hhid = "853130310" & unsure_match = 1 if inlist(hhid,"853130314") & sn_member==7
****

replace SN_hhid = "853130315" if inlist(hhid,"853130313") & sn_member==9

***************************************************   
**WARDID 8531308**
local WARDID 8531308
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85313084" if ward_id=="8531308" & sn_member==4

**UNSURE MATCH**
replace SN_hhid = "85313085" & unsure_match = 1 if inlist(hhid,"85313089") & sn_member==5
****

replace no_match = 1 if ward_id=="8531308" & sn_member==7

replace SN_hhid = "853130810" if inlist(hhid,"853130811") & sn_member==7

replace no_match = 1 if inlist(hhid,"853130815") & sn_member==8

replace no_match = 1 if inlist(hhid,"85313082") & sn_member==9

replace no_match = 1 if inlist(hhid,"853130814") & sn_member==9

***************************************************   
**WARDID 8531324**
local WARDID 8531324
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85313241" if ward_id=="8531324" & sn_member==1

replace SN_hhid = "85313242" if inlist(hhid,"85313241") & sn_member==2

**UNSURE MATCH**
replace SN_hhid = "85313243" & unsure_match = 1 if inlist(hhid,"85313248") & sn_member==2
****

replace SN_hhid = "85313245" if ward_id=="8531324" & sn_member==5

replace SN_hhid = "85313246" if ward_id=="8531324" & sn_member==6

replace no_match = 1 if inlist(hhid,"853132410") & sn_member==8

replace SN_hhid = "853132411" if inlist(hhid,"85313248") & sn_member==8

replace SN_hhid = "853132410" if inlist(hhid,"85313246") & sn_member==9
   
replace SN_hhid = "853132411" if inlist(hhid,"85313249") & sn_member==9

***************************************************   
**WARDID 8541311**
local WARDID 8541311
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85413111" if ward_id=="8541311" & sn_member==1

replace SN_hhid = "85413111" if ward_id=="8541311" & sn_member==2

replace SN_hhid = "85413112" if inlist(hhid,"854131110") & sn_member==3

replace SN_hhid = "85413113" if inlist(hhid,"854131111","85413118","85413116","85413112","85413111") & sn_member==3

replace SN_hhid = "85413114" if inlist(hhid,"85413118") & sn_member==4

replace SN_hhid = "85413115" if inlist(hhid,"854131110","85413117") & sn_member==5

replace SN_hhid = "85413116" if inlist(hhid,"85413117","85413118") & sn_member==6

replace SN_hhid = "85413117" if inlist(hhid,"854131111","85413114","854131112","85413119","854131113","85413117","854131115") & sn_member==7

replace no_match = 1 if inlist(hhid,"85413115") & sn_member==7

replace SN_hhid = "85413116" if inlist(hhid,"85413116") & sn_member==8

replace SN_hhid = "85413118" if inlist(hhid,"854131110","85413119") & sn_member==8
   
replace SN_hhid = "854131113" if inlist(hhid,"85413111") & sn_member==9

replace SN_hhid = "85413118" if inlist(hhid,"85413116") & sn_member==9

***************************************************   
**WARDID 8541333**
local WARDID 8541333
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85413331" if inlist(hhid,"85413335","854133311") & sn_member==1

replace SN_hhid = "85413332" if inlist(hhid,"85413339") & sn_member==2

replace SN_hhid = "85413335" if ward_id=="8541333" & sn_member==5

replace SN_hhid = "85413336" if ward_id=="8541333" & sn_member==6

***************************************************   
**WARDID 8541335**
local WARDID 8541335
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "85413351" if inlist(hhid,"854133510") & sn_member==1

replace SN_hhid = "85413352" if inlist(hhid,"85413357") & sn_member==2

replace SN_hhid = "85413354" if inlist(hhid,"85413355") & sn_member==4

replace SN_hhid = "85413359" if inlist(hhid,"85413354") & sn_member==7

replace SN_hhid = "85413358" if inlist(hhid,"85413355") & sn_member==7

replace no_match = 1 if inlist(hhid,"854133511") & sn_member==7

replace SN_hhid = "854133515" if inlist(hhid,"85413356","854133514") & sn_member==8

replace SN_hhid = "854133513" if inlist(hhid,"854133513") & sn_member==8

replace SN_hhid = "85413358" if inlist(hhid,"85413351","854133510") & sn_member==8

replace SN_hhid = "854133515" if inlist(hhid,"854133514") & sn_member==8

replace SN_hhid = "854133515" if inlist(hhid,"85413353","854133512") & sn_member==9

replace no_match = 1 if inlist(hhid,"85413352") & sn_member==9
   
***************************************************   
**WARDID 9551375 **
local WARDID 9551375 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "95513751" if inlist(hhid,"95513757") & sn_member==1

replace SN_hhid = "95513752" if inlist(hhid,"95513758") & sn_member==2

replace SN_hhid = "95513753" if inlist(hhid,"95513755") & sn_member==3

replace SN_hhid = "95513754" if inlist(hhid,"95513751","955137511") & sn_member==4

replace SN_hhid = "95513755" if ward_id=="9551375" & sn_member==5

replace SN_hhid = "955137513" if inlist(hhid,"95513755") & sn_member==7

replace SN_hhid = "95513757" if inlist(hhid,"95513757","95513754","95513759") & sn_member==7

replace SN_hhid = "95513759" if inlist(hhid,"95513753") & sn_member==9

replace SN_hhid = "955137511" if inlist(hhid,"95513759") & sn_member==9

replace no_match = 1 if inlist(hhid,"955137512","955137515","95513752","955137511") & sn_member==9

***************************************************   
**WARDID 9551471**
local WARDID 9551471
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "95514711" if ward_id=="9551471" & sn_member==1

replace SN_hhid = "95514713" if ward_id=="9551471" & sn_member==3

replace SN_hhid = "95514716" if ward_id=="9551471" & sn_member==6

replace SN_hhid = "95514717" if inlist(hhid,"95514717","955147111","95514718","95514711","95514716") & sn_member==7

replace no_match = 1 if inlist(hhid,"955147114") & sn_member==7

replace no_match = 1 if inlist(hhid,"955147110","955147115","95514716","95514713") & sn_member==8

replace SN_hhid = "955147114" if inlist(hhid,"955147114") & sn_member==9

replace no_match = 1 if inlist(hhid,"95514717","95514718") & sn_member==9

replace SN_hhid = "955147110" if inlist(hhid,"95514713") & sn_member==9

***************************************************   
**WARDID 9551479**
local WARDID 9551479
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "95514791" if ward_id=="9551479" & sn_member==1

replace SN_hhid = "95514792" if ward_id=="9551479" & sn_member==2

replace SN_hhid = "95514795" if ward_id=="9551479" & sn_member==5

replace no_match = 1 if inlist(hhid,"955147913") & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "955147911" & unsure_match = 1 if inlist(hhid,"95514794","955147910") & sn_member==8
****

replace SN_hhid = "955147913" if inlist(hhid,"955147913") & sn_member==8

***************************************************   
**WARDID 9561384**
local WARDID 9561384
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "95613841" if ward_id=="9561384" & sn_member==1

replace SN_hhid = "95613843" if ward_id=="9561384" & sn_member==3

replace SN_hhid = "95613844" if ward_id=="9561384" & sn_member==4

replace SN_hhid = "95613845" if ward_id=="9561384" & sn_member==5

replace SN_hhid = "956138410" if inlist(hhid,"95613844","956138410","95613845") & sn_member==7

replace SN_hhid = "95613843" if inlist(hhid,"956138415","956138414","956138413","95613843") & sn_member==7

replace SN_hhid = "95613848" if inlist(hhid,"95613848") & sn_member==8

replace SN_hhid = "956138414" if inlist(hhid,"95613843") & sn_member==9

***************************************************   
**WARDID 9571392**
local WARDID 9571392
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "95713923" if ward_id=="9571392" & sn_member==3

replace SN_hhid = "95713924" if ward_id=="9571392" & sn_member==4

replace SN_hhid = "95713925" if ward_id=="9571392" & sn_member==5

**UNSURE MATCH**
replace SN_hhid = "95713928" & unsure_match = 1 if inlist(hhid,"95713928") & sn_member==8
****

replace SN_hhid = "957139211" if inlist(hhid,"957139211") & sn_member==8

replace no_match = 1 if inlist(hhid,"95713922") & sn_member==9

replace SN_hhid = "957139213" if inlist(hhid,"957139210","95713925","957139212") & sn_member==9

***************************************************   
**WARDID 9581408**
local WARDID 9581408
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "95814081" if ward_id=="9581408" & sn_member==1

replace SN_hhid = "95814082" if ward_id=="9581408" & sn_member==2

replace SN_hhid = "95814083" if ward_id=="9581408" & sn_member==3

replace SN_hhid = "95814084" if ward_id=="9581408" & sn_member==4

replace SN_hhid = "95814085" if ward_id=="9581408" & sn_member==5

replace SN_hhid = "95814086" if ward_id=="9581408" & sn_member==6

replace SN_hhid = "95814089" if inlist(hhid,"958140810") & sn_member==7

replace SN_hhid = "95814088" if inlist(hhid,"95814088") & sn_member==8

replace SN_hhid = "95814088" if inlist(hhid,"95814083","95814089","95814086") & sn_member==9

replace no_match = 1 if inlist(hhid,"958140810") & sn_member==9

***************************************************   
**WARDID 9591414**
local WARDID 9591414
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "95914141" if inlist(hhid,"95914144","95914144") & sn_member==1

replace SN_hhid = "95914143" if ward_id=="9591414" & sn_member==3

replace SN_hhid = "95914145" if ward_id=="9591414" & sn_member==5

replace SN_hhid = "95914146" if ward_id=="9591414" & sn_member==6

**UNSURE MATCH**
replace SN_hhid = "95914147" & unsure_match = 1 if inlist(hhid,"95914144","95914149","95914141") & sn_member==7
replace SN_hhid = "95914147" & unsure_match = 1 if inlist(hhid,"959141411") & sn_member==9
replace SN_hhid = "95914149" & unsure_match = 1 if inlist(hhid,"95914142","95914148","95914147") & sn_member==7
****

replace SN_hhid = "959141413" if inlist(hhid,"959141414","959141410") & sn_member==7

replace SN_hhid = "959141414" if inlist(hhid,"95914141","959141413","95914145","959141415","95914143","959141410","95914149","95914144") & sn_member==8

replace SN_hhid = "959141414" if inlist(hhid,"959141412") & sn_member==9

replace SN_hhid = "95914148" if inlist(hhid,"95914147") & sn_member==9

**UNSURE MATCH**
replace SN_hhid = "95914149" & unsure_match = 1 if inlist(hhid,"959141411") & sn_member==9
****

***************************************************   
**WARDID 9591416**
local WARDID 9591416
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "95914164" if inlist(hhid,"95914169") & sn_member==4

replace no_match = 1 if ward_id=="9591416" & sn_member==5

replace SN_hhid = "95914166" if ward_id=="9591416" & sn_member==6

replace SN_hhid = "95914167" if inlist(hhid,"95914166") & sn_member==7

replace SN_hhid = "95914167" if inlist(hhid,"95914167","95914168") & sn_member==8

**UNSURE MATCH**
replace SN_hhid = "959141612" & unsure_match = 1 if inlist(hhid,"959141612",") & sn_member==7
replace SN_hhid = "959141612" & unsure_match = 1 if inlist(hhid,"959141613",") & sn_member==8
****

replace SN_hhid = "959141612" if inlist(hhid,"95914163","95914162") & sn_member==8

replace SN_hhid = "959141610" if inlist(hhid,"95914169") & sn_member==8

replace SN_hhid = "95914167" if inlist(hhid,"95914167","95914168") & sn_member==8

***************************************************   
**WARDID 9591506**
local WARDID 9591506
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "95915061" if ward_id=="9591506" & sn_member==1

replace SN_hhid = "95915062" if ward_id=="9591506" & sn_member==2

replace SN_hhid = "95915063" if ward_id=="9591506" & sn_member==3

replace SN_hhid = "95915066" if ward_id=="9591506" & sn_member==6

replace SN_hhid = "959141614" if inlist(hhid,"95915065","959150613") & sn_member==7

replace no_match = 1 if inlist(hhid,"95915063") & sn_member==7

replace SN_hhid = "95915068" if inlist(hhid,"95915067","95915061","95915068") & sn_member==8

replace no_match = 1 if inlist(hhid,"959150612","95915069") & sn_member==7

replace no_match = 1 if inlist(hhid,"95915064","959150610","95915063") & sn_member==8

replace no_match = 1 if inlist(hhid,"95915061","95915067","95915062","95915068") & sn_member==9

***************************************************   
**WARDID 9601424**
local WARDID 9601424
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "96014241" if ward_id=="9601424" & sn_member==1

replace SN_hhid = "96014242" if ward_id=="9601424" & sn_member==2

replace SN_hhid = "96014243" if ward_id=="9601424" & sn_member==3

replace SN_hhid = "96014244" if ward_id=="9601424" & sn_member==4

replace SN_hhid = "96014245" if ward_id=="9601424" & sn_member==5

replace SN_hhid = "96014246" if ward_id=="9601424" & sn_member==6

replace SN_hhid = "96014247" if ward_id=="9601424" & sn_member==7

replace SN_hhid = "96014241" if inlist(hhid,"96014245","96014243","96014244","960142411") & sn_member==8

replace SN_hhid = "96014248" if inlist(hhid,"960142410","96014249") & sn_member==8

replace SN_hhid = "96014248" if inlist(hhid,"960142415","96014243","96014247","96014248") & sn_member==9

replace SN_hhid = "96014249" if inlist(hhid,"96014242","96014246") & sn_member==9

***************************************************   
**WARDID 9601425**
local WARDID 9601425 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "96014251" if ward_id=="9601425" & sn_member==1

replace SN_hhid = "96014252" if ward_id=="9601425" & sn_member==2

replace SN_hhid = "96014254" if ward_id=="9601425" & sn_member==3

replace SN_hhid = "96014253" if ward_id=="9601425" & sn_member==4

replace SN_hhid = "96014255" if inlist(hhid,"960142510") & sn_member==5

replace SN_hhid = "960142513" if ward_id=="9601425" & sn_member==6

replace SN_hhid = "96014257" if inlist(hhid,"96014252","96014255") & sn_member==7

replace SN_hhid = "96014258" if inlist(hhid,"960142511") & sn_member==7

replace SN_hhid = "960142513" if inlist(hhid,"960142514") & sn_member==7

replace SN_hhid = "96014251" if inlist(hhid,"960142510","960142515") & sn_member==7

replace SN_hhid = "960142511" if inlist(hhid,"960142512") & sn_member==8

replace SN_hhid = "960142514" if inlist(hhid,"96014253","96014256","960142513") & sn_member==8

replace SN_hhid = "960142512" if inlist(hhid,"960142511","96014251") & sn_member==8

replace SN_hhid = "960142511" if inlist(hhid,"96014253","96014256","96014251","96014258","96014257","960142513","96014255") & sn_member==9

***************************************************   
**WARDID 9601451**
local WARDID 9601451 
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "96014511" if ward_id=="9601451" & sn_member==1

replace SN_hhid = "96014515" if ward_id=="9601451" & sn_member==5

replace SN_hhid = "96014516" if ward_id=="9601451" & sn_member==6

replace no_match = 1 if nlist(hhid,"96014516","960145113","96014515",") & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "960145111" & unsure_match = 1 if inlist(hhid,"960145112") & sn_member==7
****

replace SN_hhid = "960145113" if inlist(hhid,"960145113","96014515","96014516") & sn_member==7

replace no_match = 1 if inlist(hhid,"960145110") & sn_member==7

replace SN_hhid = "960145114" if inlist(hhid,"960145114","960145111","96014513") & sn_member==8

replace SN_hhid = "960145112" if inlist(hhid,"96014512") & sn_member==8

replace SN_hhid = "960145115" if inlist(hhid,"96014518","96014517") & sn_member==9

replace no_match = 1 if inlist(hhid,"960145111","96014514","96014519","960145111") & sn_member==9

replace SN_hhid = "960145111" if inlist(hhid,"96014513") & sn_member==9

replace SN_hhid = "960145112" if inlist(hhid,"960145114") & sn_member==9

***************************************************   
**WARDID 9611438**
local WARDID 9611438
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "96114381" if inlist(hhid,"9611438") & sn_member==1

replace SN_hhid = "96114382" if inlist(hhid,"9611438") & sn_member==2

replace SN_hhid = "96114383" if inlist(hhid,"9611438") & sn_member==3

replace SN_hhid = "96114384" if inlist(hhid,"9611438") & sn_member==4

replace SN_hhid = "96114386" if inlist(hhid,"96114385") & sn_member==6

replace SN_hhid = "961143813" if inlist(hhid,"961143813","961143815","961143814") & sn_member==7

replace SN_hhid = "96114389" if inlist(hhid,"96114382") & sn_member==7

replace no_match = 1 if inlist(hhid,"96114384") & sn_member==8

replace SN_hhid = "961143815" if inlist(hhid,"961143813") & sn_member==9

***************************************************   
**WARDID 9611483**
local WARDID 9611483
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "96114382" if inlist(hhid,"961143833") & sn_member==2

replace SN_hhid = "96114384" if inlist(hhid,"9611438315") & sn_member==4

replace SN_hhid = "96114385" if ward_id=="9611483" & sn_member==5

replace SN_hhid = "96114386" if ward_id=="9611483" & sn_member==6

replace SN_hhid = "96114836" if inlist(hhid,"961148310") & sn_member==7

replace SN_hhid = "96114838" if inlist(hhid,"96114837") & sn_member==9

replace SN_hhid = "961148311" if inlist(hhid,"96114833") & sn_member==9

***************************************************   
**WARDID 9611489**
local WARDID 9611489
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "96114891" if ward_id=="9611489" & sn_member==1

replace SN_hhid = "96114893" if ward_id=="9611489" & sn_member==3

replace SN_hhid = "96114895" if ward_id=="9611489" & sn_member==5

replace SN_hhid = "961148914" if ward_id=="9611489" & sn_member==6

replace SN_hhid = "961148911" if inlist(hhid,"96114892","961148911") & sn_member==7

replace SN_hhid = "961148912" if inlist(hhid,"96114892","961148911") & sn_member==8

replace SN_hhid = "961148910" if inlist(hhid,"96114899","96114891") & sn_member==8

replace SN_hhid = "96114898" if inlist(hhid,"96114891","96114897","96114899","96114898","96114896") & sn_member==9

replace SN_hhid = "961148911" if inlist(hhid,"96114894") & sn_member==9

***************************************************   
**WARDID 9621443**
local WARDID 9621443
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "96214431" if ward_id=="9621443" & sn_member==1

replace SN_hhid = "96214432" if ward_id=="9621443" & sn_member==2

replace SN_hhid = "96214433" if ward_id=="9621443" & sn_member==3

replace SN_hhid = "96214434" if ward_id=="9621443" & sn_member==4

replace SN_hhid = "96214435" if ward_id=="9621443" & sn_member==5

replace SN_hhid = "96214439" if inlist(hhid,"962144312","962144313") & sn_member==7

replace SN_hhid = "96214439" if inlist(hhid,"962144314","96214436") & sn_member==8

replace SN_hhid = "962144311" if inlist(hhid,"962144313","962144311") & sn_member==8

replace SN_hhid = "962144310" if inlist(hhid,"96214435") & sn_member==8

replace no_match = 1 if inlist(hhid,"96214437") & sn_member==9

replace SN_hhid = "962144312" if inlist(hhid,"96214432") & sn_member==9

replace SN_hhid = "962144310" if inlist(hhid,"962144310") & sn_member==9

replace SN_hhid = "96214439" if inlist(hhid,"96214438") & sn_member==9

***************************************************   
**WARDID 9621467**
local WARDID 9621467
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "96214672" if ward_id=="9621467" & sn_member==2

replace SN_hhid = "96214673" if ward_id=="9621467" & sn_member==3

replace SN_hhid = "96214674" if ward_id=="9621467" & sn_member==4

replace SN_hhid = "96214676" if ward_id=="9621467" & sn_member==6

replace SN_hhid = "962146711" if inlist(hhid,"96214672","96214672") & sn_member==7

replace SN_hhid = "962146714" if inlist(hhid,"96214679") & sn_member==7

replace no_match = 1 if inlist(hhid,"96214678") & sn_member==7

replace no_match = 1 if inlist(hhid,"962146710") & sn_member==8

replace SN_hhid = "962146710" if inlist(hhid,"96214679") & sn_member==8

**UNSURE MATCH**
replace SN_hhid = "96214678" & unsure_match = 1 if inlist(hhid,"96214675","96214677") & sn_member==9
****

replace SN_hhid = "962146714" if inlist(hhid,"962146710","96214672","96214676","962146715") & sn_member==9

***************************************************   
**WARDID 9631494**
local WARDID 9631494
br if ward_id == "`WARDID'" 
sort sn_member

replace SN_hhid = "96314942" if inlist(hhid,"963149412") & sn_member==2

replace SN_hhid = "96314943" if inlist(hhid,"96314946","963149410") & sn_member==3

replace SN_hhid = "96314944" if ward_id=="9631494" & sn_member==4

replace SN_hhid = "96314945" if inlist(hhid,"963149414") & sn_member==5

replace SN_hhid = "96314946" if ward_id=="9631494" & sn_member==6

replace SN_hhid = "96314947" if inlist(hhid,"96314943") & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "963149411" & unsure_match = 1 if inlist(hhid,"96314943") & sn_member==9
****








































































































































































































































































































































































































































































































































