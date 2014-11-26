/*****************************************************************
PROJECT: 	NEPAL AGRICULTURE - ICIMOD
PURPOSE: 	MANUAL MATCHING PROGRAM TO BE INCLUDED IN 
			00_SN_CLEANING.DO.  
			
AUTHORS: 	SAMPADA KC (YALE)
			DEREK WOLFSON (IPA)
			
NOTES: 		THIS CODE PREPARES ALL NAMES IN THE SOCIAL NETWORK 
			SECTION (M) TO MATCH THE NAMES PROVIDED IN THE 
			BASELINE SURVEY.  THIS WILL ALLOW US TO MATCH SN HHH
			NAMES TO HHIDS. 
*******************************************************************/

*************************************************
* STEP 1: UPPER-CASE ALL NAMES					*
*************************************************
replace a12 = upper(a12)
forv i=1/9{
	replace m00_`i'=upper(m00_`i')
}

/****************************************
				SAMPLE CODE
*****************************************
//WARD ####
local WARD ####
br a10 a08 a12 m00_* if ward_id=="`WARD'"
	*SN01*
	replace m00_1="" if m00_1=="" & ward_id=="`WARD'"
	
	*SN02*
	*replace m00_2="" if ward_id=="`WARD'"
	
	*SN03*
	*replace m00_3="" if ward_id=="`WARD'"
	
	*SN04*
	*replace m00_4="" if ward_id=="`WARD'"
	
	*SN05*
	*replace m00_5="" if ward_id=="`WARD'"
	
	*SN06*
	*replace m00_6="" if ward_id=="`WARD'"
	
	*SN07*
	*replace m00_7="" if ward_id=="`WARD'"
	
	*SN08*
	*replace m00_8="" if ward_id=="`WARD'"
	
	*SN09*
	*replace m00_9="" if ward_id=="`WARD'"
************************************************/

//WARD 02125
local WARD 02125
br a10 a08 a12 m00_* if ward_id=="`WARD'"
	*SN01*
	replace m00_1="RAJESHWORI JOSHI" if m00_1=="RAJESHWARI" & ward_id=="`WARD'"
	//LAXMI JOSHI = RAJESHWORI JOSHI?
	*SN02*
	replace m00_2="AATMADEV JOSHI" if ward_id=="`WARD'"
	
	*SN03*
	replace m00_3="MADAN JOSHI" if ward_id=="`WARD'"
	
	*SN04*
	replace m00_4="DURGE BHUL" if m00_4=="DURGA BHUL" & ward_id=="`WARD'"
	
	*SN05*
	*replace m00_5="" if ward_id=="`WARD'"
	
	*SN06*
	replace m00_6="LAL SINGH BHUL" if ward_id=="`WARD'"
	
	*SN07*
	replace m00_7="CHANDRA DEV JOHSI" if m00_7=="CHANDRA DEV" & ward_id=="`WARD'"
	replace m00_7="KESHAV BHUL" if m00_7=="KESHAB BHUL" & ward_id=="`WARD'"
	replace m00_7="DHANI BHUL" if m00_7=="DHANE BHUL" & ward_id=="`WARD'"
	replace m00_7="KAUSHA BHUL" if m00_7=="KAUSA BHUL" & ward_id=="`WARD'"
	
	*SN08*
	*replace m00_8="CHANDRA DEV JOSHI" if (m00_8="CHANDREV" | m00_8="CHANDARA DEV JOSHI")  &  ward_id=="`WARD'"
	
	*SN09*
	*replace m00_9="" if ward_id=="`WARD'"

