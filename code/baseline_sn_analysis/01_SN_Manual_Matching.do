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

replace SN_hhid = "01112" if inlist(hhid,"01118") & sn_member==2

replace SN_hhid = "01113" if ward_id=="0111" & sn_member==3

replace SN_hhid = "01113" if inlist(hhid,"011111","011112") & sn_member==3

replace SN_hhid = "01114" if ward_id=="0111" & sn_member==4 

