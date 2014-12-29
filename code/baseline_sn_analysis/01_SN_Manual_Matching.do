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

replace SN_hhid  = "0212510" if inlist(hhid, "021251") & sn_member==9

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

replace no_match =1 if inlist(hhid,"11018412") & sn_member==8

replace no_match =1 if inlist(hhid,"1101849") & sn_member==9

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

replace no_match =1 if inlist(hhid,"1102531") & sn_member==9

***************************************************
**WARDID 111204**
local WARDID 111204 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "1112041" if ward_id=="111204" & sn_member==1

replace SN_hhid = "1112042" if ward_id=="111204" & sn_member==2

replace SN_hhid = "1112043" if inlist(hhid,"11120411","11120412","11120414",11120415","1112044","1112046") & sn_member==3

replace SN_hhid = "1112044" if inlist(hhid,"11120414","11120415") & sn_member==4

replace no_match =1 if inlist(hhid,"1112044") & sn_member==4

replace no_match =1 if inlist(hhid,"1112043","11120413","1112047","1112048","11120415","1112046","11120410","1112042") & sn_member==5

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

replace no_match =1 if inlist(hhid,"1112046") & sn_member==8

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














































































 






































