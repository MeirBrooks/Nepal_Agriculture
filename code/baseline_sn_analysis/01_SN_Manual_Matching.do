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

replace SN_hhid = "02272" if ward_id=="0227" & sn_member==2

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
























 






































