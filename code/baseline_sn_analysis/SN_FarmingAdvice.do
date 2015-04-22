/*******************************************************************

PURPOSE: Using SES characteristics of hhids and SN_hhids as predictors for farming advice

*******************************************************************/


clear
set more off
cap log close

	*USER SPECIFIC LOG + DATA LOAD*
	if "`c(username)'"=="sampadakc"{
	local GITHUBDIR "/Users/sampadakc/Documents/GITHub/Nepal_Agriculture" 
	local DB "/Users/sampadakc/Dropbox"
	
	}
	
	if "`c(username)'"=="dwolfson"{
	local GITHUBDIR "Y:/Nepal_Agriculture"
	local DB "X:"
	}
	
	local DATAOUT "`DB'/Agriculture Extension Worker Project/Analysis/data"
	
	use "`DATAOUT'/PCA_wealthindex.dta"
	
keep hhid caste wealth_index land
gen long SN_hhid = hhid
sort hhid
save, replace

** characteristics of hhid
use "`DATAOUT'/SN_Data.dta"
sort hhid
merge m:1 hhid using "`DATAOUT'/PCA_wealthindex.dta", keepusing(caste wealth_index land)
rename caste i_caste
rename wealth_index i_wealth_index
rename land i_land
drop _merge
sort SN_hhid

** characteristics of SN_hhid
merge m:1 SN_hhid using "`DATAOUT'/PCA_wealthindex.dta", keepusing(caste wealth_index land)
rename caste j_caste
rename wealth_index j_wealth_index
rename land j_land
drop _merge

** 



/*
*** i DOES NOT KNOW j *** 
keep SN_wealth_index hhid_wealth_index hhid SN_hhid ward_id m01 m10Y m04 SN_caste hhid_caste
gen wealth_ij= SN_wealth_index * hhid_wealth_index
gen samecaste_ij= 0 
replace samecaste_ij= 1 if SN_caste == hhid_caste
gen diff_wealthij = abs(SN_wealth_index - hhid_wealth_index)
order hhid hhid_wealth_index SN_hhid SN_wealth_index diff_wealthij

clogit m01 SN_wealth_index wealth_ij samecaste_ij m04 diff_wealthij, group (hhid) 
 */


*** FARMING ADVICE IF i KNOWS j *** 
keep if m01 == 1
keep j_wealth_index i_wealth_index hhid SN_hhid m01 m10Y m04 j_caste i_caste j_land i_land m04 m05
gen wealth_ij= j_wealth_index * i_wealth_index
gen samecaste_ij= 0 
replace samecaste_ij= 1 if j_caste == i_caste
gen diff_wealth_ij = abs(j_wealth_index - i_wealth_index)
gen diff_land_ij = abs(j_land - i_land)
gen diff_ratio_ij = diff_land_ij / i_land

gen m05_observed = cond(j_land > i_land, 1, cond(j_land < i_land, 2, 3))
replace m05_observed = 3 if diff_ratio_ij < .1
tab m05_ m05_obser, row

order hhid i_wealth_index SN_hhid j_wealth_index diff_wealth_ij

clogit m10Y j_wealth_index wealth_ij samecaste_ij m04 diff_wealth_ij , group(hhid)
predict m10Y_model1
gen m10_50 = m10Y_model >= .5
tab m10Y m10_50,row

** robustness check **

clogit m10Y j_wealth_index wealth_ij samecaste_ij m04 diff_wealth_ij j_land diff_land_ij, group(hhid)
predict m10Y_model if e(sample)
gen m10Y_50 = m10Y_model >= .5 if m10Y_model!=.
tab m10Y m10Y_50,row

** comparing diff_land_ij to m05

/*tempfile advice_correlations
save "`advice_correlations'", replace

/*use "`DATAOUT'/centrality_measures.dta", clear
gen long SN_hhid = hhid
merge 1:m SN_hhid using "`advice_correlations'"

rename m01_outdegree j_m01_outdegree 
rename m10Y_outdegree j_m10Y_outdegree
clogit m10Y j_wealth_index wealth_ij samecaste_ij m04 diff_wealthij, group(SN_hhid)

/**gen m10Y_50 = m10Y_model >= .5
tab m10Y m10Y_50,row
fitstat 
