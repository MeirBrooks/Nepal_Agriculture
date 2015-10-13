loc name_do Midline_knowledge_score

cap log close
cap file close _all
log using "${NPL_Agri_github}/logs/`name_do'.smcl", replace

set varabbrev on
set more off

/* PROGRAM DESCRIPTION
Program: Midline_knowledge_score.do
Task: Grades Midline questions (G22-G32)
Project: ICIMOD NEPAL AGRICULTURE
Edited: Seungmin Lee, 16 September 2015 */

/*
INPUTS/OUTPUTS
Inputs:
	"${NPL_Agri_github}/data/Midline_knowledge.dta" - Midline dataset
	"${NPL_Agri_github}/code/Midline_knowledge_scores/Knowledge_answers.do" - Answer keys for midline knowledge questions
	
Outputs:
	"${NPL_Agri_dropbox}/Analysis/output/Midline_knowledge_graded.dta" - dataset including grades and incentive results
*/

/* Open a Midline dataset */
use "${NPL_Agri_github}/data/knowledge_score/Midline_knowledge.dta", clear
notes drop _dta // Drop dataset notes for a new dataset

// Change baseline varibles temporarily to calculate answers
rename BL_G31* BL_G32*
rename BL_G30* BL_G31*
rename BL_G# BL_G#, renumber(22)
tempfile Midline_data
save `Midline_data'

// Define macros for answers 
** This task is done by "Knowledge_answers.do" file
include "${NPL_Agri_github}/code/midline_knowledge_scores/Knowledge_answers.do"

loc crop TOMATO GINGER FRENCH_BEANS
loc round BL MID
loc id_vars A02 A04 A06 A07 A08
local question_no G22 G23 G24 G25 G26 G27 G28 G29 G30 G31 G32
loc G31_fert UREA DAP POTAS
loc G32_fert SANDY_LOAM SANDY LOAM CLAY

/* Grading questions */
/* Correct answers are graded as 1, wrong answers (including missing obs) are graded as 0 */

foreach crops of local crop {
	di "`crops'"
	preserve
	keep if ("`crops'" == midline_crop)  // keeps villages with proper crop only
	foreach rd of local round {
		foreach q_no of local question_no {
			if (inlist("`q_no'","G31","G32")) {
				foreach fert of local `q_no'_fert {
					gen `rd'_`q_no'_`fert'_Correct = 0
					replace `rd'_`q_no'_`fert'_Correct = 1 if (`rd'_`q_no'_`fert' == ``q_no'_`crops'_`fert'')
					replace `rd'_`q_no'_`fert'_Correct = .n if (`rd'_`q_no'_`fert' == .s)
					label var `rd'_`q_no'_`fert'_Correct "Did respondent answer ``rd'_`q_no'_`fert' correctly?"
					}
				}
			else {
				gen `rd'_`q_no'_Correct = 0
				replace `rd'_`q_no'_Correct = 1 if (`rd'_`q_no' >= ``q_no'_`crops'_LB' & `rd'_`q_no' <= ``q_no'_`crops'_UB')
				replace `rd'_`q_no'_Correct = .n if (`rd'_`q_no' == .s)
				label var `rd'_`q_no'_Correct "Did respondent answer `rd'_`q_no' correctly?"
			}
		}
	}
	tempfile knowledge_score_`crops'
	save `knowledge_score_`crops''
	restore
}
use `knowledge_score_TOMATO', clear
append using `knowledge_score_GINGER' `knowledge_score_FRENCH_BEANS'

// Re-change some variables in baseline survey back to the original question numbers
rename BL_G# BL_G#, renumber(21)
rename BL_G31* BL_G30*
rename BL_G32* BL_G31*

/* Calculating average knowlege score at ward level per each round*/
foreach round in BL MID {
	quietly ds `round'*Correct
	loc `round'_Answers `r(varlist)'
	egen `round'_knowledge_score = rowtotal(``round'_Answers')
	replace `round'_knowledge_score = `round'_knowledge_score * (100/`total_qs_answered') // scale to max.point 100
	bys A02 A04 A06 A07: egen Avg_`round'_knowledge_score = mean(`round'_knowledge_score)
	label var `round'_knowledge_score "HH's `round' knowledge score, out of 100"
	label var Avg_`round'_knowledge_score "Ward-level average `round' knowledge score, out of 100"
	sort `id_vars'
}

/* Incentive-decision */
gen incentive = 0
// Incentive threshold: 20% increase AND 0.8 point increase in village-average score
local pct_criteria Avg_MID_knowledge_score >= Avg_BL_knowledge_score * 1.2
local fixed_criteria Avg_MID_knowledge_score >= Avg_BL_knowledge_score + ((0.8/`total_qs_answered')*100)
replace incentive = 1 if (`pct_criteria' & `fixed_criteria')
label var incentive "Does communicator of this village get incentives?"

/* Data Label */
label define YesorNo 0 "No" 1 "Yes"
quietly ds *Correct
label val `r(varlist)' incentive YesorNo

// Dataset notes
notes: Midline_knowledge_graded/ created by `name_do' - `c(username)' - `c(current_date)' 
notes: Created by "Midline_knowledge_score.do"

/* Save */
compress
save "${NPL_Agri_dropbox}/Analysis/data/knowledge_score/Midline_knowledge_graded_ver3.dta", replace

// Close log and exit
cap file close _all
cap log close
exit

/*
***** The codes in the box below has some commands describing data patterns *****
// The lines below shows the list of hh-level baseline scores and midline scores
list BL_knowledge_score MID_knowledge_score if (midline_crop == "TOMATO") 
list BL_knowledge_score MID_knowledge_score if (midline_crop == "GINGER") 
list BL_knowledge_score MID_knowledge_score if (midline_crop == "FRENCH_BEANS") 

// The lines below calculates the different b/w baseline score and midline score and its distribution
gen improvement = MID_knowledge_score - BL_knowledge_score
hist improvement

// The lines below keeps one observation per ward, and shows incentive decision under current design and graph of baseline/midline score per crop
keep A02 A04 A06 A07 Avg_* incentive midline_crop
duplicates drop
tab midline_crop incentive
twoway (kdensity Avg_BL_knowledge_score) (kdensity Avg_MID_knowledge_score) if (midline_crop=="TOMATO")
twoway (kdensity Avg_BL_knowledge_score) (kdensity Avg_MID_knowledge_score) if (midline_crop=="GINGER")
twoway (kdensity Avg_BL_knowledge_score) (kdensity Avg_MID_knowledge_score) if (midline_crop=="FRENCH_BEANS")
*********************************************************************************

// Check the scores for each crop
// Distribution is bothering
// 1) Why are there so many '0's? 
  ex) Go through the questionnaire and understand skipping patterns (some responents might not answer the questions cuz they skipped it)
     It it because they are really missing? or they answered as "don't know" (actually went through the questions)
	  => There are skip codes (g01_t, G01_g, g01_f, etc.)
	  => Label the households who skipped the questions as "correctedly skipped (.s)" instead of giving "0" score.
	  => Baseline data has "g01", so we can figure out whether questions are correctedly skipped or not.
	  => Midline data has "G22" - if the answer is "no intercropping", then the rest of questions are correctedly skipped
	 *** Correct answers should have no corretedly skipped answers. In other words, if a respondents correcteldy skipped some questions, s/he got wrong answers for them.
   2) Gradiing criteria- Answers that slightly differ should also be corrected. (ex. answer is 50cm, but a person answered as 49cm)
    => Not acceptable ranges are set as (+- 10%)
   3) Differences in scores b/w Tomato, Ginger and French Beans
    => Done
   4) Make the score interpretable (out of 100)
    => Done
   
  *** Some households may know nothing at baseline (so their answers are missing ) but knew something at midline (so their answers are non-missing)
  => We should take this into consideration, since this is different from knowing something both at baseline and midline.
  

  
  ** Some wards (ex. 2-13-31-7) ward has some correct answers at baseline, while none of them answered at midline, which is VERY weird.

  
