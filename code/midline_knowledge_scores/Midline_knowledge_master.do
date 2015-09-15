clear all
set more off
if "`c(username)'" == "Seungmin Lee"{
	global dropbox "C:/Users/SLee/Dropbox"
	global NPL_Agri "C:/Users/SLee/Dropbox/Agriculture Extension Worker Project"
}
	
/*****************************************************************
PROJECT: ICIMOD NEPAL AGRICULTURE
			
Author: Seungmin Lee / Edited 15 September 2015
Description: Prepares midline_knowledge dataset and calculates score with incentive decision
	
Programs Required: 
	sxpose.ado - SSC

******************************************************************/

* Prepare midline knowledge dataset from raw data
do "${NPL_Agri}/Analysis/code/midline_knowledge_scores/Midline_knowledge_prep.do"

	/*
	Inputs:
		"${NPL_Agri}\docs\Section G 22 to G 32_LS.xlsx" - Midline knowledge responses
		"${NPL_Agri}\Analysis\data\Baseline-2014-10-20.dta" - Baseline data
			
	Outputs:
		"${NPL_Agri}\Analysis\data\Midline_knowledge.dta" - Midline knowledge dataset
	*/

* Calculate knowledge scores and incentive decision
do "${NPL_Agri}/Analysis/code/midline_knowledge_scores/Midline_knowledge_score.do"

	/*
	Inputs:
		"${NPL_Agri}\Analysis\data\Midline_knowledge.dta" - Midline knowledge dataset
		"${NPL_Agri}\Analysis\code\Midline_knowledge_scores\Knowledge_answers.do" - Answer keys for midline knowledge questions
				
	Outputs:
		"${NPL_Agri}\Analysis\data\Midline_knowledge_graded.dta" - Midline knowledge dataset with scores and incentive decisions
	*/
