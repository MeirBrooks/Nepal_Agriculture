/********************************************
PROJECT: ICIMOD NEPAL AGRICULTURE

AUTHOR: DEREK WOLFSON

PURPOSE: RANDOMIZATION BALANCE CHECKS - CONDUCT BALANCE CHECKS

INPUTS: Dropbox\Agriculture Extension Worker Project\Analysis\Data\..
			..\Balance_Checks.dta

OUTPUTS:

********************************************/
clear
set more off

************************
** STEP 0: SET LOCALS **
************************
local PROJECT 	"X:\Agriculture Extension Worker Project"
local DATA 		"`PROJECT'\Analysis\data" // BOXCRYPTOR PATH FOR NPL-ICIMOD DATA
local OUT 		"`PROJECT'\Analysis\Output"

***********************
** STEP 1: LOAD DATA **
***********************
use "`DATA'\Balance_Checks.dta"

************************************
** STEP 2: CONDUCT BALANCE CHECKS **
************************************
local BALANCEVARS ///
	BL_FARMTIME1 BL_FARMTIME2 BL_FARMTIME3 BL_PLOTS BL_PLOTS_MAIZE BL_MAIZE_PREP1 BL_MAIZE_PREP2 BL_MAIZE_PREP3 BL_MAIZE_MANURE BL_MAIZE_FERTILIZER1 BL_MAIZE_FERTILIZER2 BL_MAIZE_IC_KNOW BL_MAIZE_IC_USE BL_EXTENSION_VISIT BL_EXTENSION_VISIT_COUNT /// FARM CHARACTERISTICS 
	BL_INCOME BL_ASSET_INDEX BL_LIVESTOCK_INDEX BL_SKIPMEALS_ADULTS BL_SKIPMEALS_CHILDREN BL_IMPROVED_WALLS BL_IMPROVED_ROOF BL_PIPED_WATER /// INCOME + ASSETS + HH CHARACTERISTICS
	BL_CASTE1 BL_CASTE2 BL_CASTE4 /// CASTES (NO MUSLIM -- MULTICOLLINEAR)
	
sum `BALANCEVARS'
	
orth_out `BALANCEVARS' using "`OUT'/Balance_Checks.xls", by(TREATMENT2) se stars pcompare replace vce(cluster ward) colnum sheet(TREATMENT2)
orth_out `BALANCEVARS' using "`OUT'/Balance_Checks.xls", by(TREATMENT3) se stars pcompare vce(cluster ward) colnum sheet(TREATMENT3)

