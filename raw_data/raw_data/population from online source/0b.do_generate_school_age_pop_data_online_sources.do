



/*****************************************************************************************/
/*****************************************************************************************/
/****************  IMPORT RAW DATA ON SCHOOL-AGE POPULATION, 1851-1901 (SEVERAL YEARS) ***/
/********************** from EXCEL FILES AND CREATE .dta FILES ***************************/
/*****************************************************************************************/
/*****************************************************************************************/




*******************************************************************************************************************************************************
********************************************************YEAR 1851**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1851") cellrange(A7:V94) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V208 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V180 mal5
rename V181 fem5
rename V183 mal6
rename V184 fem6
rename V186 mal7
rename V187 fem7
rename V189 mal8
rename V190 fem8
rename V192 mal9
rename V193 fem9
rename V195 mal10
rename V196 fem10
rename V198 mal11
rename V199 fem11
rename V201 mal12
rename V202 fem12
rename V204 mal13
rename V205 fem13
rename V207 mal14
rename V208 fem14
}
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*

foreach var of varlist mal5-fem14 {
rename `var' `var'1851
}
}
save "$folder/Data/raw_data/population from online source/pop_school_age_1851.dta", replace



*******************************************************************************************************************************************************
********************************************************YEAR 1861**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1861") cellrange(A7:F97) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V57 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V53 mal5_9
rename V54 fem5_9
rename V56 mal10_14
rename V57 fem10_14
}
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*

foreach var of varlist mal5_9-fem10_14 {
rename `var' `var'1861
}
}
save "$folder/Data/raw_data/population from online source/pop_school_age_1861.dta", replace




*******************************************************************************************************************************************************
********************************************************YEAR 1866**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1866") cellrange(A7:F97) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V240 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V50 mal5_9
rename V51 fem5_9
rename V239 mal10_14
rename V240 fem10_14
}
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*

foreach var of varlist mal5_9-fem10_14 {
rename `var' `var'1866
}
}
save "$folder/Data/raw_data/population from online source/pop_school_age_1866.dta", replace




*******************************************************************************************************************************************************
********************************************************YEAR 1871**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1871") cellrange(A7:V95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V166 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V12 mal5
rename V13 mal6
rename V14 mal7
rename V15 mal8
rename V16 mal9
rename V17 mal10
rename V18 mal11
rename V19 mal12
rename V20 mal13
rename V21 mal14
rename V157 fem5
rename V158 fem6
rename V159 fem7
rename V160 fem8
rename V161 fem9
rename V162 fem10
rename V163 fem11
rename V164 fem12
rename V165 fem13
rename V166 fem14
}
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*

foreach var of varlist mal5-fem14 {
rename `var' `var'1871
}
}
save "$folder/Data/raw_data/population from online source/pop_school_age_1871.dta", replace




*******************************************************************************************************************************************************
********************************************************YEAR 1876**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1876") cellrange(A7:V95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V65 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V12 mal5
rename V13 mal6
rename V14 mal7
rename V15 mal8
rename V16 mal9
rename V17 mal10
rename V18 mal11
rename V19 mal12
rename V20 mal13
rename V21 mal14
rename V56 fem5
rename V57 fem6
rename V58 fem7
rename V59 fem8
rename V60 fem9
rename V61 fem10
rename V62 fem11
rename V63 fem12
rename V64 fem13
rename V65 fem14
}
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*

foreach var of varlist mal5-fem14 {
rename `var' `var'1876
}
}
save "$folder/Data/raw_data/population from online source/pop_school_age_1876.dta", replace

  

*******************************************************************************************************************************************************
********************************************************YEAR 1881**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1881") cellrange(A7:V95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-v243 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V230 mal5
rename V231 mal6
rename V232 mal7
rename V233 mal8
rename V234 mal9
rename V235 mal10
rename V236 mal11
rename V237 mal12
rename V238 mal13
rename V239 mal14
rename v234 fem5
rename v235 fem6
rename v236 fem7
rename v237 fem8
rename v238 fem9
rename v239 fem10
rename v240 fem11
rename v241 fem12
rename v242 fem13
rename v243 fem14
}
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*
foreach var of varlist mal5-fem14 {
rename `var' `var'1881
}
}
save "$folder/Data/raw_data/population from online source/pop_school_age_1881.dta", replace

  


*******************************************************************************************************************************************************
********************************************************YEAR 1886**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1886") cellrange(A7:V95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V116 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V189 mal5
rename V190 mal6
rename V191 mal7
rename V192 mal8
rename V193 mal9
rename V194 mal10
rename V195 mal11
rename V196 mal12
rename V197 mal13
rename V198 mal14
rename V107 fem5
rename V108 fem6
rename V109 fem7
rename V110 fem8
rename V111 fem9
rename V112 fem10
rename V113 fem11
rename V114 fem12
rename V115 fem13
rename V116 fem14
}
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*
foreach var of varlist mal5-fem14 {
rename `var' `var'1886
}
}
save "$folder/Data/raw_data/population from online source/pop_school_age_1886.dta", replace





*******************************************************************************************************************************************************
********************************************************YEAR 1891**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1891") cellrange(A7:V95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V54 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V121 mal5
rename V122 mal6
rename V123 mal7
rename V124 mal8
rename V125 mal9
rename V127 mal10
rename V128 mal11
rename V129 mal12
rename V130 mal13
rename V131 mal14
rename V44 fem5
rename V45 fem6
rename V46 fem7
rename V47 fem8
rename V48 fem9
rename V50 fem10
rename V51 fem11
rename V52 fem12
rename V53 fem13
rename V54 fem14
}
***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*
foreach var of varlist mal5-fem14 {
rename `var' `var'1891
}
}
save "$folder/Data/raw_data/population from online source/pop_school_age_1891.dta", replace




*******************************************************************************************************************************************************
********************************************************YEAR 1896**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1896") cellrange(A7:V95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V267 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V71 mal5
rename V72 mal6
rename V73 mal7
rename V74 mal8
rename V75 mal9
rename V77 mal10
rename V78 mal11
rename V79 mal12
rename V80 mal13
rename V81 mal14
rename V257 fem5
rename V258 fem6
rename V259 fem7
rename V260 fem8
rename V261 fem9
rename V263 fem10
rename V264 fem11
rename V265 fem12
rename V266 fem13
rename V267 fem14
}

recode fem8 4002684=2684


***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*
foreach var of varlist mal5-fem14 {
rename `var' `var'1896
}
}
save "$folder/Data/raw_data/population from online source/pop_school_age_1896.dta", replace




*******************************************************************************************************************************************************
********************************************************YEAR 1896**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1896") cellrange(A7:V95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V267 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V71 mal5
rename V72 mal6
rename V73 mal7
rename V74 mal8
rename V75 mal9
rename V77 mal10
rename V78 mal11
rename V79 mal12
rename V80 mal13
rename V81 mal14
rename V257 fem5
rename V258 fem6
rename V259 fem7
rename V260 fem8
rename V261 fem9
rename V263 fem10
rename V264 fem11
rename V265 fem12
rename V266 fem13
rename V267 fem14
}

recode fem8 4002684=2684


***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*
foreach var of varlist mal5-fem14 {
rename `var' `var'1896
}
}
save "$folder/Data/raw_data/population from online source/pop_school_age_1896.dta", replace

  



*******************************************************************************************************************************************************
********************************************************YEAR 1901**************************************************************************************
*******************************************************************************************************************************************************

quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/population from online source/pop_school_age.xls", sheet("1901") cellrange(A7:O95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V130 {
destring `var', replace
}

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V71 mal5
rename V72 mal6
rename V73 mal7
rename V74 mal8
rename V75 mal9

rename V257 fem5
rename V258 fem6
rename V259 fem7
rename V260 fem8
rename V261 fem9
rename V110 mal10_14
rename V130 fem10_14
}

recode fem8 4002684=2684

***Use kids who are 10-14 in 1906 --> to compute kids 5-9 in 1901
rename mal10_14 mal5_9
rename fem10_14 fem5_9

***Use kids who are 5-9 in 1896 --> to compute kids 10-14 in 1901
foreach x in mal fem {
rename `x'5 `x'10
rename `x'6 `x'11
rename `x'7 `x'12
rename `x'8 `x'13
rename `x'9 `x'14
}
egen mal10_14=rowtotal(mal10-mal14)
egen fem10_14=rowtotal(fem10-fem14)



***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57 | department_id==99
*
keep department_id department_name mal5_9 fem5_9 mal10_14 fem10_14 
foreach var of varlist mal5_9-fem10_14 {
rename `var' `var'1901
}
}

save "$folder/Data/raw_data/population from online source/pop_school_age_1901.dta", replace

  
     
  
  
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
