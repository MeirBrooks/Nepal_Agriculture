/*****************************************************************
PROJECT: 	NEPAL AGRICULTURE - ICIMOD
PURPOSE: 	MANUAL MATCHING PROGRAM TO BE INCLUDED IN 
			00_SN_CLEANING.DO.  
			
AUTHORS: 	SAMPADA KC (YALE)
			DEREK WOLFSON (IPA)
			
NOTES: 		THIS CODE CLEANS UP THE FUZZY MERGE
*******************************************************************/

local WARDID 0111
br if ward_id == "`WARDID'"
sort sn_member 

replace SN_hhid = "011110" if inlist(hhid, "011110") & sn_member==1

replace SN_hhid = "01112" if inlist(hhid,"01118") & sn_member==2

replace SN_hhid = "01113" if ward_id=="0111" & sn_member==3

replace SN_hhid = "01114" if ward_id=="0111" & sn_member==4 

replace SN_hhid = "01115" if ward_id=="0111" & sn_member==5

replace SN_hhid = "01116" if ward_id=="0111" & sn_member==6

gen no_match= 0

replace count = 1 if SN_hhid== "01119" & sn_member==7

replace SN_hhid = "01117" if inlist(hhid,"01114","01113","01111") & sn_member==7
 
replace no_match = 1 if SN_hhid== "011112" & sn_member==8

replace no_match = 1 if SN_hhid== "01119" & sn_member==8


replace SN_hhid = "01118" if inlist(hhid,"01119") & sn_member==8

replace no_match = 1 if SN_hhid== "011112" & sn_member==9

replace no_match = 1 if SN_hhid== "01119" & sn_member==9

replace SN_hhid = "011115" if inlist(hhid,"01112") & sn_member==9

local WARDID 02125 
br if ward_id == "`WARDID'" 
sort sn_member 

replace SN_hhid = "021251" if inlist(hhid,"021251", "021258","021259" ) & sn_member==1 

**UNSURE MATCH **
replace SN_hhid = "021251" if inlist(hhid,"021254", "0212511","0212515","021252","0212514") & sn_member==1    


replace SN_hhid = "021253" if inlist(hhid,"021252","0212511","021255" ) & sn_member==3 

replace SN_hhid = "021254" if inlist(hhid,"021253","0212514","021255", "021251","021252", "021254") & sn_member==4

replace SN_hhid = "021255" if inlist(hhid,"0212515","0212511","021255" ) & sn_member==3  

replace no_match = 1 if inlist(hhid, "0212511","021252") & sn_member==5

replace SN_hhid = "021256" if inlist(hhid,"021257", "021251","0212510" ) & sn_member==6

replace SN_hhid = "0212512" if inlist(hhid,"021259" ) & sn_member==6

replace SN_hhid = "0212513" if inlist(hhid,"0212515" ) & sn_member==7 

replace no_match = 1 if inlist(hhid, "021251") & sn_member==7

replace no_match = 1 if inlist(hhid, "0212510","021257") & sn_member==8

replace SN_hhid = "021258" if inlist(hhid,"021253" ) & sn_member==8

replace no_match = 1 if inlist(hhid, "021251") & sn_member==9

replace no_match = 1 if inlist(hhid, "021252") & sn_member==9





















