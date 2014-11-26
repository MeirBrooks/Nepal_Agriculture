/****************************************
PROJECT: NEPAL AG - ICIMOD
*****************************************/
clear
set more off
cap log close

	*USER SPECIFIC LOG + DATA LOAD*
	if "`c(username)'"=="sampadakc"{
	local GITHUBDIR "/Users/sampadakc/Documents/GITHub/Nepal_Agriculture" // FILL IN FOR SAMPADA	
	*use "/Users/sampadakc/Desktop/Thesis/agriculture/Nepal_Data.dta" //CHANGE TO DROPBOX LOCATION WHEN SAMPADA GETS BOXCRYPTOR
	use "/Volumes/Boxcryptor/Dropbox/Agriculture Extension Worker Project/Analysis/data/Baseline-2014-10-20.dta" // DB
	}

	if "`c(username)'"=="dwolfson"{
	local GITHUBDIR "Y:/Nepal_Agriculture"
	use "W:/Dropbox/Agriculture Extension Worker Project/Analysis/data/Baseline-2014-10-20.dta"
	}
	
	log using "`GITHUBDIR'/logs/baseline_sn_analysis/NPL_SN_Analysis", smcl replace
	di "Ran by `c(username)'"
	
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
* STEP 0: CREATE UNIUQE IDS	IN BASELINE DATA	*
*************************************************
*CREATE UNIQUE HHID
egen hhid = concat(a03 a05 a07 a08 a09)
egen ward_id = concat(a03 a05 a07 a08) 
la var hhid "Household ID"
la var ward_id "Dist/ASC/VDC/Ward ID"
tempfile BASELINE
save `BASELINE'





*************************************************
* STEP 1: CLEAN/RESHAPE SECTION M (SN DATA)		*
*************************************************
use `BASELINE'
keep 	hhid ward_id a03 a05 a07 a08 a09 a10 /// ID VARIABLES
		m00* m01* m02* m03* m04* m05* m06* m07* m08* m09* m10* m11* // SN VARIABLES
order 	hhid ward_id

**1.1 CLEANING**
mvdecode m01* m02* m03* m04* m05* m06* m07* m08* m09* m10* m11*, mv(-9=.m\-6=.a)
recode m01* (2=0)
tab m01_1
label define YesNo 0 "No" 1 "Yes" .m "Missing" .a "Don't know", modify 
label values m01* YesNo 

**1.2 RESHAPE*
 *STORE LABELS FOR RESHAPE*	
	forvalue i=0/11{
		if `i'<10{
			local FILL 0 
		}
		if `i'>=10{
			local FILL ""
		}
		local m`FILL'`i' : var label m`FILL'`i'_1
	}

 *RESHAPE*
reshape long m00_ m01_ m02_ m03_ m04_ m05_ m06_ m07_ m08_ m09_ m10_ m11_ , i(hhid a03 a05 a07 a08 a09) j(sn_member) 
	
 *LABEL VARIABLES*
	la var sn_member "SN Member Number (1-9)"
	forv i=0/11{
		if `i'<10{
			local FILL 0 
		}
		if `i'>=10{
			local FILL ""
		}		
		la var m`FILL'`i'_ "`m`FILL'`i''"
	}

	sort a03 a05 a07 a08 a09 sn_member
	replace m00_ = upper(m00_)
	tempfile SN_DATA
	save `SN_DATA'
	
//END STEP 2

*************************************************
* STEP 2: MATCH SN MEMBERS TO HHIDS			*
*************************************************

use `BASELINE'
keep hhid ward_id a12
rename a12 m00_
replace m00_ = upper(m00_)
rename hhid SN_hhid
duplicates drop m00_ ward_id, force // DROPPING DUPLICATES -- RETURN TO THIS LATER

tempfile SN_HHID
save `SN_HHID'
use `SN_DATA'
gen ID = _n // GEN ID FOR RECLINK

reclink ward_id m00_ using `SN_HHID', idu(SN_hhid) idm(ID) gen(match) req(ward_id)
	
keep hhid ward_id m00_ Um00_ SN_hhid _merge match sn_member
order hhid ward_id sn_member SN_hhid m00_  Um00_ _merge match

*************************************************
* STEP 3: MANUAL CLEANING AFTER MERGE			*
*************************************************

include "`GITHUBDIR'/code/baseline_sn_analysis/01_SN_Manual_Matching.do"
