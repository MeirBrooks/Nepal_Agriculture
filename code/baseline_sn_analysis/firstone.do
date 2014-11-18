/****************************************
PROJECT: NEPAL AG - ICIMOD
*****************************************/
clear
set more off
cap log close

**SET USER**
local SAMPADA 	0 
local DEREK 	1

	*USER SPECIFIC LOG + DATA LOAD*
	if `SAMPADA'==1{
	log using firstanalysis, text replace // change to github folder for logs
	use "/Users/sampadakc/Desktop/Thesis/agriculture/Nepal_Data.dta"
	}

	if `DEREK'==1{
	log using "Y:\Nepal_Agriculture\NPL_SN_Analysis", smcl replace
	use "W:/Dropbox/Agriculture Extension Worker Project/Analysis/data/Baseline-2014-10-20.dta"
	}
	
/*****************************************************************
PROJECT: 	NEPAL AGRICULTURE - ICIMOD
PURPOSE: 	CREATE CONNECTED SOCIAL NETWORK DATA FROM
			SECTION M OF BASELINE
AUTHORS: 	SAMPADA KC (YALE)
			DEREK WOLFSON (IPA)

INPUTS: 	BASELINE SURVEY DATA
			Baseline-2014-10-20.dta
			
OUTPUTS: 	TBD

*******************************************************************/

*************************************************
* STEP #1: CLEAN/RESHAPE SECTION M (SN DATA)	*
*************************************************

*CREATE UNIUQE HHID
egen id = concat( a03 a05 a07 a08 a09)
unique id
label var id "Household ID"
keep id m*
order id 

**CLEANING**
mvdecode m01* m02* m03* m04* m05* m06* m07* m08* m09* m10* m11*, mv(-9=.m\-6=.a)
recode m01* (2=0)
tab m01_1
label define YesNo 0 "No" 1 "Yes" .m "Missing" .a "Don't know", modify 
label values m01* YesNo 

**RESHAPE**
keep id m01* m02* m03* m04* m05* m06* m07* m08* m09* m10* m11*
	*STORE LABELS FOR RESHAPE*	
	forv i=1/11{
		if `i'<10{
			local FILL 0 
		}
		if `i'>=10{
			local FILL ""
		}
		local m`FILL'`i' : var label m`FILL'`i'_1
	}

reshape long m01_ m02_ m03_ m04_ m05_ m06_ m07_ m08_ m09_ m10_ m11_ , i(id) j(sn_member) 
	
	*LABEL VARIABLES*
	la var sn_member "SN Member Number (1-9)"
	forv i=1/11{
		if `i'<10{
			local FILL 0 
		}
		if `i'>=10{
			local FILL ""
		}
		
		la var m`FILL'`i'_ "`m`FILL'`i''"
	}
