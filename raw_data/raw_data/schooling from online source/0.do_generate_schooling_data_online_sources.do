


/*****************************************************************************************/
/*****************************************************************************************/
/****************  IMPORT RAW DATA ON SCHOOLING, 1850-1906 from EXCEL FILES **************/
/********************** AND CREATE .dta FILES ********************************************/
/*****************************************************************************************/
/*****************************************************************************************/






*******************************************************************************************************************************************************
********************************************************1850-1876**************************************************************************************
*******************************************************************************************************************************************************

*************************Data on schools 1850-1876********************************************
quietly{
*1. Import raw data
clear
import excel "$folder/Data/raw_data/schooling from online source/schooling.xls", sheet("1850-76a") cellrange(A8:AD98) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V225 {
destring `var', replace
}
*

*2. Renaming variables
quietly{
rename V6 department_name
rename V3 department_id
rename V77 schools_pub1850
rename V78 schools_priv1850
rename V81 schools_pub1863
rename V82 schools_priv1863
rename V167 schools_pub1866
rename V185 schools_priv1866
rename V148 schools_pub1872
rename V188 schools_priv1872
rename V123 schools_pub_lay1850
rename V126 schools_pub_cath1850
rename V130 schools_pub_lay1863
rename V133 schools_pub_cath1863
rename V137 schools_pub_lay1866
rename V140 schools_pub_cath1866
rename V144 schools_pub_lay1872
rename V147 schools_pub_cath1872
rename V151 schools_pub_lay1876
rename V154 schools_pub_cath1876
rename V194 schools_priv_lay1850
rename V197 schools_priv_cath1850
rename V201 schools_priv_lay1863
rename V204 schools_priv_cath1863
rename V208 schools_priv_lay1866
rename V211 schools_priv_cath1866
rename V215 schools_priv_lay1872
rename V218 schools_priv_cath1872
rename V222 schools_priv_lay1876
rename V225 schools_priv_cath1876
}
**



*3. Make panel
reshape long schools_pub schools_priv schools_pub_lay schools_pub_cath schools_priv_lay schools_priv_cath, i(department_id) j(year)


**Mistake in the raw data //double checked with information in the Annuaire Statistique de la France
recode schools_pub_lay 469=460 if department_id==65

**The departments of Ardeche and Ardennes (as well as Rhin (bas) and Rhin (haut)) have the values inverted only for "schools", but ok when disaggragated by types. \\
**Create schools_priv and private also for 1876
gen schools_pub2=schools_pub_lay+schools_pub_cath
replace schools_pub=schools_pub2 if schools_pub!=schools_pub2

gen schools_priv2=schools_priv_lay+schools_priv_cath
replace schools_priv=schools_priv2 if schools_priv!=schools_priv2

drop schools_priv2 schools_pub2


***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/schooling from online source/1850-76a.dta", replace


*************************Data on students 1850-1876*******************************************
quietly{
clear
*1. Import raw data
import excel "$folder/Data/raw_data/schooling from online source/schooling.xls", sheet("1850-76b") cellrange(A7:X97) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V163 {
destring `var', replace
}
*

*2. Renaming variables
quietly{
rename V6 department_name
rename V3 department_id
rename V60 stud_pub1850
rename V63 stud_pub1863
rename V66 stud_pub1866
rename V69 stud_pub1872
rename V72 stud_pub1876
rename V79 stud_priv1850
rename V82 stud_priv1863
rename V85 stud_priv1866
rename V88 stud_priv1872
rename V91 stud_priv1876
rename V94 stud_cath1850
rename V97 stud_cath1863
rename V100 stud_cath1866
rename V103 stud_cath1876
rename V150 stud_pub_lay1850
rename V151 stud_pub_cath1850
rename V154 stud_pub_lay1863
rename V155 stud_pub_cath1863
rename V158 stud_pub_lay1866
rename V159 stud_pub_cath1866
rename V162 stud_pub_lay1876
rename V163 stud_pub_cath1876
}
**

*3. Make panel
reshape long stud_priv stud_pub stud_cath stud_pub_lay stud_pub_cath, i(department_id) j(year)



***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57

}
save "$folder/Data/raw_data/schooling from online source/1850-76b.dta", replace

use "$folder/Data/raw_data/schooling from online source/1850-76a.dta", clear
merge 1:1 department_id year using "$folder/Data/raw_data/schooling from online source/1850-76b.dta", nogen
recode year 1850=1851
recode year 1863=1861
recode year 1872=1871
save "$folder/Data/raw_data/schooling from online source/1850-76.dta", replace


*******************************************************************************************************************************************************
********************************************************1881*******************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
*1. Import raw data
import excel "$folder/Data/raw_data/schooling from online source/schooling.xls", sheet("1881") cellrange(A7:N95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V47 {
destring `var', replace
}
*

*2. Renaming variables
quietly{
rename V6 department_name
rename V3 department_id
rename V119 stud_pub1881
rename V122 stud_priv1881
rename V126 stud_pub_lay1881
rename V129 stud_pub_cath1881
rename V133 stud_priv_lay1881
rename V136 stud_priv_cath1881
rename V23 schools_pub_lay1881
rename V24 schools_pub_cath1881
rename V25 schools_pub1881
rename V45 schools_priv_lay1881
rename V46 schools_priv_cath1881
rename V47 schools_priv1881
}
**


***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/schooling from online source/1881.dta", replace



*******************************************************************************************************************************************************
********************************************************1886*******************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
*1.Import raw data
import excel "$folder/Data/raw_data/schooling from online source/schooling.xls", sheet("1886") cellrange(A7:V95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V157 {
destring `var', replace
}
*

*2. Renaming variables
quietly{
rename V6 department_name
rename V3 department_id
rename V77 schools_elem_pub_lay1886
rename V78 schools_elem_pub_cath1886
rename V82 schools_pub1886
rename V127 schools_sup_mal_pub_lay1886
rename V128 schools_sup_mal_pub_cath1886
rename V146 schools_sup_fem_pub_lay1886
rename V147 schools_sup_fem_pub_cath1886
rename V47 schools_priv1886
rename V93 schools_elem_priv_lay1886
rename V94 schools_elem_priv_cath1886
rename V96 schools_sup_mal_priv_lay1886
rename V97 schools_sup_mal_priv_cath1886
rename V98 schools_sup_fem_priv_lay1886
rename V99 schools_sup_fem_priv_cath1886
rename v146 stud_pub_lay1886
rename V149 stud_pub_cath1886
rename V150 stud_pub1886
rename V153 stud_priv_lay1886
rename V156 stud_priv_cath1886
rename V157 stud_priv1886
}
**

**Mistake in raw data //double checked with original information in the Annuaire Statistique de la France
recode schools_elem_priv_lay1886 (7=77) if department_id==59
recode schools_pub1886 5244=524
recode schools_pub1886 (.=763) if department_id==20


*3. Create variables
gen schools_pub_lay1886= schools_elem_pub_lay1886+schools_sup_mal_pub_lay1886+schools_sup_fem_pub_lay1886
gen schools_pub_cath1886= schools_elem_pub_cath1886+schools_sup_mal_pub_cath1886+schools_sup_fem_pub_cath1886
gen schools_priv_lay1886= schools_elem_priv_lay1886+schools_sup_mal_priv_lay1886+schools_sup_fem_priv_lay1886
gen schools_priv_cath1886= schools_elem_priv_cath1886+ schools_sup_mal_priv_cath1886+schools_sup_fem_priv_cath1886

drop  schools_sup* schools_elem*


***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/schooling from online source/1886.dta", replace




*******************************************************************************************************************************************************
********************************************************1891*******************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
*1. Import raw data
import excel "$folder/Data/raw_data/schooling from online source/schooling.xls", sheet("1891") cellrange(A7:V95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-v84 {
destring `var', replace
}
*

*2. Renaming variables
quietly{
rename V6 department_name
rename V3 department_id
rename V63 schools_elem_pub_lay1891
rename V64 schools_elem_pub_cath1891
rename V68 schools_pub1891
rename V79 schools_elem_priv_lay1891
rename V80 schools_elem_priv_cath1891
rename V82 schools_sup_mal_priv_lay1891
rename V83 schools_sup_mal_priv_cath1891
rename V84 schools_sup_fem_priv_lay1891
rename V85 schools_sup_fem_priv_cath1891
rename V86 schools_priv1891
rename V113 schools_sup_mal_pub_lay1891
rename V131 schools_sup_fem_pub_lay1891
rename V150 schools_sup_mal_pub1891
rename V170 schools_sup_fem_pub1891
rename v68 stud_pub1891
rename V71 stud_priv1891
rename V75 stud_pub_lay1891
rename V78 stud_pub_cath1891
rename v81 stud_priv_lay1891
rename v84 stud_priv_cath1891
}
**


*3. Create variables
gen schools_pub_lay1891= schools_elem_pub_lay1891+schools_sup_mal_pub_lay1891+schools_sup_fem_pub_lay1891
gen schools_pub_cath1891= schools_elem_pub_cath1891
gen schools_priv_lay1891= schools_elem_priv_lay1891+schools_sup_mal_priv_lay1891+schools_sup_fem_priv_lay1891
gen schools_priv_cath1891= schools_elem_priv_cath1891+ schools_sup_mal_priv_cath1891+schools_sup_fem_priv_cath1891


drop schools_elem* schools_sup*

***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/schooling from online source/1891.dta", replace




*******************************************************************************************************************************************************
********************************************************1896*******************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
*1.Import raw data
import excel "$folder/Data/raw_data/schooling from online source/schooling.xls", sheet("1896") cellrange(A7:T95) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V241 {
destring `var', replace
}
*

*2. Renaming variables
quietly{
rename V6 department_name
rename V3 department_id
rename V157 schools_elem_pub_lay1896
rename V158 schools_elem_pub_cath1896
rename V209 schools_sup_mal_pub_lay1896
rename V9 schools_sup_fem_pub_lay1896
rename V163 schools_pub1896
rename V174 schools_elem_priv_lay1896
rename V175 schools_elem_priv_cath1896
rename V177 schools_sup_mal_priv_lay1896
rename V178 schools_sup_mal_priv_cath1896
rename V179 schools_sup_fem_priv_lay1896
rename V180 schools_sup_fem_priv_cath1896
rename V182 schools_priv1896
rename V225 stud_pub1896
rename V228 stud_priv1896
rename V232 stud_pub_lay1896
rename V235 stud_pub_cath1896
rename V238 stud_priv_lay1896
rename V241 stud_priv_cath1896
}
**



*3. Create variables
gen schools_pub_lay1896= schools_elem_pub_lay1896+schools_sup_mal_pub_lay1896+schools_sup_fem_pub_lay1896
gen schools_pub_cath1896= schools_elem_pub_cath1896
gen schools_priv_lay1896= schools_elem_priv_lay1896+schools_sup_mal_priv_lay1896+schools_sup_fem_priv_lay1896
gen schools_priv_cath1896= schools_elem_priv_cath1896+ schools_sup_mal_priv_cath1896+schools_sup_fem_priv_cath1896

drop schools_elem* schools_sup*

***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/schooling from online source/1896.dta", replace



*******************************************************************************************************************************************************
********************************************************1901*******************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
*1.Import raw data
import excel "$folder/Data/raw_data/schooling from online source/schooling.xls", sheet("1901") cellrange(A2:T90) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V90 {
destring `var', replace
}
*

*2. Renaming variables
quietly{
rename V3 department_id
rename V6 department_name
rename V32 stud_pub1901
rename V35 stud_priv1901
rename V39 stud_pub_lay1901
rename V42 stud_pub_cath1901
rename V45 stud_priv_lay1901
rename V48 stud_priv_cath1901
rename V65 schools_elem_pub_lay1901
rename V66 schools_elem_pub_cath1901
rename V68 schools_sup_mal_pub1901
rename V69 schools_sup_fem_pub1901
rename V71 schools_pub1901
rename V82 schools_elem_priv_lay1901
rename V83 schools_elem_priv_cath1901
rename V85 schools_sup_mal_priv_lay1901
rename V86 schools_sup_mal_priv_cath1901
rename V87 schools_sup_fem_priv_lay1901
rename V88 schools_sup_fem_priv_cath1901
rename V90 schools_priv1901
}
**



**different department_id across surveys (and sources)
recode department_id (92=54)
recode department_id (93=76)
recode department_id (68=90)
recode stud_priv_cath1901 (11683=19291) if department_id==12



*3. Create variables
gen schools_pub_lay1901= schools_elem_pub_lay1901+schools_sup_mal_pub1901+schools_sup_fem_pub1901
gen schools_pub_cath1901= schools_elem_pub_cath1901
gen schools_priv_lay1901= schools_elem_priv_lay1901+schools_sup_mal_priv_lay1901+schools_sup_fem_priv_lay1901
gen schools_priv_cath1901= schools_elem_priv_cath1901+ schools_sup_mal_priv_cath1901+schools_sup_fem_priv_cath1901


drop schools_elem* schools_sup*

***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/schooling from online source/1901.dta", replace




*******************************************************************************************************************************************************
********************************************************1906*******************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
*1. Import raw data
import excel "$folder/Data/raw_data/schooling from online source/schooling.xls", sheet("1906") cellrange(A2:T90) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V3-V77 {
destring `var', replace
}
*

*2. Renaming variables
quietly{
rename V3 department_id
rename V6 department_name
rename V63 schools_elem_pub_lay1906
rename V64 schools_elem_pub_cath1906
rename V66 schools_sup_mal_pub1906
rename V67 schools_sup_fem_pub1906
rename V69 schools_pub1906
rename V80 schools_elem_priv_lay1906
rename V81 schools_elem_priv_cath1906
rename V83 schools_sup_mal_priv_lay1906
rename V84 schools_sup_mal_priv_cath1906
rename V85 schools_sup_fem_priv_lay1906
rename V86 schools_sup_fem_priv_cath1906
rename V88 schools_priv1906
rename V61 stud_pub1906
rename v64 stud_priv1906
rename V68 stud_pub_lay1906
rename V71 stud_pub_cath1906
rename V74 stud_priv_lay1906
rename V77 stud_priv_cath1906
}
**



**different department_id across surveys (and sources)
recode department_id (92=54)
recode department_id (93=76)
recode department_id (68=90)




*3. Create variables
gen schools_pub_lay1906= schools_elem_pub_lay1906+schools_sup_mal_pub1906+schools_sup_fem_pub1906
gen schools_pub_cath1906= schools_elem_pub_cath1906
gen schools_priv_lay1906= schools_elem_priv_lay1906+schools_sup_mal_priv_lay1906+schools_sup_fem_priv_lay1906
gen schools_priv_cath1906= schools_elem_priv_cath1906+ schools_sup_mal_priv_cath1906+schools_sup_fem_priv_cath1906


drop schools_elem* schools_sup*

***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/schooling from online source/1906.dta", replace




