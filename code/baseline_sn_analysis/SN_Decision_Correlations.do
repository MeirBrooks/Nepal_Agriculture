clear all
set more off
	*USER SPECIFIC LOG + DATA LOAD*
	if "`c(username)'"=="sampadakc"{
	local GITHUBDIR "/Users/sampadakc/Documents/GITHub/Nepal_Agriculture" // FILL IN FOR SAMPADA
	local DB "/Users/sampadakc/Dropbox" // UPDATE TO YOUR DROPBOX DIRECTORY
	}
	
	if "`c(username)'"=="dwolfson"{
	local GITHUBDIR "Y:/Nepal_Agriculture"
	local DB X:	
	}
	
	local DATA "`GITHUBDIR'/code/baseline_sn_analysis/centrality_agridecisions.dta"
	use "`DATA'", clear
	rename hhid SN_hhid
	drop outdegree_denom outdegree outdegree_proportion indegree_denom indegree indegree_proportion total_denom_degree total_degree Tdegree_proportion e_score betweenness_source
	tempfile TEMP
	save `TEMP'


merge 1:m SN_hhid using "`DB'/Agriculture Extension Worker Project/Analysis/data/SN_data.dta"
	drop _merge
	
	foreach v of varlist e03_* e05_* e09_* e10_* e13_* e19_* e28_* e42_* e49_* e55_* e64_* f01 f02 f04 {
	       gen know_`v' =0
		   replace know_`v' =1 if m01_ == 1 & `v' == 1 
	}
	
	collapse (mean) know_*, by(hhid)
	
merge 1:1 hhid using "`GITHUBDIR'/code/baseline_sn_analysis/centrality_agridecisions.dta"
drop _merge

foreach v of varlist e03_* e05_* e09_* e10_* e13_* e19_* e28_* e42_* e49_* e55_* e64_* f01 f02 f04  {
	          di "`v'"
			  regress `v' know_`v', cluster(ward_id)
			  if "`v'" == "e03_p1" {
				outreg2 using "`GITHUBDIR'/output/sn_analysis/preliminary2_analysis.xls", excel replace dec(3) ///
					title("TITLE HERE") //
			  }
			  else{
				outreg2 using "`GITHUBDIR'/output/sn_analysis/preliminary2_analysis.xls", excel append dec(3) //
			  }
}	  
			
