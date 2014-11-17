clear
cap log close
log using firstanalysis, text replace
use "/Users/sampadakc/Desktop/Thesis/agriculture/Nepal_Data.dta"
egen id = concat( a03 a05 a07 a08 a09)
unique id
label var id "household id"
keep id m*
order id 
mvdecode m01* m02* m03* m04* m05* m06* m07* m08* m09* m10* m11*, mv(-9=.m\-6=.a)
recode m01* (2=0)
tab m01_1
label define YesNo 0 "No" 1 "Yes" .m "Missing" .a "Don't know", modify 
label values m01* YesNo 

keep id m01* m02* m03* m04* m05* m06* m07* m08* m09* m10* m11*
reshape long m01_ m02_ m03_ m04_ m05_ m06_ m07_ m08_ m09_ m10_ m11_ , i(id) j(sn_member) 

