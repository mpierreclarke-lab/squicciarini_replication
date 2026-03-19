clear all
set more off

/*****************************************************************************************/
/*****************************************************************************************/
/****************  IMPORT RAW DATA ON POPULATION 1831-1911 (SEVERAL YEARS) ***************/
/********************** from EXCEL FILES AND CREATE .dta FILES ***************************/
/*****************************************************************************************/
/*****************************************************************************************/




*******************************************************************************************************************************************************
********************************************************YEAR 1831-41***********************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/population.xls", sheet("1831-41") cellrange(A7:D99) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V19 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V18 pop1831
rename V19 pop1841
}
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*
}
save "$folder/Data/raw_data/population from online source/pop_1831-41.dta", replace

  




*******************************************************************************************************************************************************
********************************************************YEAR 1851**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/population.xls", sheet("1851") cellrange(A7:C93) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V71 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V71 pop1851
}
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*
}
save "$folder/Data/raw_data/population from online source/pop_1851.dta", replace

  
  
  
*******************************************************************************************************************************************************
********************************************************YEAR 1861-66************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/population.xls", sheet("1861-66") cellrange(A7:D96) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V8 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V7 pop1861
rename V8 pop1866
}
*

**Mistake in the original data
recode pop1861 553633=353633 if department_id==81


***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
}
save "$folder/Data/raw_data/population from online source/pop_1861-66.dta", replace

 
 
 
*******************************************************************************************************************************************************
********************************************************YEAR 1872-76************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/population.xls", sheet("1872-76") cellrange(A7:F95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V43 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V37 pop1871
rename V38 pop1876
rename V41 pop_urb1871
rename V43 pop_urb1876
}
*
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
}
save "$folder/Data/raw_data/population from online source/pop_1871-76.dta", replace

 
 
*******************************************************************************************************************************************************
********************************************************YEAR 1881-86************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/population.xls", sheet("1881-86") cellrange(A7:F95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V12 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V7 pop_urb1881
rename V9 pop1881
rename V10 pop_urb1886
rename V12 pop1886
}
*
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
}
save "$folder/Data/raw_data/population from online source/pop_1881-86.dta", replace

  

  
*******************************************************************************************************************************************************
********************************************************YEAR 1891-96************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/population.xls", sheet("1891-96") cellrange(A7:F95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V16 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V11 pop_urb1891
rename V13 pop1891
rename V14 pop_urb1896
rename V16 pop1896
}
*
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
}
save "$folder/Data/raw_data/population from online source/pop_1891-96.dta", replace



  
*******************************************************************************************************************************************************
********************************************************YEAR 1901-06************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/population.xls", sheet("1901-06") cellrange(A7:F98) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V61 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V20 pop1901
rename V21 pop1906
rename V44 pop_urb1901
rename V61 pop_urb1906
}
*
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
}
save "$folder/Data/raw_data/population from online source/pop_1901-06.dta", replace



*******************************************************************************************************************************************************
********************************************************YEAR 1911***************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/population.xls", sheet("1911") cellrange(A7:D98) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V53 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V51 pop_urb1911
rename V53 pop1911
}
*
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
}
save "$folder/Data/raw_data/population from online source/pop_1911.dta", replace




