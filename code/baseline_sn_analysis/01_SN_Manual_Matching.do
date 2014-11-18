/*****************************************************************
PROJECT: 	NEPAL AGRICULTURE - ICIMOD
PURPOSE: 	MANUAL MATCHING PROGRAM TO BE INCLUDED IN 
			00_SN_CLEANING.DO.  
			
AUTHORS: 	SAMPADA KC (YALE)
			DEREK WOLFSON (IPA)
			
NOTES: 		THIS CODE PREPARES ALL NAMES IN THE SOCIAL NETWORK 
			SECTION (M) TO MATCH THE NAMES PROVIDED IN THE 
			BASELINE SURVEY.  THIS WILL ALLOW US TO MATCH SN HHH
			NAMES TO HHIDS. 
*******************************************************************/

//WARD #######
br a10 a08 a12 m00_* if ward_id=="02125"
	*SN 01*
	
	*SN02*
	
	*SN03*
	
	*SN04*
	
	*SN05*
	
	*SN06*
	
	*SN07*
	
	*SN08*
	
	*SN09*



//WARD 02125
br a10 a08 a12 m00_1 if ward_id=="02125"
	*SN01*
	
	*SN02*
	
	*SN03*
	
	*SN04*
	
	*SN05*
	
	*SN06*
	
	*SN07*
	
	*SN08*
	
	*SN09*
	

