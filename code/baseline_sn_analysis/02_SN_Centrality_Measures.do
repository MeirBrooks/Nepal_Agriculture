/*****************************************************************
PROJECT: 	NEPAL AGRICULTURE - ICIMOD
PURPOSE: 	CREATING EDGE LIST TO STORE NETWORK INFORMATION 
			
AUTHORS: 	SAMPADA KC (YALE)
			DEREK WOLFSON (IPA)
			
NOTES: 		
*******************************************************************/
clear all
	*USER SPECIFIC LOG + DATA LOAD*
	if "`c(username)'"=="sampadakc"{
	local GITHUBDIR "/Users/sampadakc/Documents/GITHub/Nepal_Agriculture" // FILL IN FOR SAMPADA
	local DB "/Users/sampadakc/Dropbox" // UPDATE TO YOUR DROPBOX DIRECTORY
	}
	
	if "`c(username)'"=="dwolfson"{
	local GITHUBDIR "Y:/Nepal_Agriculture"
	local DB X:	
	}
	
	use "`DB'/Agriculture Extension Worker Project/Analysis/data/SN_data.dta", clear


*************************************************
* STEP 3: DATA ANALYSIS CREATING AN EDGE LIST	*
*************************************************


levelsof ward_id, local(WARDS)
foreach WID of local WARDS{
	di "`WID'"
}
*OUTDEGREE*
	preserve
	//CREATE OUTDEGREE DENOMINATOR
	keep if ward_id == 0111
	drop if SN_hhid==.
	drop if SN_hhid == hhid // REMOVING PARALLEL EDGES
	duplicates drop hhid SN_hhid, force // REMOVING SELF-LOOPS
	
	bys hhid: egen outdegree_denom=count(SN_hhid)
	la var outdegree_denom "Baseline Outdegree Denominator"
	note outdegree_denom: Number of households that we asked HHID if they know
	
	//CREATE OUTDEGREE NUMERATOR
	gen SN_hhid2 = SN_hhid if m01==01
	drop if SN_hhid2 == . 
	
	bys hhid : egen outdegree=count(SN_hhid2)
	la var outdegree "Baseline Outdegree"
	keep hhid outdegree*
	duplicates drop
	tempfile O
	save `O'
	restore


*INDEGREE*
	preserve
	//COMPUTE INDEGREE DENOMINATOR
	keep if ward_id == 0111
	drop if SN_hhid==.
	drop if SN_hhid == hhid //REMOVING SELF-LOOPS 
	duplicates drop hhid SN_hhid, force //REMOVING PARALLEL EDGES 
	
	duplicates tag SN_hhid, gen(denom)
	replace denom=denom+1
	la var denom "Baseline Indegree Denominator"
	note denom: Number that know the households
	
	//COMPUTE INDEGREE
	gen SN_hhid2 = SN_hhid if m01==01
	drop if SN_hhid2 == . 
	duplicates tag SN_hhid2, gen(indegree)
	replace indegree=indegree+1
	la var indegree "Baseline Indegree"
	keep SN_hhid2 denom indegree
	rename SN_hhid2 hhid
	la var hhid "HHID" 
	duplicates drop hhid, force
	tempfile I
	save `I'
	restore

	
*TOTAL DEGREE*
	preserve
	keep if ward_id == 0111
	drop if SN_hhid==.
	drop if SN_hhid == hhid //REMOVING SELF-LOOPS 
	duplicates drop hhid SN_hhid, force //REMOVING PARALLEL EDGES
	
	//COMPUTE TOTAL DEGREE DENOMINATOR
	netsis hhid SN_hhid, measure(adjacency) name(A,replace)
	netsummarize A, generate(degree) statistic(rowsum)
	rename degree_source total_denom_degree
	la var total_denom_degree "Total Denominator Degree"
	duplicates drop 
	
	//COMPUTE TOTAL DEGREE
	gen SN_hhid2 = SN_hhid if m01==01
	drop if SN_hhid2 == . 
	netsis hhid SN_hhid2, measure(adjacency) name(B,replace)
	netsummarize B, generate(degree) statistic(rowsum)
	keep hhid degree_source
	rename degree_source total_degree
	la var total_degree "Total Degree"
	duplicates drop 
	tempfile T
	save `T'
	restore
	
	
	
	


