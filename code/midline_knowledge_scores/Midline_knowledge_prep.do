ssc install sxpose
loc name_do Midline_knowledge_prep

cap log close
cap file close _all
log using "${NPL_Agri}/Analysis/logs/`name_do'.smcl", replace

set varabbrev on
set more off

/* PROGRAM DESCRIPTION
Program: Midline_knowledge_prep.do
Task: Import mid-line knowledge test response (G22-G32)
Project: ICIMOD NEPAL AGRICULTURE
Edited: Seungmin Lee, 15 September 2015 */

/*
Required User Written Command
	sxpose : transpose dataset including string variable
*/
/*
INPUTS/OUTPUTS
Inputs:
	"${NPL_Agri}/Analysis/data/Section G 22 to G 32_LS.xlsx" - Midline test data
	"${NPL_Agri}/Analysis/data/Baseline-2014-10-20.dta" - Baseline data
	
Outputs:
	"${NPL_Agri}\Analysis\data\knowledge_score\Midline_knowledge.dta" - dataset including responses
*/

// Declare local macros
loc crops TOMATO GINGER "FRENCH BEANS"
loc id_vars A02 A04 A06 A07 A08
loc all_questions G22 G23 G24 G25 G26 G27 G28 G29 G30 G31* G32*
loc numeric_questions G22 G23 G24 G25 G26 G27 G28 G29 G30

// import baseline dataset and save 3 different versions for each crop
foreach crop in t g f{
	use "${NPL_Agri}/Analysis/data/Baseline-2014-10-20", clear
	rename (a03 a05 a07 a08 a09) (`id_vars') // rename baseline id variables to be merged with midline dataset
	keep `id_vars' g2*`crop'* g30*`crop'?? g31*`crop'?? // keep one crop only
	if ("`crop'" != "t") { // Drop non-graded questions
		drop g20*
	}
	rename *_`crop'* **
	rename *, upper
	rename (G30_1 G30_2 G30_3 G31_1 G31_2 G31_3 G31_4) (G30_UREA G30_DAP G30_POTAS G31_SANDY G31_SANDY_LOAM G31_LOAM G31_CLAY)
	// (Junk) rename G# G#, renumber(22) // renumber questions from baseline to midline
	drop G30_4
	rename G* BL_G*
	tempfile baseline_survey_`crop'
	save `baseline_survey_`crop'', replace
}

// Prepare midline dataset
// Open raw excel spreadsheet and retrieve name, label and answer keys for each variable
foreach var of loc crops {
	import excel "${NPL_Agri}\Analysis\data\Section G 22 to G 32_LS.xlsx", sheet("`var'") clear
	drop if (length(B) != 3) // Keep proper rows only
	
	forval i=1/16 { // Retrieve variable information
		loc vname`i'=B[`i']
		loc label`i'=C[`i']
		loc notes`i'=D[`i']
	}
	drop A-G

	// Transpose data and apply retrieved information
	sxpose, clear force
	forval i=1/16 {
		note _var`i': `notes`i''
		label var _var`i' "`label`i''"
		rename _var`i' `vname`i''
	}
	// Make a crop category variable
	gen str midline_crop = "`var'"
	replace midline_crop = "FRENCH_BEANS" if ("`var'" == "FRENCH BEANS")
	label var midline_crop "What crop questions did farmers in this village answer in mindilne survey?"
		
	drop if (A02 == ".")
	isid `id_vars' // Check whehter id-variables identify observations uniquely.
	
	// Clean datasets
	replace G22 = "0" if regexm(G22, "No")
	destring `id_vars' `numeric_questions', replace force
	foreach var in G31 G32 {
		replace `var' = upper(`var')
		replace `var' = trim(`var')
		replace `var' = itrim(`var')
	}

	// Clean Q31
	foreach var in UREA DAP POTAS {
		gen G31_`var' = regexm(G31, "`var'")
		replace G31_`var' = 2 if (G31_`var' == 0)
		label var G31_`var' "Should `var' be used?"
	}

	// Clean Q32
	foreach var in SANDY_LOAM SANDY LOAM CLAY {
		if ("`var'" == "SANDY_LOAM") {
			gen G32_`var' = regexm(G32, "SANDY LOAM")
			replace G32 = subinstr(G32,"SANDY LOAM", "SL",.)
		}
		else {
			gen G32_`var' = regexm(G32, "`var'")
		}
		replace G32_`var' = 2 if (G32_`var' == 0)
		label var G32_`var' "Should `var' be used?"
	}
	
	drop G31 G32 // Drop unnecessary variables
	rename G* MID_G*
	
	loc mergecrop = midline_crop
	tempfile midline_test_`mergecrop'
	save `midline_test_`mergecrop''
}


// Merge each midline crop data with baseilne data
tempfile knowledge_TOMATO knowledge_GINGER knowledge_FRENCH_BEANS

/// merge tomato
use `midline_test_TOMATO', clear
merge 1:1 `id_vars' using `baseline_survey_t', nogen keep(match)
save `knowledge_TOMATO', replace

/// merge ginger
use `midline_test_GINGER', clear
merge 1:1 `id_vars' using `baseline_survey_g', nogen keep(match)
save `knowledge_GINGER', replace

/// merge french beans
use `midline_test_FRENCH_BEANS', clear
merge 1:1 `id_vars' using `baseline_survey_f', nogen keep(match)
save `knowledge_FRENCH_BEANS', replace


/// append each crop data into single dataset
append using `midline_test_TOMATO' `midline_test_GINGER'
sort `id_vars'
order `id_vars' BL* MID* midline_crop 


// Dataset notes
notes: Midline_knowledge / created by `name_do' - `c(username)' - `c(current_date)' 
notes: Created by "Midline_knowledge_prep.do"

// Save		
compress
save "${NPL_Agri}/Analysis/data/knowledge_score/Midline_knowledge.dta", replace

// Close log and exit
cap file close _all
cap log close
exit

/* Junk works
// label define village_crop 1 "TOMATO" 2 "GINGER" 3 "FRENCH BEANS"
// label val village_crop village_crop
