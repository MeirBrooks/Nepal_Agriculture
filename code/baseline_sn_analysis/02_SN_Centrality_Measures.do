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


levelsof ward_id,local(WARDS)
foreach WID of local WARDS{
	
	preserve
	keep if ward_id == `WID'
	duplicates drop hhid, force
	sort hhid
	keep ward_id hhid
	tempfile temp_head
	save "`temp_head'"
	restore
	
*OUTDEGREE*
	preserve
	//CREATE OUTDEGREE DENOMINATOR
	keep if ward_id ==`WID'
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
	duplicates drop hhid, force
	keep hhid outdegree*
	sort hhid
	tempfile temp_outd
	save "`temp_outd'"
	restore

*INDEGREE*
	preserve
	//COMPUTE INDEGREE DENOMINATOR
	keep if ward_id== `WID'
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
	duplicates tag SN_hhid2 , gen(indegree)
	replace indegree=indegree+1
	la var indegree "Baseline Indegree"
	keep SN_hhid denom indegree
	rename SN_hhid hhid
	la var hhid "HHID"
	duplicates drop hhid, force
	sort hhid
	tempfile temp_ind
	save "`temp_ind'"
	restore

	
*TOTAL DEGREE*
	preserve
	keep if ward_id ==`WID'
	drop if SN_hhid==.
	drop if SN_hhid == hhid //REMOVING SELF-LOOPS 
	duplicates drop hhid SN_hhid, force //REMOVING PARALLEL EDGES
	sort hhid
	
	//COMPUTE TOTAL DEGREE DENOMINATOR
	netsis hhid SN_hhid, measure(adjacency) name(A,replace)
	netsummarize A, generate(degree) statistic(rowsum)
	rename degree_source total_denom_degree
	la var total_denom_degree "Total Denominator Degree"
	drop degree_target
	
	//COMPUTE TOTAL DEGREE
	gen SN_hhid2 = SN_hhid if m01==01
	drop if SN_hhid2 == . 
	netsis hhid SN_hhid2, measure(adjacency) name(B,replace)
	netsummarize B , generate(degree) statistic(rowsum)
	rename degree_source total_degree
	la var total_degree "Total Degree"
	duplicates drop hhid, force
	keep hhid total_degree total_denom_degree
	sort hhid
	tempfile temp_totald
	save "`temp_totald'"
	restore
	
	use "`temp_head'"
	sort hhid
	merge hhid using "`temp_outd'"
	drop _merge
	sort hhid
	merge hhid using "`temp_ind'"
	drop _merge
	sort hhid
	merge hhid using "`temp_totald'"
	drop _merge
	

if(`WID'==111){
   save centrality_measures.dta, replace
 } 
else{
    append using centrality_measures.dta
    save centrality_measures.dta, replace
 }
}	
	