clear all
set more off
cap file close _all
cap log close
log using "C:\Users\ecarls\Dropbox\Agriculture Extension Worker Project\Analysis\logs\answers-for-mushfiq.smcl", replace
use "C:\Users\ecarls\Dropbox\Agriculture Extension Worker Project\Analysis\data\Baseline-2014-10-20.dta"

//Question 1: Why so many 0's?

tab g01_t
tab g01_g
tab g01_f

//These correspond with the following "missing" values on questions that are never skipped...

tab g21_t 
tab g21_g
tab g21_f

tab g24_t
tab g24_g
tab g24_f

// So we conclude that the large number of missing values comes from people who never even filled out this portion of the survey.

// "Question 2: What about ranges?

// "Question 3: Make the answers percentage based?

// "Question 4: Do the answers differ between crops?
do "C:\Users\ecarls\Dropbox\Agriculture Extension Worker Project\Analysis\code\midline_knowledge_scores\Midline_knowledge_master"

tab midline_crop incentive, row

//Is there a way to make a table for each question? 

cap file close _all
cap log close
