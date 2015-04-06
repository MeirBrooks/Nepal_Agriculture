/*******************************************************************

PURPOSE: Using SES characteristics of hhids and SN_hhids as predictors for M10

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
	
keep hhid wealth_index 
rename hhid SN_hhid

merge 1:m SN_hhid using "`DATAOUT'/SNID_wealthindex.dta"
drop _merge
rename wealth_index SNhhid_wealth_index

merge m:1 hhid using "`DATAOUT'/PCA_wealthindex.dta"
rename wealth_index hhid_wealth_index	
	
order hhid hhid_wealth_index SN_hhid SNhhid_wealth_index
keep if m01 == 1
keep SNhhid_wealth_index hhid_wealth_index hhid SN_hhid ward_id m01 m10Y

clogit m10Y SNhhid_wealth_index SNhhid_wealth_index * hhid_wealth_index, group(hhid)





