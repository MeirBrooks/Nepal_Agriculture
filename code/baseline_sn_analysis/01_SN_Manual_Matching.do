/*****************************************************************
PROJECT: 	NEPAL AGRICULTURE - ICIMOD
PURPOSE: 	MANUAL MATCHING PROGRAM TO BE INCLUDED IN 
			00_SN_CLEANING.DO.  
			
AUTHORS: 	SAMPADA KC (YALE)
			DEREK WOLFSON (IPA)
			
NOTES: 		THIS CODE CLEANS UP THE FUZZY MERGE
*******************************************************************/

gen no_match= 0

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

**UNSURE MATCH **
replace SN_hhid = "021251" if inlist(hhid,"0212515","021252","0212511","0212514","021254") & sn_member==1 
****   

replace SN_hhid = "021253" if inlist(hhid,"0212511","021252","021255") & sn_member==3 

replace SN_hhid = "021254" if inlist(hhid,"0212514","021255","021254","0212515","021253",""021251","021252") & sn_member==4

replace no_match = 1 if inlist(hhid, "021252","0212511") & sn_member==5

replace SN_hhid = "021255" if inlist(hhid,"0212515") & sn_member==5

replace SN_hhid = "021256" if inlist(hhid,"021251","021257","0212510") & sn_member==6

replace SN_hhid = "0212512" if inlist(hhid,"021259") & sn_member==7

replace SN_hhid = "021258" if inlist(hhid,"021257","021253","0212510") & sn_member==8

**UNSURE MATCH**
replace SN_hhid = "0212511" if inlist(hhid,"0212512","021255") & sn_member==8
replace SN_hhid = "0212511" if inlist(hhid,"021252") & sn_member==9
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
replace SN_hhid = "031115" if inlist(hhid,"0311112") & sn_member==5
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
replace SN_hhid = "034613" if inlist(hhid,"03466") & sn_member==7
****

***************************************************
**WARDID 0349 **
local WARDID 0349 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "03491" if inlist(hhid,"034915","03498","03497") & sn_member==1

replace SN_hhid = "03492" if inlist(hhid,"03491") & sn_member==2

replace SN_hhid = "03493" if inlist(hhid,"03497","03498","03499") & sn_member==3

replace SN_hhid = "03494" if inlist(hhid,"03492","03493","034914") & sn_member==4

**UNSURE MATCH**
replace SN_hhid = "03494" if inlist(hhid,"03499","034911","03497","03498") & sn_member==4
replace SN_hhid = "03495" if inlist(hhid,"03497","03492","034911","03498","03491") & sn_member==5
replace SN_hhid = "03496" if inlist(hhid,"03498") & sn_member==6
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
**WARDID 0489 **
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
replace SN_hhid = "1102419" if inlist(hhid,"1102417","1102412") & sn_member==8
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
replace SN_hhid = "11120411" if inlist(hhid,"1112044") & sn_member==8
replace SN_hhid = "11120411" if inlist(hhid,"11120412","11120411") & sn_member==9
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
replace SN_hhid = "1112649" if inlist(hhid,"11126414") & sn_member==9

***************************************************
**WARDID 111274**
local WARDID 111274
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1112742" if inlist(hhid,"1112748") & sn_member==2

replace SN_hhid = "1112746" if inlist(hhid,"1112747") & sn_member==6

replace SN_hhid = "1112749" if inlist(hhid,"1112743","1112742") & sn_member==8 

***************************************************
**WARDID 112214 **
local WARDID 112214 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1122143" if ward_id=="112214" & sn_member==3

replace SN_hhid = "1122145" if inlist(hhid,"1122141") & sn_member==5

replace SN_hhid = "1122146" if inlist(hhid,"1122144","1122142") & sn_member==6

replace SN_hhid = "11221411" if inlist(hhid,"1122141") & sn_member==7

**UNSURE MATCH**
replace SN_hhid = "11221410" if inlist(hhid,"1122143") & sn_member==7
****

replace SN_hhid = "11221412" if inlist(hhid,"1122144") & sn_member==8

replace SN_hhid = "11221410" if inlist(hhid,"11221412") & sn_member==8 

replace SN_hhid = "11221411" if inlist(hhid,"11221411") & sn_member==8  

replace SN_hhid = "1122148" if inlist(hhid,"1122148") & sn_member==8  

replace SN_hhid = "1122149" if inlist(hhid,"11221410","1122147","1122149") & sn_member==9
 
replace no_match =1 if inlist(hhid,"1122149") & sn_member==9

***************************************************   
**WARDID 112231  **
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
**WARDID 17138 **
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
replace SN_hhid = "172819" if inlist(hhid,"172819") & sn_member==7
replace SN_hhid = "1728114" if inlist(hhid,"172815") & sn_member==7
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
replace SN_hhid = "182947" if inlist(hhid,"182946") & sn_member==8
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
replace SN_hhid = "191629" if inlist(hhid,"191627","191628") & sn_member==9
****

replace SN_hhid = "1916212" if inlist(hhid,"1916211") & sn_member==9

replace SN_hhid = "1916211" if inlist(hhid,"1916214") & sn_member==9

***************************************************   
**WARDID 19178 **
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
replace SN_hhid = "1917812" if inlist(hhid,"191782") & sn_member==7
replace SN_hhid = "1917811" if inlist(hhid,"191782") & sn_member==8
replace SN_hhid = "1917812" if inlist(hhid,"1917811") & sn_member==8
replace SN_hhid = "1917811" if inlist(hhid,"191786") & sn_member==9
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
replace SN_hhid = "1919914" if inlist(hhid,"191992","191996","1919912","191994") & sn_member==7
replace SN_hhid = "1919914" if inlist(hhid,"191997","191991","191993") & sn_member==8 
replace SN_hhid = "191999" if inlist(hhid,"1919915","191996") & sn_member==8
replace SN_hhid = "191999" if inlist(hhid,"191998") & sn_member==9
replace SN_hhid = "1919914" if inlist(hhid,"1919912","191994") & sn_member==9
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
**WARDID 214352 **
local WARDID 214352 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "2143522" if inlist(hhid,"21435212","21435215") & sn_member==2

replace SN_hhid = "2143528" if inlist(hhid,"21435210","2143528","21435214") & sn_member==8

replace SN_hhid = "2143529" if inlist(hhid,"21435210") & sn_member==9

***************************************************   
**WARDID 214369 **
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
replace SN_hhid = "2164123" if inlist(hhid,"2164126") & sn_member==3
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
replace SN_hhid = "3215342" if inlist(hhid,"3215345","32153412","32153413","32153410") & sn_member==3
replace SN_hhid = "3215343" if inlist(hhid,"32153414") & sn_member==3
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
replace SN_hhid = "3234987" if inlist(hhid,"32349810","32349811") & sn_member==7
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
replace SN_hhid = "4256038" if m00_ == "BHOJ BAHADUR CHAND"
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
replace SN_hhid = "4256646" if inlist(hhid,"4256647") & sn_member==6
replace SN_hhid = "4256647" if inlist(hhid,"4256643","42566415") & sn_member==7
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
replace SN_hhid = "4257486" if inlist(hhid,"4257482","4257485","4257487","42574812","42574811","4257483","4257484","42574810") & sn_member==6
replace SN_hhid = "4257488" if inlist(hhid,"4257484") & sn_member==8

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
replace SN_hhid = "4276968" if inlist(hhid,"42769614") & sn_member==7
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
replace SN_hhid = "4286576" if inlist(hhid,"42865712","42865713","4286579","4286578") & sn_member==6
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
replace SN_hhid = "4296442" if inlist(hhid,"4296448") & sn_member==2
replace SN_hhid = "4296444" if inlist(hhid,"4296448") & sn_member==4
replace SN_hhid = "4296445" if inlist(hhid,"4296442") & sn_member==5
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
**WARDID 429674**
local WARDID 429674
br if ward_id == "`WARDID'" 
sort sn_member







