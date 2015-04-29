/* Based on: 
By Seungmin Lee, 24 Apr 2015 */

/* PROGRAM DESCRIPTION
program: baseline_grading.do
task: Grades baseline questions (G21-G31)
project: ICIMOD NEPAL AGRICULTURE */

/* Locate Dropbox */
if "`c(username)'" == "Seungmin"{
	global dropbox "C:\Users\Seungmin\Dropbox"
	}

/* Open a baseline dataset */
cd "${dropbox}\Agriculture Extension Worker Project\Analysis\data"
use Baseline-2014-10-20.dta, clear
tempfile temp1 
save "`temp1'" 
loc ward a08

// Keep ward identifier and question variables to be graded
keep `ward' g2* g30* g31*

/* Define macros for answers */
/* If the correct answer is blank, then macro value should be a dot(.)*/
local G21_t_Correct 2
local G21_g_Correct 1
local G21_f_Correct 1

local G22_t_Lower_Bound .
local G22_t_Upper_Bound .
local G22_g_Lower_Bound 100
local G22_g_Upper_Bound 160
local G22_f_Lower_Bound 30
local G22_f_Upper_Bound 50

local G23_t_Lower_Bound 20
local G23_t_Upper_Bound 50
local G23_g_Lower_Bound 20
local G23_g_Upper_Bound 40
local G23_f_Lower_Bound 30
local G23_f_Upper_Bound 50

local G24_t_Lower_Bound 1
local G24_t_Upper_Bound 2
local G24_g_Lower_Bound 1
local G24_g_Upper_Bound 2
local G24_f_Lower_Bound 1
local G24_f_Upper_Bound 2

local G25_t_Lower_Bound 1
local G25_t_Upper_Bound 2
local G25_g_Lower_Bound 1
local G25_g_Upper_Bound 2
local G25_f_Lower_Bound 1
local G25_f_Upper_Bound 2

local G26_t_Correct 1
local G26_g_Correct 1
local G26_f_Correct 2

local G27_t_Lower_Bound 30
local G27_t_Upper_Bound 50
local G27_g_Lower_Bound 25
local G27_g_Upper_Bound 45
local G27_f_Lower_Bound .
local G27_f_Upper_Bound .

local G28_t_Lower_Bound 30
local G28_t_Upper_Bound 60
local G28_g_Lower_Bound 15
local G28_g_Upper_Bound 60
local G28_f_Lower_Bound .
local G28_f_Upper_Bound .

local G29_t_Lower_Bound 1
local G29_t_Upper_Bound 2
local G29_g_Lower_Bound 1
local G29_g_Upper_Bound 2
local G29_f_Lower_Bound .
local G29_f_Upper_Bound .

local G30_t_1_Correct 1
local G30_t_2_Correct 2
local G30_t_3_Correct 1
local G30_g_1_Correct 2
local G30_g_2_Correct 2
local G30_g_3_Correct 1
local G30_f_1_Correct 1
local G30_f_2_Correct 2
local G30_f_3_Correct 1

local G31_t_1_Correct 2
local G31_t_2_Correct 1
local G31_t_3_Correct 1
local G31_t_4_Correct 2
local G31_g_1_Correct 1
local G31_g_2_Correct 1
local G31_g_3_Correct 1
local G31_g_4_Correct 2
local G31_f_1_Correct 1
local G31_f_2_Correct 1
local G31_f_3_Correct 2
local G31_f_4_Correct 2

// Categorize questions based on the number of answers
// Q1 is the questions with single answer and Q2 is the questions with ranged answers

local Q1 21 26 30 31			
local Q2 22 23 24 25 27 28 29

/* Grading Q1 questions */
/* Correct answers are graded as "1", wrong answers (including "missing(-9)") are graded as "0" */
/* Missing observations (.) are graded as ".m", and "-6" is graded as ".x" */

foreach i in `Q1' {
	foreach j in t g f {
		if (`i' == 30) {
			foreach k in 1 2 3 {
				gen g`i'_`j'_`k'_correct = 0
				replace g`i'_`j'_`k'_correct = 1 if (g`i'_`j'_`k' == `G`i'_`j'_`k'_Correct')
				replace g`i'_`j'_`k'_correct = .m if inlist(g`i'_`j'_`k',.)
				replace g`i'_`j'_`k'_correct = .x if inlist(g`i'_`j'_`k',-6)
				la var g`i'_`j'_`k'_correct "Did respondent answer G`i'_`j'_`k' correctly?"
				}
			}
		else if (`i' == 31) {
			foreach k in 1 2 3 4 {
				gen g`i'_`j'_`k'_correct = 0
				replace g`i'_`j'_`k'_correct = 1 if (g`i'_`j'_`k' == `G`i'_`j'_`k'_Correct')
				replace g`i'_`j'_`k'_correct = .m if inlist(g`i'_`j'_`k',.)
				replace g`i'_`j'_`k'_correct = .x if inlist(g`i'_`j'_`k',-6)
				la var g`i'_`j'_`k'_correct "Did respondent answer G`i'_`j'_`k' correctly?"
				}
			}
		else {
			gen g`i'_`j'_correct = 0
			replace g`i'_`j'_correct = 1 if (g`i'_`j' == `G`i'_`j'_Correct')
			replace g`i'_`j'_correct = .m if inlist(g`i'_`j',.)
			replace g`i'_`j'_correct = .x if inlist(g`i'_`j',-6)
			la var g`i'_`j'_correct "Did respondent answer G`i'_`j' correctly?"
			}
		}
}

/* Grading Q2 Questions */
/* Similar grading policy to that of Q1 questions, but slighty different */
/* If a correct answer of G21/G26 is "No" but the respondent answered "Yes",
   then the respondent got "0" through G22-G23/G27-G29, even if their answers are either missing(.) or -6 */

foreach i in `Q2' {
	foreach j in t g f {
		gen g`i'_`j'_correct = 0
		replace g`i'_`j'_correct = 1 if (g`i'_`j' <= `G`i'_`j'_Upper_Bound' & g`i'_`j' >= `G`i'_`j'_Lower_Bound')
		replace g`i'_`j'_correct = .m if (g`i'_`j' == .)
		replace g`i'_`j'_correct = .x if (g`i'_`j' == -6)
		/* Regrading certain Q2 questions */
		/* Some questions have "blank" as correct answers */
		if (`i' == 22 | `i' == 23) {
			if (`G21_`j'_Correct' == 2) {
				replace g`i'_`j'_correct = 1 if ((g21_`j'_correct == 1) & inlist(g`i'_`j'_correct,-9,.m))
				replace g`i'_`j'_correct = 0 if (inlist(g21_`j'_correct,0,.x))
			}
		}
		if (`i' == 27 | `i' == 28 |`i' == 29) {
			if (`G26_`j'_Correct' == 2) {
				replace g`i'_`j'_correct = 1 if ((g26_`j'_correct == 1) & inlist(g`i'_`j'_correct,-9,.m))
				replace g`i'_`j'_correct = 0 if (inlist(g26_`j'_correct,0,.x))
			}
		}
		la var g`i'_`j'_correct "Did respondent answer G`i'_`j' correctly?"
	}
}

/* Create an individual baseline knowledge score variable and grade */
gen indiv_knowledge_score = 0
loc score indiv_knowledge_score
label var `score' "Individual Knowledge Score (G21-G31)"

forv i = 21/31 {
	foreach j in t g f {
		if (`i' == 30) {
			foreach k in 1 2 3 {
				replace `score' = `score' + 1 if (g`i'_`j'_`k'_correct == 1)
			}
		}
		else if (`i' == 31) {
			foreach k in 1 2 3 4 {
				replace `score' = `score' + 1 if (g`i'_`j'_`k'_correct == 1)
			}
		}
		else {
			replace `score' = `score' + 1 if (g`i'_`j'_correct == 1)
		}
	}
}

/* Calculating average knowlege score at ward level */
bys `ward': egen avg_ward_knowledge_score = mean(`score')
label var avg_ward_knowledge_score "Average knowledge score at ward level"
/* Save */
save "baseline_indiv_graded.dta", replace

/* Junk Works

forv i=22/31 {
	foreach j in t g f {
		if (`i' == 30) {
			foreach k in 1 2 3 {
				replace bl_knowledge_score = bl_knowledge_score + g`i'_`j'_`k'_correct
				}
			}
		else if (`i' == 31) {
			foreach k in 1 2 3 4 {
				replace bl_knowledge_score = bl_knowledge_score + g`i'_`j'_`k'_correct
				}
			}
		else {
			replace bl_knowledge_score = bl_knowledge_score + g`i'_`j'_correct
			}
		}
	}

		
	di `i'
}


local var x*

foreach vari in `var'{
	count if `vari' == 1
	}


/* Grading questions with single answers*/


local var 1 2 3
foreach i in `var' {
	gen match`i' = 0
	replace match`i' = 1 if (x`i' == y`i')
	}
	
replace y = 3 if inlist(x,`G21_Correct_Tom')


local Q1	g21_t g21_g g21_f g26_t g26_g g26_f ///
			g30_t_1 g30_t_2 g30_t_3 g30_t_4	///
			g30_g_1 g30_g_2 g30_g_3 g30_g_4 ///
			g30_f_1 g31_f_2 g30_f_3 g30_f_4 ///
			g31_t_1 g31_t_2 g31_t_3 g31_t_4 ///
			g31_g_1 g31_g_2 g31_g_3 g31_g_4 ///
			g31_f_1 g31_f_2 g31_f_3 g31_f_4

			
			
foreach i in `Q2' {
	foreach j in t g f {
		gen g`i'_`j'_correct = 0
		replace g`i'_`j'_correct = 1 if (g`i'_`j' <= `G`i'_`j'_Upper_Bound' & g`i'_`j' >= `G`i'_`j'_Lower_Bound')
		replace g`i'_`j'_correct = .m if (g`i'_`j' == . | g`i'_`j' == -9)
		if (`i' == 22 | `i' == 23) {
			replace g`i'_`j'_correct = 1 if ((`G21_`j'_Correct' == 2) & (g21_`j'_correct == 1) & (g`i'_`j' == . | g`i'_`j' == -9))
			replace g`i'_`j'_correct = 0 if ((g21_`j'_correct != 1) & ((g21_`j' == .) | (g21_`j' == -9)))
			}
		else if (`i' == 27 | `i' == 28 |`i' == 29) {
			replace g`i'_`j'_correct = 1 if ((`G26_`j'_Correct' == 2) & (g26_`j'_correct == 1) & (g`i'_`j' == . | g`i'_`j' == -9))
			replace g`i'_`j'_correct = 0 if ((g26_`j'_correct != 1) & ((g26_`j' == .) | (g26_`j' == -9)))
			}
		replace g`i'_`j'_correct = . if (g`i'_`j' == -6)
		la var g`i'_`j'_correct "Did respondent answer G`i'_`j' correctly?"
	}
}


di `G22_t_Upper_Bound'
assert (missing(`G22_t_Upper_Bound'))


gen g22_t_correct = 0
gen g22_g_correct = 0
replace g22_t_correct = 1 if ((g22_t <= `G22_t_Upper_Bound') & (g22_t >= `G22_t_Lower_Bound'))
replace g22_g_correct = 1 if ((g22_g <= `G22_g_Upper_Bound') & (g22_g >= `G22_g_Lower_Bound'))
replace g22_t_correct = .m if (g22_t == .)
replace g22_g_correct = .m if (g22_g == .)
replace g22_t_correct = .x if (g22_t == -6)
replace g22_g_correct = .x if (g22_g == -6)



if (`G21_t_Correct' == 2) {
	replace g22_t_correct = 1 if ((g21_t_correct == 1) & (g22_t_correct == -9))
	replace g22_t_correct = 0 if ((g21_t_correct == 0) & ((g22_t_correct == .m) | (g22_t_correct == .x)))
}


