**USING PRINCIPAL COMPONENTS ANALYSIS TO CREATE A WEALTH INDEX**

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
	
	
    local DATA "`DB'/Agriculture Extension Worker Project/Analysis/data/Baseline-2014-10-20.dta"
	di "Ran by `c(username)'"
	
	use "`DATA'", clear
	
	local DATAOUT "`DB'/Agriculture Extension Worker Project/Analysis/data"
	local RESULTS "`DB'/Agriculture Extension Worker Project/Analysis/output"
	
*************************************************
* STEP 0: CREATE UNIUQE IDS	IN BASELINE DATA	*
*************************************************

egen hhid = concat(a03 a05 a07 a08 a09)
egen ward_id = concat(a03 a05 a07 a08) 
la var hhid "Household ID"
la var ward_id "Dist/ASC/VDC/Ward ID"
destring hhid ward_id, replace

*************************************************
* CENTRALITY MEASURES BY CASTE GROUP & GENDER *
*************************************************

replace  b0b_01=.m if b0b_01== -9 
replace  b0b_01=.d if b0b_01== -1

replace  b0d_01=.m if b0d_01== -9 
replace  b0d_01=.a if b0d_01== -6
replace  b0d_01=0 if b0d_01== 2


keep hhid ward_id b0b_01 b0d_01
order hhid ward_id
sort hhid
duplicates drop hhid,force

merge 1:1 hhid using "`DATAOUT'/centrality_measures.dta"
drop _merge


** centrality measures by CASTE GROUP

xi: regress m10Y_outdegree_proportion i.b0b_01
xi: regress m10Y_indegree_proportion i.b0b_01
xi: regress m10Y_e_score i.b0b_01
xi: regress m10Y_betweenness_source i.b0b_01

xi: regress m01_outdegree_proportion i.b0b_01
xi: regress m01_indegree_proportion i.b0b_01
xi: regress m01_e_score i.b0b_01
xi: regress m01_betweenness_source i.b0b_01

** centrality measures by GENDER

regress m10Y_outdegree_proportion b0d_01
regress m10Y_indegree_proportion b0d_01
regress m10Y_e_score b0d_01
regress m10Y_betweenness_source b0d_01

regress m01_outdegree_proportion b0d_01
regress m01_indegree_proportion b0d_01
regress m01_e_score b0d_01
regress m01_betweenness_source b0d_01

graph bar b0d_01, over (m10Y_outdegree_proportion) 




 
