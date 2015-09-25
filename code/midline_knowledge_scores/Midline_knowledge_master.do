clear all
set more off
if "`c(username)'" == "Seungmin Lee"{
	global github "C:/Users/SLee/Documents/GitHub"
	global dropbox "C:/Users/SLee/Dropbox"
} 
else if "`c(username)'" == "ecarls"{
	global dropbox "C:/Users/ecarls/Dropbox"
	global NPL_Agri "C:/Users/ecarls/Dropbox/Agriculture Extension Worker Project"
} 
global NPL_Agri_github "${github}/Nepal_Agriculture"
global NPL_Agri_dropbox "${dropbox}/Agriculture Extension Worker Project"
/*****************************************************************
PROJECT: ICIMOD NEPAL AGRICULTURE
			
Author: Seungmin Lee / Edited 25 September 2015
Description: Prepares midline_knowledge dataset and calculates score with incentive decision
	
Programs Required: 
	sxpose.ado - SSC

******************************************************************/

* Prepare midline knowledge dataset from raw data
do "${NPL_Agri_github}/code/midline_knowledge_scores/Midline_knowledge_prep.do"

	/*
	INPUTS/OUTPUTS
	Inputs:
	"${NPL_Agri_dropbox}/Analysis/data/Baseline_Section_G.dta" - Section G of Baseline data
		This dataset is the revised version of the original dataet (Baseline-2014-10-20.dta)
	"${NPL_Agri_dropbox}/Analysis/data/Midline_Section G 22 to G 32-2015-09-25.xlsx" - Midline test data
	
	Outputs:
	"${NPL_Agri_github}/Analysis/data/knowledge_score/Midline_knowledge.dta" - dataset including responses
	*/

* Calculate knowledge scores and incentive decision
do "${NPL_Agri_github}/code/midline_knowledge_scores/Midline_knowledge_score.do"

	/*
	INPUTS/OUTPUTS
	Inputs:
		"${NPL_Agri_github}/data/Midline_knowledge.dta" - Midline knowledge dataset
		"${NPL_Agri_github}/code/Midline_knowledge_scores/Knowledge_answers.do" - Answer keys for midline knowledge questions
				
	Outputs:
		"${NPL_Agri_dropbox}/Analysis/data/Midline_knowledge_graded_ver3.dta" - Midline knowledge dataset with scores and incentive decisions
	*/
