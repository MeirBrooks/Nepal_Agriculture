clear
cap log close
log using firstanalysis, text replace
use "/Users/sampadakc/Desktop/Thesis/agriculture/Nepal_Data.dta"
egen id = concat( a03 a05 a07 a08 a09)
unique id
label var id "household id"
keep id m*
order id 
mvdecode m01*, mv(-9=.m\-6=.a)
recode m01* (2=0)
tab m01_1
label define YesNo 0 "No" 1 "Yes" .m "Missing" .a "Don't know", modify 
label values m01* YesNo 
tab m01_1
keep id m01*
reshape long m01_ , i(id) j(sn_member) 

