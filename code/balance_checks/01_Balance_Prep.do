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
***********************
** STEP 1: LOAD DATA **
***********************
local PROJECT "W:\Dropbox\Agriculture Extension Worker Project"
local DATA "`PROJECT'\Analysis\data" // BOXCRYPTOR PATH FOR NPL-ICIMOD DATA

*LOAD BASELINE DATA + CREATE ID FOR MERGE
use "`DATA'/Baseline-2014-10-20.dta", clear
egen id=concat( a05 a07 a08)
gen HHID = a10
drop _merge
merge m:1 id using "`DATA'/Treatment_Assignments.dta"
**CREATE DIFFERENT TREATMENT VARIABLES**


***************************************
** STEP 2.1: CLEANING TREATMENT DATA **
***************************************
clonevar TREATMENT1 = treatment

**TREATMENT VARIABLE FOR CONTROL/EXTENSION/LEAD/PEER
local V TREATMENT2
gen `V' = .
replace `V' = 0 if TREATMENT1 ==0
replace `V' = 1 if inlist(TREATMENT1,1,4,7)
replace `V' = 2 if inlist(TREATMENT1,2,5,8)
replace `V' = 3 if inlist(TREATMENT1,3,6,9)
lab def `V' 0 "Control" 1 "Extension" 2 "Lead" 3 "Peer"
la val `V' `V'

**TREATMENT VARIABLE FOR CONTROL/PB/FB/NO**
local V TREATMENT3
gen `V' = .
replace `V' = 0 if TREATMENT1 ==0
replace `V' = 1 if inlist(TREATMENT1,1,2,3)
replace `V' = 2 if inlist(TREATMENT1,4,5,6)
replace `V' = 3 if inlist(TREATMENT1,7,8,9)
lab def `V' 0 "Control" 1 "Performance Incentive" 2 "Flat Incentive" 3 "No Incentive"
la val `V' `V'

**************************************
** STEP 2.2: CLEANING BASELINE DATA **
**************************************

	*SECTION B*
	rename bog_* b0g_*
	foreach alph in b d e f g h i {
		forv i = 1/15{
			if `i'<10{
				local LZERO "0"
			}
			else{
				local LZERO ""
			}
				replace b0`alph'_`LZERO'`i' = .m if b0`alph'_`LZERO'`i'==-9
				replace b0`alph'_`LZERO'`i' = .d if b0`alph'_`LZERO'`i'==-1
				replace b0`alph'_`LZERO'`i' = .a if b0`alph'_`LZERO'`i'==-6
		}
	}
	

	*SECTION C*
	replace c01 = 8 if c01_specify=="Block"
	replace c01 = 10 if c01_specify=="Cement"

	replace c02 = 4 if inlist(c02_specify,"Tin","tin")
	
	forv i = 1/3{
	replace c09_2_`i' = .m if c09_2_`i' == -9
	replace c09_2_`i' = .d if c09_2_`i' == -1
	replace c09_2_`i' = .a if c09_2_`i' == -6
	}
	
	*SECTION D*
	local V d01_1
	replace `V' = .m if `V' == -9
	replace `V' = .d if `V' == -1
	replace `V' = .a if `V' == -6
	
	*SECTION E*
	foreach V of varlist e01_* e06_* e13_* e19_* e28_* e42_* e49_* e55_*  {
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
	
	*SECTION H*
	foreach V of varlist h*{
	replace `V' = .m if `V' == -9
	replace `V' = .d if `V' == -1
	replace `V' = .a if `V' == -6
	}
	
	*SECTION I*
	foreach V of varlist i01-i10{
	replace `V' = .m if `V' == -9
	replace `V' = .d if `V' == -1
	replace `V' = .a if `V' == -6
	}
	
	*SECTION J*
	foreach V of varlist j02{
	replace `V' = .m if `V' == -9
	replace `V' = .d if `V' == -1
	replace `V' = .a if `V' == -6
	}
	
	*SECTION K*
	foreach V of varlist k03 k04 k05 k06{
	replace `V' = .m if `V' == -9
	replace `V' = .d if `V' == -1
	replace `V' = .a if `V' == -6
	}
	

********************************************
** STEP 3: CREATE BALANCE CHECK VARIABLES **
********************************************
 *SECTION B*
	*HHH CASTE
	tab b0b_01, gen(BL_CASTE)
	forv i = 1/4{
		local varlab : variable label BL_CASTE`i'
		local varlab1: subinstr local varlab "b0b_01==" ""
		la var BL_CASTE`i' "HHH CASTE - `varlab1'"
	}
	
	*HHH TIME ON FARM
	tab b0h_01, gen(BL_FARMTIME)
	forv i=1/3{
		local varlab : variable label BL_FARMTIME`i'
		local varlab1: subinstr local varlab "b0h_01==" ""
		la var BL_FARMTIME`i' "HHH TIME ON FARM - `varlab1'"
	}

 *SECTION C*
	*WALLS
	local V1 BL_IMPROVED_WALLS
	local V2 c01
	gen `V1' = .
	la var `V1' "Improved Walls"
	replace `V1' = 1 if inlist(`V2',4,8,9,10)
	replace `V1' = 0 if inlist(`V2',1,2,3,5,6,7)
	note `V1': Improved includes Metal/GI/Asbestos; Stones, Burnt Brick, Concrete
	
	*ROOF
	local V1 BL_IMPROVED_ROOF
	local V2 c02
	gen `V1' = .
	la var `V1' "Improved Roof"
	replace `V1' = 1 if inlist(`V2',4,7,8,9,10)
	replace `V1' = 0 if inlist(`V2',1,2,3,5,6,7)
	note `V1': Improved includes Metal/GI/Asbestos; Tiles/shingles/slates; Stone; Concrete
	
	*WATER
	local V1 BL_PIPED_WATER
	local V2 c03
	gen `V1' = .
	la var `V1' "Piped Water"
	replace `V1' = 1 if inlist(`V2',7,8,9)
	replace `V1' = 0 if inlist(`V2',1,2,3,4,5,6)
	note `V1': Piped water includes Public Standpipe, Piped water inside house, piped water inside community
	
	*INCOME
	local V1 BL_INCOME
	egen `V1' = rowtotal(c09_2_1 c09_2_2 c09_2_3)
	replace `V1' = `V1'/1000
	la var `V1' "Income Amount (000s)"
	
 *SECTION D*
	*PLOTS
	local V1 BL_PLOTS
	gen `V1' = d01_1
	la var `V1' "Plots Cultivated Last Year"
	
 *SECTION E*
	*CULTIVATION AREA (Multiplication Constants from LandArea_Conversions.xls)
	/* KILL THIS CODE FOR NOW.
	local V1 BL_MAIZE_AREA
	local V2 e01_unit // unit definition
	local V3 e01_2 // no. of units
	gen `V1' = .
	la var `V1' "Farm Area (Acres)"
	replace `V1' = ???*`V3' if `V3'==1 // Aana	
	replace `V1' = 1.6735*`V3' if `V3'==1 // Bigha	
	replace `V1' = 0.0837*`V3' if `V3'==1 // Kattha/Biswa
	replace `V1' = ???*`V3' if `V3'==1 // Dam	
	replace `V1' = 0.0042*`V3' if `V3'==1 // Dhur	
	replace `V1' = ???*`V3' if `V3'==1 // Hatt	
	replace `V1' = ???*`V3' if `V3'==1 // Paisa	
	replace `V1' = 0.1257*`V3' if `V3'==1 // Ropani
	replace `V1' = 0.1257`V3' if `V3'==1 // Hal	
	*/
	
	*MAIZE PLOTS
	local V1 BL_PLOTS_MAIZE
	gen `V1' = e01_1
	la var `V1' "Maize Plots Cultivated Last Year"
	
	*MAIZE LAND PREPARATION
	local V BL_MAIZE_PREP
	tab e06_p1, gen(`V')
	la var `V'1 "Primary Maize Plot - Ridging"
	la var `V'2 "Primary Maize Plot - Tilled Flat"
	la var `V'3 "Primary Maize Plot - Zero Tillage"
	forv i=1/3{
	note `V'`i': Primary maize plot
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
	
*SECTION H*
	*ASSET INDEX - PRINCIPAL COMPONENTS INDEX
	pca h*
	local V BL_ASSET_INDEX
	predict `V'
	la var `V' "Asset Index"
	note `V': Asset index from all items in section H (See BL Survey for details).
	
*SECTION I*
	*LIVESTOCK INDEX*
	pca i01-i10
	local V BL_LIVESTOCK_INDEX
	predict `V'
	la var `V' "Livestock Index"
	note `V': Asset index from all items in section H (See BL Survey for details).

*SECTION J*
	*EXTENSION VISITS*
	local V BL_EXTENSION_VISIT
	clonevar `V' = j01
	la var `V'  "Extension Visit in Last Year"
	recode `V' (2=0)
	
	*NO. EXTENSION VISITS*
	local V BL_EXTENSION_VISIT_COUNT
	clonevar `V' = j02
	la var `V' "No. of Extension Visits in Last Year"
	replace `V' = 0 if BL_EXTENSION_VISIT==0

	
*SECTION K*
	*SKIP MEALS*
	local V BL_SKIPMEALS_ADULTS
	clonevar `V' = k03
	la var `V' "Skip Meals in Last Year (Adults)"
	recode `V' (2=0) 

	*SKIP MEALS*
	local V BL_SKIPMEALS_CHILDREN
	clonevar `V' = k05
	la var `V' "Skip Meals in Last Year (Children)"
	recode `V' (2=0) 
	replace `V' = 0 if BL_SKIPMEALS_ADULTS==0

**************************
** STEP 4: SAVE DATASET **
**************************
keep  HHID district vdc asc ward treatment communicator female incentives technology control vdc_no asc_no TREAT* BL*
order HHID district vdc asc ward treatment communicator female incentives technology control vdc_no asc_no TREAT* BL*
save "`DATA'\Balance_Checks.dta", replace



