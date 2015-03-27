/********************************************
PROJECT: ICIMOD NEPAL AGRICULTURE

AUTHOR: DEREK WOLFSON

PURPOSE: RANDOMIZATION BALANCE CHECKS - DATA PREPARATION

INPUTS: Dropbox\Agriculture Extension Worker Project\Analysis\Data\..
			..\Baseline-2014-10-17.dta (Exported from CSPRO Dataset)
			..\Treatment_Assignments.dta
			
OUTPUTS: Dropbox\Agriculture Extension Worker Project\Analysis\Data\..
			..\Balance_Checks.dta

********************************************/
clear
set more off
cap log close

	*USER SPECIFIC LOG + DATA LOAD*
	if "`c(username)'"=="sampadakc"{
	local GITHUBDIR "/Users/sampadakc/Documents/GITHub/Nepal_Agriculture" // FILL IN FOR SAMPADA
	local DB "/Users/sampadakc/Dropbox" // UPDATE TO YOUR DROPBOX DIRECTORY
	}
	
	if "`c(username)'"=="dwolfson"{
	local GITHUBDIR "Y:/Nepal_Agriculture"
	local DB "X:"
	}
	
	use "`DB'/Agriculture Extension Worker Project/Analysis/data/Baseline-2014-10-20.dta"
	
*************************************************
* STEP 0: CREATE UNIUQE IDS	IN BASELINE DATA	*
*************************************************
*CREATE UNIQUE HHID
egen hhid = concat(a03 a05 a07 a08 a09)
egen ward_id = concat(a03 a05 a07 a08) 
la var hhid "Household ID"
la var ward_id "Dist/ASC/VDC/Ward ID"
destring hhid ward_id, replace
keep hhid ward_id e03_* e05_* e09_* e10_* e13_* e19_* e28_* e42_* e49_* e55_* e64_* f01 f02 f04 
order hhid ward_id
sort hhid
tempfile BASELINE
save `BASELINE'

*SECTION E*
	foreach V of varlist e13_* e19_* e28_* e42_* e49_* e55_*  {
	replace `V' = .m if `V' == -9
	replace `V' = .d if `V' == -1
	replace `V' = .a if `V' == -6
	}
	
	*SECTION F*
	foreach V of varlist f02  {
	replace `V' = .m if `V' == -9
	replace `V' = .d if `V' == -1
	replace `V' = .a if `V' == -6
	}


	*MAIZE - MANURE APPLICATION
	local V BL_MAIZE_MANURE
	clonevar `V' = e13_p1
	la var `V' "Primary Maize Plot - Manure Use"
	note `V': Primary maize plot
	recode `V' (2=0)
	
	*MAIZE - BASAL FERTILIZER
	local V BL_MAIZE_FERTILIZER1
	clonevar `V' = e19_p1
	la var `V' "Primary Maize Plot - Basal Fertilizer Use"
	note `V': Primary maize plot
	recode `V' (2=0)
	
	*MAIZE - TOP DRESS FERTILIZER
	local V BL_MAIZE_FERTILIZER2
	clonevar `V' = e28_p1
	la var `V' "Primary Maize Plot - Top Dress Fertilizer Use"
	note `V': Primary maize plot
	recode `V' (2=0)
	
	*MAIZE - HERBICIDE
	local V BL_MAIZE_HERBICIDE
	clonevar `V' = e42_p1
	la var `V' "Primary Maize Plot - Herbicide Use"
	note `V': Primary maize plot
	recode `V' (2=0)
	
	*MAIZE - FUNGICIDE
	local V BL_MAIZE_FUNGICIDE
	clonevar `V' = e55_p1
	la var `V' "Primary Maize Plot - Fungicide Use"
	note `V': Primary maize plot
	recode `V' (2=0)
	
*SECTION F*
	*MAIZE INTERCROPPING - KNOWLEDGE OF
	local V BL_MAIZE_IC_KNOW
	clonevar `V' = f01
	la var `V' "Know of Maize Intercropping"
	recode `V' (2=0)
		
	local V BL_MAIZE_IC_USE
	clonevar `V' = f02
	la var `V' "Use Maize Intercropping"
	recode `V' (2=0)

merge 1:m hhid using "/Users/sampadakc/Documents/GITHub/Nepal_Agriculture/code/baseline_sn_analysis/centrality_measures.dta"	
    drop if _merge==2
    drop _merge

	
		
  foreach v of varlist e03_* e05_* e09_* e10_* e13_* e19_* e28_* e42_* e49_* e55_* e64_* f01 f02 f04  {
       foreach var in outdegree_proportion indegree_proportion Tdegree_proportion{
			di "`v'" _n "`var'"
	          regress `v' `var' , cluster(ward_id)
			  if `v' == e03_p1
			  }
		}
  }		
	
