

/*****************************************************************************************/
/*****************************************************************************************/
/****************  IMPORT RAW DATA ON INDUSTRIAL EMPLOYMENT, 1866-1911  ******************/
/********************** from EXCEL FILES AND CREATE .dta FILES ***************************/
/*****************************************************************************************/
/*****************************************************************************************/

/*Dataset contruction
- In this dataset, I compute the share of industrial employment from raw sources.
- Agriculture and industry have been recorded consistenly throughout.
- The other sectors are sometimes reported together and other times separately (examples are: trade and transport, or public administration and liberal professions).
*/



*******************************************************************************************************************************************************
**************************************************FOR PANEL ANALYSIS***********************************************************************************
*******************************************************************************************************************************************************


*******************************************************************************************************************************************************
********************************************************YEAR 1866**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1866") cellrange(A7:AF96) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V137 {
destring `var', replace
}

/*
1. Sectors included: Agriculture, Industry, Trade, Liberal, Other 1 (related with Agr, Ind, Trade), Other 2 (other professions)
2. Population active. In 1866, this is divided into: bosses, workers (ouvriers+journaliers), employees
*/

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V189 pop_m_agr_boss
rename V190 pop_f_agr_boss
rename V193 pop_m_agr_empl
rename V194 pop_f_agr_empl
rename V197 pop_m_agr_work
rename V198 pop_f_agr_work
rename V234 pop_m_ind_boss
rename V235 pop_f_ind_boss
rename V238 pop_m_ind_empl
rename V239 pop_f_ind_empl
rename V242 pop_m_ind_work
rename V243 pop_f_ind_work
rename V38 pop_m_com_boss
rename V39 pop_f_com_boss
rename V42 pop_m_com_empl
rename V43 pop_f_com_empl
rename V81 pop_m_other_boss
rename V82 pop_f_other_boss
rename V85 pop_m_other_empl
rename V86 pop_f_other_empl
rename V89 pop_m_other_work
rename V90 pop_f_other_work
rename V119 pop_m_other_boss2
rename V120 pop_f_other_boss2
rename V123 pop_m_other_empl2
rename V124 pop_f_other_empl2
rename V132 pop_m_lib_boss
rename V133 pop_f_lib_boss
rename V136 pop_m_lib_empl
rename V137 pop_f_lib_empl
}
*

**Generate active population (for each sector and total).
egen agr1866=rowtotal(pop_m_agr_boss-pop_f_agr_work)
egen ind1866=rowtotal(pop_m_ind_boss-pop_f_ind_work)
egen com1866=rowtotal(pop_m_com_boss-pop_f_com_empl)
egen lib1866=rowtotal(pop_m_lib_boss-pop_f_lib_empl)
egen other1866=rowtotal(pop_m_other_boss-pop_f_other_empl2)

gen other_sect1866=com1866+lib1866+other1866

gen act1866=agr1866+ind1866+com1866+other1866+lib1866


**Generate share of active population in industry
gen share_ind_act1866= ind1866/act1866
keep depart* agr1866 ind1866 other_sect1866 act1866 share_ind_act1866

label var ind1866 "Population active in Industry 1866"
label var act1866 "Population active 1866"
label var share_ind_act1866 "Share Ind. Employment, 1866"

***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/employment from online source/empl_1866.dta", replace

  

*******************************************************************************************************************************************************
********************************************************YEAR 1871**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1871") cellrange(A7:DJ95) firstrow
foreach var of varlist _all {
 label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-v179 {
destring `var', replace
}

/*
1. Sectors included: Agriculture (by subsector), Industry (by subsector), Trade (by subsector), Liberal (by subsector), Public Administration (by subsector)
2. Population active. In 1871, worker categories are differing for each detailed subsector, depending on its specific features. We can still easily compute total active population for each sector. 

*/

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V215 pop_m_agr1
rename V216 pop_f_agr1
rename V224 pop_m_agr2
rename V225 pop_f_agr2
rename V233 pop_m_agr3
rename V234 pop_f_agr3
rename V242 pop_m_agr4
rename V243 pop_f_agr4
rename V251 pop_m_agr5
rename V252 pop_f_agr5
rename V260 pop_m_agr6
rename V261 pop_f_agr6
rename V269 pop_m_agr7
rename V270 pop_f_agr7
rename V7 pop_m_ind1
rename V8 pop_f_ind1
rename V16 pop_m_ind2
rename V17 pop_f_ind2
rename V25 pop_m_ind3
rename V26 pop_f_ind3
rename V34 pop_m_ind4
rename V35 pop_f_ind4
rename V43 pop_m_ind5
rename V44 pop_f_ind5
rename V52 pop_m_ind6
rename V53 pop_f_ind6
rename V61 pop_m_ind7
rename V62 pop_f_ind7
rename V70 pop_m_ind8
rename V71 pop_f_ind8
rename V79 pop_m_ind9
rename V80 pop_f_ind9
rename V88 pop_m_ind10
rename V89 pop_f_ind10
rename V97 pop_m_com1
rename V98 pop_f_com1
rename V106 pop_m_com2
rename V107 pop_f_com2
rename V115 pop_m_com3
rename V116 pop_f_com3
rename V124 pop_m_com4
rename V125 pop_f_com4
rename V133 pop_m_com5
rename V134 pop_f_com5
rename V142 pop_m_com6
rename V143 pop_f_com6
rename V151 pop_m_com7
rename V152 pop_f_com7
rename V160 pop_m_com8
rename V161 pop_f_com8
rename V169 pop_m_com9
rename V170 pop_f_com9
rename V178 pop_m_com10
rename V179 pop_f_com10
rename V187 pop_m_com11
rename V188 pop_f_com11
rename V196 pop_m_com12
rename V197 pop_f_com12
rename V205 pop_m_com13
rename V206 pop_f_com13
rename V214 pop_m_com14
rename v215 pop_f_com14
rename V223 pop_m_com15
rename v224 pop_f_com15
rename V232 pop_m_com16
rename v233 pop_f_com16
rename V241 pop_m_com17
rename v242 pop_f_com17
rename V250 pop_m_com18
rename v251 pop_f_com18
rename V259 pop_m_com19
rename v260 pop_f_com19
rename V268 pop_m_com20
rename v269 pop_f_com20
rename V277 pop_m_lib1
rename V278 pop_f_lib1
rename V286 pop_m_lib2
rename V287 pop_f_lib2
rename v7 pop_m_lib3
rename v8 pop_f_lib3
rename v16 pop_m_lib4
rename v17 pop_f_lib4
rename v52 pop_m_pub_adm1
rename v53 pop_f_pub_adm1
rename v61 pop_m_pub_adm2
rename v62 pop_f_pub_adm2
rename v70 pop_m_pub_adm3
rename v71 pop_f_pub_adm3
rename v79 pop_m_lib8
rename v80 pop_f_lib8
rename v88 pop_m_lib9
rename v89 pop_f_lib9
rename v97 pop_m_lib10
rename v98 pop_f_lib10
rename v106 pop_m_lib11
rename v107 pop_f_lib11
rename v115 pop_m_lib12
rename v116 pop_f_lib12
rename v124 pop_m_lib13
rename v125 pop_f_lib13
rename v133 pop_m_lib14
rename v134 pop_f_lib14
rename v142 pop_m_lib15
rename v143 pop_f_lib15
rename v151 pop_m_lib16
rename v152 pop_f_lib16
rename v160 pop_m_lib17
rename v161 pop_f_lib17
rename v169 pop_m_lib18
rename v170 pop_f_lib18
rename v178 pop_m_lib19
rename v179 pop_f_lib19
}
*

**Generate active population (for each sector and total)
egen agr1871=rowtotal(pop_m_agr1-pop_f_agr7)
egen ind1871=rowtotal(pop_m_ind1-pop_f_ind10)
egen com1871=rowtotal(pop_m_com1-pop_f_com20)
egen lib1871a=rowtotal(pop_m_lib1-pop_f_lib4)
egen lib1871b=rowtotal(pop_m_lib8-pop_f_lib19)
gen lib1871=lib1871a+lib1871b
egen pub_adm1871=rowtotal(pop_m_pub_adm1-pop_f_pub_adm3)

gen other_sect1871=com1871+lib1871+pub_adm1871

gen act1871=agr1871+ind1871+com1871+lib1871+pub_adm1871

**Generate share of active population in industry
gen share_ind_act1871=(ind1871)/(act1871)
keep depart* ind1871 agr1871 act1871 other_sect1871 share_ind_act1871
label var ind1871 "Population active in Industry 1871"
label var act1871 "Population active 1871"
label var share_ind_act1871 "Share Ind. Employment, 1871"

***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/employment from online source/empl_1871", replace


*******************************************************************************************************************************************************
********************************************************YEAR 1876**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1876") cellrange(A8:DJ96) firstrow
foreach var of varlist _all {
  label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V190 {
destring `var', replace
}

/*
1. Sectors considered: Agriculture (by sebsector), Industry (by sebsector), Trade, Liberal (by sebsector), Public Admin 
2. Population active. In 1876, this is divided into: bosses, employees, workers, journaliers

*/



*Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V197 pop_m_agr_boss1
rename V198 pop_f_agr_boss1
rename V199 pop_m_agr_empl1
rename V200 pop_f_agr_empl1
rename V201 pop_m_agr_work1
rename V202 pop_f_agr_work1
rename V203 pop_m_agr_jour1
rename V204 pop_f_agr_jour1
rename V212 pop_m_agr_boss2
rename V213 pop_f_agr_boss2
rename V214 pop_m_agr_empl2
rename V215 pop_f_agr_empl2
rename V216 pop_m_agr_work2
rename V217 pop_f_agr_work2
rename V218 pop_m_agr_jour2
rename V219 pop_f_agr_jour2
rename V227 pop_m_agr_boss3
rename V228 pop_f_agr_boss3
rename V229 pop_m_agr_empl3
rename V230 pop_f_agr_empl3
rename V231 pop_m_agr_work3
rename V232 pop_f_agr_work3
rename V233 pop_m_agr_jour3
rename V234 pop_f_agr_jour3
rename V242 pop_m_ind_boss1
rename V243 pop_f_ind_boss1
rename V244 pop_m_ind_empl1
rename V245 pop_f_ind_empl1
rename V246 pop_m_ind_work1
rename V247 pop_f_ind_work1
rename V248 pop_m_ind_jour1
rename V249 pop_f_ind_jour1
rename V33 pop_m_ind_boss2
rename V34 pop_f_ind_boss2
rename V35 pop_m_ind_empl2
rename V36 pop_f_ind_empl2
rename V37 pop_m_ind_work2
rename V38 pop_f_ind_work2
rename V39 pop_m_ind_jour2
rename V40 pop_f_ind_jour2
rename V48 pop_m_com_boss
rename V49 pop_f_com_boss
rename V50 pop_m_com_empl
rename V51 pop_f_com_empl
rename V52 pop_m_com_work
rename V53 pop_f_com_work
rename V54 pop_m_com_jour
rename V55 pop_f_com_jour
rename V78 pop_m_lib_boss1
rename V79 pop_f_lib_boss1
rename V80 pop_m_lib_empl1
rename V81 pop_f_lib_empl1
rename V82 pop_m_lib_work1
rename V83 pop_f_lib_work1
rename V84 pop_m_lib_jour1
rename V85 pop_f_lib_jour1
rename V93 pop_m_lib_boss2
rename V94 pop_f_lib_boss2
rename V95 pop_m_lib_empl2
rename V96 pop_f_lib_empl2
rename V97 pop_m_lib_work2
rename V98 pop_f_lib_work2
rename V99 pop_m_lib_jour2
rename V100 pop_f_lib_jour2
rename V108 pop_m_pub_adm_boss
rename V109 pop_f_pub_adm_boss
rename V110 pop_m_pub_adm_empl
rename V111 pop_f_pub_adm_empl
rename V112 pop_m_pub_adm_work
rename V113 pop_f_pub_adm_work
rename V114 pop_m_pub_adm_jour
rename V115 pop_f_pub_adm_jour
rename V123 pop_m_lib_boss3
rename V124 pop_f_lib_boss3
rename V125 pop_m_lib_empl3
rename V126 pop_f_lib_empl3
rename V127 pop_m_lib_work3
rename V128 pop_f_lib_work3
rename V129 pop_m_lib_jour3
rename V130 pop_f_lib_jour3
rename V138 pop_m_lib_boss4
rename V139 pop_f_lib_boss4
rename V140 pop_m_lib_empl4
rename V141 pop_f_lib_empl4
rename V142 pop_m_lib_work4
rename V143 pop_f_lib_work4
rename V144 pop_m_lib_jour4
rename V145 pop_f_lib_jour4
rename V153 pop_m_lib_boss5
rename V154 pop_f_lib_boss5
rename V155 pop_m_lib_empl5
rename V156 pop_f_lib_empl5
rename V157 pop_m_lib_work5
rename V158 pop_f_lib_work5
rename V159 pop_m_lib_jour5
rename V160 pop_f_lib_jour5
rename V168 pop_m_lib_boss6
rename V169 pop_f_lib_boss6
rename V170 pop_m_lib_empl6
rename V171 pop_f_lib_empl6
rename V172 pop_m_lib_work6
rename V173 pop_f_lib_work6
rename V174 pop_m_lib_jour6
rename V175 pop_f_lib_jour6
rename V183 pop_m_lib_boss7
rename V184 pop_f_lib_boss7
rename V185 pop_m_lib_empl7
rename V186 pop_f_lib_empl7
rename V187 pop_m_lib_work7
rename V188 pop_f_lib_work7
rename V189 pop_m_lib_jour7
rename V190 pop_f_lib_jour7
}

*

**Generate active population (for each sector and total)
egen agr1876=rowtotal(pop_m_agr_boss1-pop_f_agr_jour3)
egen ind1876=rowtotal(pop_m_ind_boss1-pop_f_ind_jour2)
egen com1876=rowtotal(pop_m_com_boss-pop_f_com_jour)
egen lib1876a=rowtotal(pop_m_lib_boss1-pop_f_lib_jour2)
egen lib1876b=rowtotal(pop_m_lib_boss3-pop_f_lib_jour7)
gen lib1876=lib1876a+lib1876b
egen pub_adm1876=rowtotal(pop_m_pub_adm_boss-pop_f_pub_adm_jour)

gen other_sect1876=com1876+lib1876+pub_adm1876

gen act1876=agr1876+ind1876+com1876+lib1876+pub_adm1876


**Generate share of active population in industry
gen share_ind_act1876=(ind1876)/(act1876)
keep depart*  agr1876 ind1876  other_sect1876 act1876 share_ind_act1876
label var ind1876 "Population active in Industry 1876"
label var act1876 "Population active 1876"
label var share_ind_act1876 "Share Ind. Employment, 1876"

***Departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/employment from online source/empl_1876.dta", replace


*******************************************************************************************************************************************************
********************************************************YEAR 1881**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1881") cellrange(A8:DP96) firstrow
foreach var of varlist _all {
  label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-v27 {
destring `var', replace
}
/*
1. Sectors included: Agriculture (by subsector), Industry (by subsector), Trade (by subsector), Transport (by subsector), 
Liberal (by subsector), Public admin
2. Population active. In 1881, this is divided into: bosses, workers (ouvriers+journaliers), employees

*/
*Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V149 pop_m_agr_boss1
rename V150 pop_f_agr_boss1
rename V151 pop_m_agr_empl1
rename V152 pop_f_agr_empl1
rename V153 pop_m_agr_work1
rename V154 pop_f_agr_work1
rename V164 pop_m_agr_boss2
rename V165 pop_f_agr_boss2
rename V166 pop_m_agr_empl2
rename V167 pop_f_agr_empl2
rename V168 pop_m_agr_work2
rename V169 pop_f_agr_work2
rename V179 pop_m_agr_boss3
rename V180 pop_f_agr_boss3
rename V181 pop_m_agr_empl3
rename V182 pop_f_agr_empl3
rename V183 pop_m_agr_work3
rename V184 pop_f_agr_work3
rename V194 pop_m_agr_boss4
rename V195 pop_f_agr_boss4
rename V196 pop_m_agr_empl4
rename V197 pop_f_agr_empl4
rename V198 pop_m_agr_work4
rename V199 pop_f_agr_work4
rename V209 pop_m_ind_boss1
rename V210 pop_f_ind_boss1
rename V211 pop_m_ind_empl1
rename V212 pop_f_ind_empl1
rename V213 pop_m_ind_work1
rename V214 pop_f_ind_work1
rename V224 pop_m_ind_boss2
rename V225 pop_f_ind_boss2
rename V226 pop_m_ind_empl2
rename V227 pop_f_ind_empl2
rename V228 pop_m_ind_work2
rename V229 pop_f_ind_work2
rename V7 pop_m_ind_boss3
rename V8 pop_f_ind_boss3
rename V9 pop_m_ind_empl3
rename V10 pop_f_ind_empl3
rename V11 pop_m_ind_work3
rename V12 pop_f_ind_work3
rename V22 pop_m_com_boss1
rename V23 pop_f_com_boss1
rename V24 pop_m_com_empl1
rename V25 pop_f_com_empl1
rename V26 pop_m_com_work1
rename V27 pop_f_com_work1
rename V37 pop_m_com_boss2
rename V38 pop_f_com_boss2
rename V39 pop_m_com_empl2
rename V40 pop_f_com_empl2
rename V41 pop_m_com_work2
rename V42 pop_f_com_work2
rename V52 pop_m_com_boss3
rename V53 pop_f_com_boss3
rename V54 pop_m_com_empl3
rename V55 pop_f_com_empl3
rename V56 pop_m_com_work3
rename V57 pop_f_com_work3
rename V67 pop_m_transport_boss1
rename V68 pop_f_transport_boss1
rename V69 pop_m_transport_empl1
rename V70 pop_f_transport_empl1
rename V71 pop_m_transport_work1
rename V72 pop_f_transport_work1
rename V82 pop_m_transport_boss2
rename V83 pop_f_transport_boss2
rename V84 pop_m_transport_empl2
rename V85 pop_f_transport_empl2
rename V86 pop_m_transport_work2
rename V87 pop_f_transport_work2
rename V124 pop_m_pub_adm_boss1
rename V125 pop_f_pub_adm_boss1
rename V126 pop_m_pub_adm_empl1
rename V127 pop_f_pub_adm_empl1
rename V128 pop_m_pub_adm_work1
rename V129 pop_f_pub_adm_work1
rename V139 pop_m_lib_boss1
rename V140 pop_m_lib_empl1
rename V141 pop_f_lib_empl1
rename V142 pop_m_lib_work1
rename V143 pop_f_lib_work1
rename v153 pop_m_lib_boss2
rename v154 pop_f_lib_boss2
rename v155 pop_m_lib_empl2
rename v156 pop_f_lib_empl2
rename V157 pop_m_lib_work2
rename V158 pop_f_lib_work2
rename v168 pop_m_lib_boss3
rename v169 pop_m_lib_empl3
rename v170 pop_f_lib_empl3
rename v171 pop_m_lib_work3
rename V172 pop_f_lib_work3
rename v182 pop_m_lib_boss4
rename v183 pop_f_lib_boss4
rename v184 pop_m_lib_empl4
rename v185 pop_f_lib_empl4
rename v186 pop_m_lib_work4
rename V187 pop_f_lib_work4
rename v197 pop_m_lib_boss5
rename v198 pop_f_lib_boss5
rename v199 pop_m_lib_empl5
rename v200 pop_f_lib_empl5
rename v201 pop_m_lib_work5
rename v202 pop_f_lib_work5
rename v7 pop_m_lib_boss6
rename v8 pop_f_lib_boss6
rename v9 pop_m_lib_empl6
rename v10 pop_f_lib_empl6
rename v11 pop_m_lib_work6
rename v12 pop_f_lib_work6
rename v22 pop_m_lib_boss7
rename v23 pop_f_lib_boss7
rename v24 pop_m_lib_empl7
rename v25 pop_f_lib_empl7
rename v26 pop_m_lib_work7
rename v27 pop_f_lib_work7
}

*

**Generate active population (for each sector and total)
egen agr1881=rowtotal(pop_m_agr_boss1-pop_f_agr_work4)
egen ind1881=rowtotal(pop_m_ind_boss1-pop_f_ind_work3)
egen com1881=rowtotal(pop_m_com_boss1-pop_f_com_work3)
egen lib1881=rowtotal(pop_m_lib_boss1-pop_f_lib_work7)
egen transport1881=rowtotal(pop_m_transport_boss1-pop_f_transport_work2)
egen pub_adm1881=rowtotal(pop_m_pub_adm_boss1-pop_f_pub_adm_work1)

gen other_sect1881=com1881 +transport1881 +lib1881+pub_adm1881


gen act1881=ind1881+agr1881+com1881 +transport1881 +lib1881+pub_adm1881

gen share_ind_act1881=(ind1881)/(act1881)



keep depart* ind1881 act1881 share_ind_act1881 agr1881 other_sect1881
label var ind1881 "Population active in Industry 1881"
label var act1881 "Population active 1881"
label var share_ind_act1881 "Share Ind. Employment, 1881"

***Departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/employment from online source/empl_1881.dta", replace


*******************************************************************************************************************************************************
********************************************************YEAR 1886**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1886") cellrange(A8:AL96) firstrow
foreach var of varlist _all {
  label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V116 {
destring `var', replace
}
/*
1. Sectors included: Agriculture, Industry, Trade, Transport, Liberal, Public admin
2. Population active. In 1886, this is divided into: bosses, workers (ouvriers+journaliers), employees

*/

**Renaming variables
quietly{
rename V6 department_name
rename V3 department_id
rename V221 pop_m_lib_boss1886
rename V222 pop_f_lib_boss1886
rename V223 pop_m_lib_empl1886
rename V224 pop_f_lib_empl1886
rename V225 pop_m_lib_work1886
rename V226 pop_f_lib_work1886
rename V190 pop_m_pub_adm_boss1886
rename V191 pop_f_pub_adm_boss1886
rename V192 pop_m_pub_adm_empl1886
rename V193 pop_f_pub_adm_empl1886
rename V194 pop_m_pub_adm_work1886
rename V195 pop_f_pub_adm_work1886
rename V7 pop_m_transport_boss1886
rename V8 pop_f_transport_boss1886
rename V9 pop_m_transport_empl1886
rename V10 pop_f_transport_empl1886
rename V11 pop_m_transport_work1886
rename V12 pop_f_transport_work1886
rename V215 pop_m_ind_boss1886
rename V216 pop_f_ind_boss1886
rename V217 pop_m_ind_empl1886
rename V218 pop_f_ind_empl1886
rename V219 pop_m_ind_work1886
rename V220 pop_f_ind_work1886
rename V229 pop_m_agr_boss1886
rename V230 pop_f_agr_boss1886
rename V231 pop_m_agr_empl1886
rename V232 pop_f_agr_empl1886
rename V233 pop_m_agr_work1886
rename V234 pop_f_agr_work1886
rename V111 pop_m_com_boss1886
rename V112 pop_f_com_boss1886
rename V113 pop_m_com_empl1886
rename V114 pop_f_com_empl1886
rename V115 pop_m_com_work1886
rename V116 pop_f_com_work1886
}


**Generate active population (for each sector and total)

egen agr1886=rowtotal(pop_m_agr_boss1886-pop_f_agr_work1886)
egen ind1886=rowtotal(pop_m_ind_boss1886-pop_f_ind_work1886)
egen com1886=rowtotal(pop_m_com_boss1886-pop_f_com_work1886)
egen transport1886=rowtotal(pop_m_transport_boss1886-pop_f_transport_work1886)
egen lib1886=rowtotal(pop_m_lib_boss1886-pop_f_lib_work1886)
egen pub_adm1886=rowtotal(pop_m_pub_adm_boss1886-pop_f_pub_adm_work1886)

gen act1886=agr1886+ind1886+com1886+transport1886+lib1886+pub_adm1886

gen other_sect1886=com1886+transport1886+lib1886+pub_adm1886



gen share_ind_act1886=(ind1886)/(act1886)
keep depart*  agr1886 ind1886 other_sect1886 act1886 share_ind_act1886
label var ind1886 "Population active in Industry 1886"
label var act1886 "Population active 1886"
label var share_ind_act1886 "Share Ind. Employment, 1886"

***Departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/employment from online source/empl_1886.dta", replace


*******************************************************************************************************************************************************
********************************************************YEAR 1891**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1891") cellrange(A7:AL95) firstrow

foreach var of varlist _all {
  label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-v98 {
destring `var', replace
}
/*
1. Sectors included: Agriculture, Industry, Trade, Transport, Liberal, Public admin 
2. Population active. In 1891, this is divided into: bosses, workers (ouvriers+journaliers), employees
*/
*Renaming Variables

quietly{
rename V6 department_name
rename V3 department_id
rename V281 pop_m_agr_boss1891
rename V285 pop_f_agr_boss1891
rename V10 pop_m_agr_empl1891
rename V14 pop_f_agr_empl1891
rename V22 pop_m_agr_work1891
rename V26 pop_f_agr_work1891
rename V94 pop_m_ind_boss1891
rename V98 pop_f_ind_boss1891
rename V106 pop_m_ind_empl1891
rename V110 pop_f_ind_empl1891
rename V118 pop_m_ind_work1891
rename V122 pop_f_ind_work1891
rename V190 pop_m_transport_boss1891
rename V194 pop_f_transport_boss1891
rename V202 pop_m_transport_empl1891
rename V206 pop_f_transport_empl1891
rename V214 pop_m_transport_work1891
rename V218 pop_f_transport_work1891
rename v34 pop_m_com_boss1891
rename v38 pop_f_com_boss1891
rename V46 pop_m_com_empl1891
rename V50 pop_f_com_empl1891
rename V58 pop_m_com_work1891
rename V62 pop_f_com_work1891
rename v226 pop_m_pub_adm_boss1891
rename v230 pop_f_pub_adm_boss1891
rename V238 pop_m_pub_adm_empl1891
rename V242 pop_f_pub_adm_empl1891
rename V250 pop_m_pub_adm_work1891
rename V254 pop_f_pub_adm_work1891
rename v70 pop_m_lib_boss1891
rename v74 pop_f_lib_boss1891
rename V82 pop_m_lib_empl1891
rename V86 pop_f_lib_empl1891
rename v94 pop_m_lib_work1891
rename v98 pop_f_lib_work1891
}
*

**Generate active population (for each sector and total)
egen agr1891=rowtotal(pop_m_agr_boss1891-pop_f_agr_work1891)
egen ind1891=rowtotal(pop_m_ind_boss1891-pop_f_ind_work1891)
egen com1891=rowtotal(pop_m_com_boss1891-pop_f_com_work1891)
egen lib1891=rowtotal(pop_m_lib_boss1891-pop_f_lib_work1891)
egen transport1891=rowtotal(pop_m_transport_boss1891-pop_f_transport_work1891)
egen pub_adm1891=rowtotal(pop_m_pub_adm_boss1891-pop_f_pub_adm_work1891)


gen act1891=agr1891+ind1891+com1891+transport1891+lib1891+pub_adm1891

gen other_sect1891=com1891+transport1891+lib1891+pub_adm1891




gen share_ind_act1891=(ind1891)/(act1891)

keep depart* ind1891 agr1891 other_sect1891 act1891 share_ind_act1891
label var ind1891 "Population active in Industry 1891"
label var act1891 "Population active 1891"
label var share_ind_act1891 "Share Ind. Employment, 1891"
***Departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57

}
save "$folder/Data/raw_data/employment from online source/empl_1891.dta", replace



*******************************************************************************************************************************************************
********************************************************YEAR 1896**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1896") cellrange(A1:BT90) firstrow

foreach var of varlist _all {
  label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V3-V282 {
destring `var', replace
}
/*
1. Sectors included: Agriculture, Industry (2 subsectors), Trade, Transport, Liberal, Public admin 
2. Population active. In 1896, this is divided into: bosses, workers+employees, (temporary) unemployed, undefined role, and workers isolated
*/
*Renaming Variables

quietly{
rename V3 department_id
rename V6 department_name
rename V68 pop_m_agr_ns1896
rename V69 pop_f_agr_ns1896
rename V70 pop_m_agr_boss1896
rename V71 pop_f_agr_boss1896
rename V72 pop_m_agr_work1896
rename V73 pop_f_agr_work1896
rename V76 pop_m_agr_unempl1896
rename V77 pop_f_agr_unempl1896
rename V78 pop_m_agr_w_is1896
rename V79 pop_f_agr_w_is1896
rename V97 pop_m_min_ns1896
rename V98 pop_f_min_ns1896
rename V99 pop_m_min_boss1896
rename V100 pop_f_min_boss1896
rename V101 pop_m_min_work1896
rename V102 pop_f_min_work1896
rename V105 pop_m_min_unempl1896
rename V106 pop_f_min_unempl1896
rename V107 pop_m_min_w_is1896
rename V108 pop_f_min_w_is1896
rename V126 pop_m_trans_ns1896
rename V127 pop_f_trans_ns1896
rename V128 pop_m_trans_boss1896
rename V129 pop_f_trans_boss1896
rename V130 pop_m_trans_work1896
rename V131 pop_f_trans_work1896
rename V134 pop_m_trans_unempl1896
rename V135 pop_f_trans_unempl1896
rename V136 pop_m_trans_w_is1896
rename V137 pop_f_trans_w_is1896
rename V155 pop_m_transport_ns1896
rename V156 pop_f_transport_ns1896
rename V157 pop_m_transport_boss1896
rename V158 pop_f_transport_boss1896
rename V159 pop_m_transport_work1896
rename V160 pop_f_transport_work1896
rename V163 pop_m_transport_unempl1896
rename V164 pop_f_transport_unempl1896
rename V165 pop_m_transport_w_is1896
rename V166 pop_f_transport_w_is1896
rename V184 pop_m_com_ns1896
rename V185 pop_f_com_ns1896
rename V186 pop_m_com_boss1896
rename V187 pop_f_com_boss1896
rename V188 pop_m_com_work1896
rename V189 pop_f_com_work1896
rename V192 pop_m_com_unempl1896
rename V193 pop_f_com_unempl1896
rename V194 pop_m_com_w_is1896
rename V195 pop_f_com_w_is1896
rename V213 pop_m_lib_ns1896
rename V214 pop_f_lib_ns1896
rename V215 pop_m_lib_boss1896
rename V216 pop_f_lib_boss1896
rename V217 pop_m_lib_work1896
rename V218 pop_f_lib_work1896
rename V221 pop_m_lib_unempl1896
rename V222 pop_f_lib_unempl1896
rename V223 pop_m_lib_w_is1896
rename V224 pop_f_lib_w_is1896
rename V271 pop_m_pub_adm_ns1896
rename V272 pop_f_pub_adm_ns1896
rename V273 pop_m_pub_adm_boss1896
rename V274 pop_f_pub_adm_boss1896
rename V275 pop_m_pub_adm_work1896
rename V276 pop_f_pub_adm_work1896
rename V279 pop_m_pub_adm_unempl1896
rename V280 pop_f_pub_adm_unempl1896
rename V281 pop_m_pub_adm_w_is1896
rename V282 pop_f_pub_adm_w_is1896
}



*

egen agr1896=rowtotal(pop_m_agr_ns1896-pop_f_agr_w_is1896)
egen ind1896=rowtotal(pop_m_min_ns1896-pop_f_trans_w_is1896)
egen com1896=rowtotal(pop_m_com_ns1896-pop_f_com_w_is1896)
egen transport1896=rowtotal(pop_m_transport_ns1896-pop_f_transport_w_is1896)
egen lib1896=rowtotal(pop_m_lib_ns1896-pop_f_lib_w_is1896)
egen pub_adm1896=rowtotal(pop_m_pub_adm_ns1896-pop_f_pub_adm_w_is1896)

gen act1896= agr1896+ind1896+com1896+transport1896+lib1896+pub_adm1896
gen other_sect1896=com1896+transport1896+lib1896+pub_adm1896

collapse (sum) ind1896 agr1896 other_sect1896 act1896, by (department_id)
gen share_ind_act1896=(ind1896)/(act1896)

keep depart* ind1896 share_ind_act1896 ind1896 agr1896 other_sect1896 act1896
label var ind1896 "Population active in Industry 1896"
label var act1896 "Population active 1896"
label var share_ind_act1896 "Share Ind. Employment, 1896"
***Departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57

}
save "$folder/Data/raw_data/employment from online source/empl_1896.dta", replace



*******************************************************************************************************************************************************
********************************************************YEAR 1901**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
***Importing original data (source: insee)
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1901") cellrange(A7:AZ97) firstrow


foreach var of varlist _all {
  label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V252 {
destring `var', replace
}

/*
1. Sectors included: Agriculture, Industry, Trade, Liberal
2. Population active. In 1901, this is divided into: bosses, workers, employees, (temporary) unemployed, undefined role, and workers isolated
*/

*Renaming Variables
quietly{
rename V3 department_id
rename V198 pop_m_ns1901
rename V199 pop_m_agr_nd1901
rename V200 pop_m_agr_boss1901
rename V201 pop_m_agr_empl1901
rename V202 pop_m_agr_work1901
rename V203 pop_m_agr_unempl1901
rename V204 pop_m_agr_w_is1901
rename V205 pop_m_ind_nd1901
rename V206 pop_m_ind_boss1901
rename V207 pop_m_ind_empl1901
rename V208 pop_m_ind_work1901
rename V209 pop_m_ind_unempl1901
rename V210 pop_m_ind_w_is1901
rename V211 pop_m_com_nd1901
rename V212 pop_m_com_boss1901
rename V213 pop_m_com_empl1901
rename V214 pop_m_com_work1901
rename V215 pop_m_com_unempl1901
rename V216 pop_m_com_w_is1901
rename V219 pop_m_lib_nd1901
rename V220 pop_m_lib_boss1901
rename V221 pop_m_lib_empl1901
rename V222 pop_m_lib_work1901
rename V223 pop_m_lib_unempl1901
rename V224 pop_m_lib_w_is1901
rename V226 pop_f_ns1901
rename V227 pop_f_agr_nd1901
rename V228 pop_f_agr_boss1901
rename V229 pop_f_agr_empl1901
rename V230 pop_f_agr_work1901
rename V231 pop_f_agr_unempl1901
rename V232 pop_f_agr_w_is1901
rename V233 pop_f_ind_nd1901
rename V234 pop_f_ind_boss1901
rename V235 pop_f_ind_empl1901
rename V236 pop_f_ind_work1901
rename V237 pop_f_ind_unempl1901
rename V238 pop_f_ind_w_is1901
rename V239 pop_f_com_nd1901
rename V240 pop_f_com_boss1901
rename V241 pop_f_com_empl1901
rename V242 pop_f_com_work1901
rename V243 pop_f_com_unempl1901
rename V244 pop_f_com_w_is1901
rename V247 pop_f_lib_nd1901
rename V248 pop_f_lib_boss1901
rename V249 pop_f_lib_empl1901
rename V250 pop_f_lib_work1901
rename V251 pop_f_lib_unempl1901
rename V252 pop_f_lib_w_is1901
}

**

foreach x in m f {

gen agr_`x'1901=pop_`x'_agr_work+pop_`x'_agr_boss+pop_`x'_agr_empl+pop_`x'_agr_nd+ pop_`x'_agr_unempl+ pop_`x'_agr_w_is
gen ind_`x'1901=pop_`x'_ind_work+pop_`x'_ind_boss+pop_`x'_ind_empl+pop_`x'_ind_nd+ pop_`x'_ind_unempl+ pop_`x'_ind_w_is
gen com_`x'1901=pop_`x'_com_work+pop_`x'_com_boss+pop_`x'_com_empl+pop_`x'_com_nd+ pop_`x'_com_unempl+ pop_`x'_com_w_is
gen lib_`x'1901=pop_`x'_lib_work+pop_`x'_lib_boss+pop_`x'_lib_empl+pop_`x'_lib_nd+ pop_`x'_lib_unempl+ pop_`x'_lib_w_is
gen act_`x'1901=agr_`x'1901+ind_`x'1901+com_`x'1901+lib_`x'1901
gen other_sect_`x'1901=com_`x'1901+lib_`x'1901
}


* summing the 2 genders for each category 
foreach x in ind  agr other_sect  act {
gen `x'1901=`x'_f1901+`x'_m1901
}
*


gen share_ind_act1901=(ind1901)/(act1901)
keep depart* ind1901 act1901 share_ind_act1901 agr1901 other_sect1901
label var ind1901 "Population active in Industry 1901"
label var act1901 "Population active 1901"
label var share_ind_act1901 "Share Ind. Employment, 1901"

***Departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57

}

save "$folder/Data/raw_data/employment from online source/empl_1901.dta", replace
*



*******************************************************************************************************************************************************
********************************************************YEAR 1906**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1906") cellrange(A1:BJ89) firstrow

foreach var of varlist _all {
  label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V3-V93{
destring `var', replace
}
/*
1. Sectors: Agriculture, Industry, Trade, Liberal
2. Population active. In 1906, this is divided into: bosses, workers, employees, (temporary) unemployed, and workers isolated
*/

*Renaming Variables
quietly{
rename V3 department_id
rename V6 department_name
rename V13 pop_agr_boss1906
rename V14 pop_agr_empl1906
rename V15 pop_agr_work1906
rename V16 pop_agr_unempl1906
rename V17 pop_agr_w_is1906
rename V18 pop_ind_boss1906
rename V19 pop_ind_empl1906
rename V20 pop_ind_work1906
rename V21 pop_ind_unempl1906
rename V22 pop_ind_w_is1906
rename V23 pop_com_boss1906
rename V24 pop_com_empl1906
rename V25 pop_com_work1906
rename V26 pop_com_unempl1906
rename V27 pop_com_w_is1906
rename V31 pop_lib_boss1906
rename V32 pop_lib_empl1906
rename V33 pop_lib_work1906
rename V34 pop_lib_unempl1906
rename V35 pop_lib_w_is1906
}

egen agr1906=rowtotal(pop_agr_boss1906-pop_agr_w_is1906)
egen ind1906=rowtotal(pop_ind_boss1906-pop_ind_w_is1906)
egen com1906=rowtotal(pop_com_boss1906-pop_com_w_is1906)
egen lib1906=rowtotal(pop_lib_boss1906-pop_lib_w_is1906)


gen act1906=agr1906+ind1906+com1906+lib1906

gen other_sect1906=com1906+lib1906


gen share_ind_act1906=(ind1906)/(act1906)
keep depart* ind1906 act1906 share_ind_act1906 agr1906 other_sect1906
label var ind1906 "Population active in Industry 1906"
label var act1906 "Population active 1906"
label var share_ind_act1906 "Share Ind. Employment, 1906"

***Departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57

}
save "$folder/Data/raw_data/employment from online source/empl_1906.dta", replace
*


*******************************************************************************************************************************************************
********************************************************YEAR 1911**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1911") cellrange(A1:Q89) firstrow


foreach var of varlist _all {
  label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V28 {
destring `var', replace
}

/*
1. Sectors: Agriculture, Industry, Trade, Liberal, Public Administration
2. Population active. In 1911, this is divided into: bosses, workers, employees, (temporary) unemployed
*/

*Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V12 pop_agr_boss1911
rename V13 pop_agr_work1911
rename V14 pop_agr_unempl1911
rename V15 pop_ind_boss1911
rename V16 pop_ind_empl1911
rename V17 pop_ind_work1911
rename V18 pop_ind_unempl1911
rename V19 pop_com_boss1911
rename V20 pop_com_empl1911
rename V21 pop_com_unempl1911
rename V22 pop_lib_boss1911
rename V23 pop_lib_empl1911
rename V24 pop_lib_unempl1911
rename V27 pop_pub_adm_empl1911
rename V28 pop_pub_adm_work1911
}


*
gen agr1911=pop_agr_boss1911 +pop_agr_work1911+pop_agr_unempl1911
gen ind1911=pop_ind_boss1911+pop_ind_empl1911+pop_ind_work1911+pop_ind_unempl1911
gen com1911=pop_com_boss1911+pop_com_empl1911+pop_com_unempl1911
gen lib1911=pop_lib_boss1911+ pop_lib_empl1911+pop_lib_unempl1911
gen pub_adm1911=pop_pub_adm_empl1911+pop_pub_adm_work1911


gen act1911=agr1911+ind1911+com1911+lib1911+pub_adm1911
gen other_sect1911=com1911+lib1911+pub_adm1911


gen share_ind_act1911=(ind1911)/(act1911)

keep depart* ind1911 act1911 share_ind_act1911 agr1911 other_sect1911
label var ind1911 "Population active in Industry 1911"
label var act1911 "Population active 1911"
label var share_ind_act1911 "Share Ind. Employment, 1911"

***Departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57

}
save "$folder/Data/raw_data/employment from online source/empl_1911.dta", replace









*******************************************************************************************************************************************************
****************************************FOR CROSS-SECTIONAL ANALYSIS (focusing on workers)*************************************************************
*******************************************************************************************************************************************************



*******************************************************************************************************************************************************
********************************************************YEAR 1866**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
**Import raw data
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1866") cellrange(A7:AF96) firstrow

foreach var of varlist _all {
 label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V137 {
destring `var', replace
}

/*
1. Sectors included: Agriculture, Industry, Trade, Liberal, Other 1 (related with Agr, Ind, Trade), Other 2 (other professions)
2. Population active. In 1866, this is divided into:  bosses, workers (ouvriers+journaliers), employees
*/

**Renaming Variables
quietly{
rename V6 department_name
rename V3 department_id
rename V189 pop_m_agr_boss
rename V190 pop_f_agr_boss
rename V193 pop_m_agr_empl
rename V194 pop_f_agr_empl
rename V197 pop_m_agr_work
rename V198 pop_f_agr_work
rename V234 pop_m_ind_boss
rename V235 pop_f_ind_boss
rename V238 pop_m_ind_empl
rename V239 pop_f_ind_empl
rename V242 pop_m_ind_work
rename V243 pop_f_ind_work
rename V38 pop_m_com_boss
rename V39 pop_f_com_boss
rename V42 pop_m_com_empl
rename V43 pop_f_com_empl
rename V81 pop_m_other_boss
rename V82 pop_f_other_boss
rename V85 pop_m_other_empl
rename V86 pop_f_other_empl
rename V89 pop_m_other_work
rename V90 pop_f_other_work
rename V119 pop_m_other_boss2
rename V120 pop_f_other_boss2
rename V123 pop_m_other_empl2
rename V124 pop_f_other_empl2
rename V132 pop_m_lib_boss
rename V133 pop_f_lib_boss
rename V136 pop_m_lib_empl
rename V137 pop_f_lib_empl
}
*

**Generate number of workers (in industry and total).
gen ind_workers1866=pop_m_ind_work+pop_f_ind_work+pop_m_ind_empl+pop_f_ind_empl
**For some sectors workers are not reported (--> use employees)
gen workers1866=ind_workers1866+pop_m_agr_work+pop_f_agr_work+pop_m_agr_empl+pop_f_agr_empl+pop_m_other_work+pop_f_other_work+pop_m_com_empl+pop_f_com_empl+pop_m_other_empl2+pop_f_other_empl2+pop_m_lib_empl+pop_f_lib_empl




keep department* ind_workers1866 workers1866 

***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/employment from online source/workers_1866.dta", replace

  

*******************************************************************************************************************************************************
********************************************************YEAR 1901**************************************************************************************
*******************************************************************************************************************************************************
quietly{
clear
***Importing original data (source: insee)
import excel "$folder/Data/raw_data/employment from online source/empl_for_panel.xlsx", sheet("1901") cellrange(A7:AZ97) firstrow


foreach var of varlist _all {
  label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V6-V252 {
destring `var', replace
}

/*
1. Sectors: Agriculture, Industry, Trade, Liberal
2. Population active. In 1901, this is divided into: bosses, workers, employees, (temporary) unemployed, undifined role, and workers isolated
*/

*Renaming Variables
quietly{
rename V3 department_id
rename V198 pop_m_ns1901
rename V199 pop_m_agr_nd1901
rename V200 pop_m_agr_boss1901
rename V201 pop_m_agr_empl1901
rename V202 pop_m_agr_work1901
rename V203 pop_m_agr_unempl1901
rename V204 pop_m_agr_w_is1901
rename V205 pop_m_ind_nd1901
rename V206 pop_m_ind_boss1901
rename V207 pop_m_ind_empl1901
rename V208 pop_m_ind_work1901
rename V209 pop_m_ind_unempl1901
rename V210 pop_m_ind_w_is1901
rename V211 pop_m_com_nd1901
rename V212 pop_m_com_boss1901
rename V213 pop_m_com_empl1901
rename V214 pop_m_com_work1901
rename V215 pop_m_com_unempl1901
rename V216 pop_m_com_w_is1901
rename V219 pop_m_lib_nd1901
rename V220 pop_m_lib_boss1901
rename V221 pop_m_lib_empl1901
rename V222 pop_m_lib_work1901
rename V223 pop_m_lib_unempl1901
rename V224 pop_m_lib_w_is1901
rename V226 pop_f_ns1901
rename V227 pop_f_agr_nd1901
rename V228 pop_f_agr_boss1901
rename V229 pop_f_agr_empl1901
rename V230 pop_f_agr_work1901
rename V231 pop_f_agr_unempl1901
rename V232 pop_f_agr_w_is1901
rename V233 pop_f_ind_nd1901
rename V234 pop_f_ind_boss1901
rename V235 pop_f_ind_empl1901
rename V236 pop_f_ind_work1901
rename V237 pop_f_ind_unempl1901
rename V238 pop_f_ind_w_is1901
rename V239 pop_f_com_nd1901
rename V240 pop_f_com_boss1901
rename V241 pop_f_com_empl1901
rename V242 pop_f_com_work1901
rename V243 pop_f_com_unempl1901
rename V244 pop_f_com_w_is1901
rename V247 pop_f_lib_nd1901
rename V248 pop_f_lib_boss1901
rename V249 pop_f_lib_empl1901
rename V250 pop_f_lib_work1901
rename V251 pop_f_lib_unempl1901
rename V252 pop_f_lib_w_is1901
}

**


**Generate number of workers (in industry and total).
gen ind_workers1901=pop_m_ind_work1901+pop_f_ind_work1901
gen workers1901=pop_m_ind_work1901+pop_f_ind_work1901+pop_m_agr_work1901+pop_m_com_work1901+pop_m_lib_work1901+pop_f_agr_work1901+pop_f_com_work1901+pop_f_lib_work1901



keep department*  ind_workers1901 workers1901

***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| ///
department_id==68  |department_id==73 |department_id==74 | department_id==57
}
save "$folder/Data/raw_data/employment from online source/workers_1901.dta", replace



