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
*  KEEP SOCIOECONOMIC CHARACTERISTICS DATA	*
*************************************************

keep hhid ward_id c01* c02* c03* c05* c07_p* c10 h0* h1* h2* i0* i10
order hhid ward_id
sort hhid

*************************************************
*  CLEAN VARIABLES TO WORK FOR PCA  *
*************************************************

* socioeconomic characteristics-- SECTION C *

replace  c01=.m if c01== -9 
replace  c02=.m if c02== -9
replace  c03=.m if c03== -9
replace  c07_p=.m if c07_p== -9

replace c01 = 8 if c01_specify=="Block"
replace c01 = 10 if c01_specify=="Cement"

replace c02 = 4 if inlist(c02_specify,"Tin","tin")

drop c01_specify c02_specify c03_specify c07_p_specify 
	
foreach var in c01 c02 c03 c07_p{		
      forv n= 1/14 { 
	  gen `var'_`n'= 0
	  replace `var'_`n'=1 if `var'== `n'
	  }
}

drop c01_12 c01_13 c01_14 c02_11 c02_12 c02_13 c02_14 c03_14

* c10

replace c10=.d if c10== -1
recode c10 (-1=0) (2=0)
		
* household and farm assets-- SECTION H * 

	foreach V of varlist h*{
	replace `V' = .m if `V' == -9
	replace `V' = .d if `V' == -1
	replace `V' = .a if `V' == -6
	}

* livestock--- SECTION I *
   
	foreach V of varlist i01-i10{
	replace `V' = .m if `V' == -9
	replace `V' = .d if `V' == -1
	replace `V' = .a if `V' == -6
	}

           **CREATE LIST OF WEALTH INDEX CHARACTERISTICS**

		   local ASSETS c01* c02* c03* c07* c10 /// socio-economic characteristics
	                    h0* h1* h2*             /// household and farm assets
                        i0* i10                 /// livestock 
						                                                                                				
			summ c01* c02* c03* c07* c10 h0* h1* h2* i0* i10  	
			
**USE PRINCIPAL COMPONENTS ANALYSIS**
		pca `ASSETS', components(1)
		
**PREDICT WEALTH_SCORE** (USES FIRST ELEMENT OF PCA -- WHICH IS THE ELEMENT WHICH EXPLAINS THE MOST VARIANCE ACROSS THE CATEGORIES OF WEALTH**
		predict wealth_index
		
		summ wealth_index
		return list
	** re-scaling the wealth index to use log  
		gen rescale_wealth_index = 1 - `r(min)' + wealth_index
		
	** scatter-plots for 	
		
		*CREATE QUINTILES FOR WEALTH*
		xtile wealth_quintile=wealth_index, n(5)
		
		xtile wealth_decile=wealth_index, n(10)
				
		*_pctile wealth_index, p(5 10 20 30 40 50 60 70 80 90 95)
		
		*gen wealth_tile=5 if wealth_index<=r(r1)
		*gen wealth_tile=10 if wealth_index>r(r1) & wealth_index
		
	keep hhid wealth_index rescale_wealth_index wealth_quintile wealth_decile

	la var wealth_quintile "Wealth Index Quintiles"
	la var wealth_decile "Wealth Index Deciles"
	la var wealth_index "Wealth Index"

 save "`DATAOUT'/PCA_wealthindex.dta", replace
 
 merge 1:m hhid using "`DATAOUT'/SN_Data.dta"
 drop _merge
 save "`DATAOUT'/SNID_wealthindex.dta", replace

 use "`DATAOUT'/PCA_wealthindex.dta", clear
 merge 1:1 hhid using "`DATAOUT'/centrality_measures.dta"
 drop _merge
 

 *************************************************
* CENTRALITY MEASURES BY WEALTH *
*************************************************
 
 
 twoway scatter m10Y_outdegree_proportion rescale_wealth_index, xscale(log)
 graph export "`RESULTS'/m10outdegree_wealth.png" , replace
 
 
 twoway scatter m10Y_indegree_proportion rescale_wealth_index, xscale(log)
 graph export "`RESULTS'/m10indegree_wealth.png" , replace
 
 twoway scatter m10Y_e_score rescale_wealth_index, xscale(log)
 graph export "`RESULTS'/m10eigenvalue_wealth.png" , replace
 
 twoway scatter m10Y_betweenness_source rescale_wealth_index, xscale(log)
 graph export "`RESULTS'/m10betweenness_wealth.png" , replace
 
 twoway scatter m01_outdegree_proportion rescale_wealth_index, xscale(log)
 graph export "`RESULTS'/m01outdegree_wealth.png" , replace
 
 twoway scatter m01_indegree_proportion rescale_wealth_index, xscale(log)
 graph export "`RESULTS'/m01indegree_wealth.png" , replace
 
 twoway scatter m01_e_score rescale_wealth_index, xscale(log)
 graph export "`RESULTS'/m01eigenvalue_wealth.png" , replace
 
 twoway scatter m01_betweenness_source rescale_wealth_index, xscale(log)
 graph export "`RESULTS'/m01betweeness_wealth.png" , replace
 

 
 
 
 
						
