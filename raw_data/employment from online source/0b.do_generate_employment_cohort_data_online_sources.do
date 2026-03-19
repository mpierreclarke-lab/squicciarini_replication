



/*****************************************************************************************/
/*****************************************************************************************/
/****************  IMPORT RAW DATA ON EMPLOYMENT BY SECTOR AND WORKER COHORT  ************/
/********************** from EXCEL FILES AND CREATE .dta FILES ***************************/
/*****************************************************************************************/
/*****************************************************************************************/








clear
**Import raw data
import excel "$folder/Data/raw_data/employment from online source/empl_cohort1896.xlsx", sheet("cohort") cellrange(A1:DS90) firstrow
foreach var of varlist _all {
label variable `var' "`=`var'[1]'"
}
drop in 1
foreach var of varlist V3-v98 {
destring `var', replace
}

/*
1. Modern Sectors: Transformation  and Transport // including also trade and banking as modern would provide similar results.
Traditional sectors: Fishing, Agriculture, Mining.
2. Population active is divided into:  bosses, workers and employees, indipendent workers
*/

**Renaming Variables
quietly{
rename V3 department_id
rename V6 department_name
rename V8 mal_boss_fishing_less25
rename V9 mal_boss_fishing_25_34
rename V10 mal_boss_fishing_35_44
rename V16 fem_boss_fishing_less25
rename V17 fem_boss_fishing_25_34
rename V18 fem_boss_fishing_35_44
rename V24 mal_boss_agric_less25
rename V25 mal_boss_agric_25_34
rename V26 mal_boss_agric_35_44
rename V32 fem_boss_agric_less25
rename V33 fem_boss_agric_25_34
rename V34 fem_boss_agric_35_44
rename V40 mal_boss_mines_less25
rename V41 mal_boss_mines_25_34
rename V42 mal_boss_mines_35_44
rename V48 fem_boss_mines_less25
rename V49 fem_boss_mines_25_34
rename V50 fem_boss_mines_35_44
rename V51 fem_boss_mines_45_54
rename V56 mal_boss_transf_less25
rename V57 mal_boss_transf_25_34
rename V58 mal_boss_transf_35_44
rename V64 fem_boss_transf_less25
rename V65 fem_boss_transf_25_34
rename V66 fem_boss_transf_35_44
rename V72 mal_boss_transport_less25
rename V73 mal_boss_transport_25_34
rename V74 mal_boss_transport_35_44
rename V80 fem_boss_transport_less25
rename V81 fem_boss_transport_25_34
rename V82 fem_boss_transport_35_44
rename V88 mal_boss_trade_bank_less25
rename V89 mal_boss_trade_bank_25_34
rename V90 mal_boss_trade_bank_35_44
rename V96 fem_boss_trade_bank_less25
rename V97 fem_boss_trade_bank_25_34
rename V98 fem_boss_trade_bank_35_44
rename V136 mal_empl_work_fishing_less18
rename V137 mal_empl_work_fishing_18_24
rename V138 mal_empl_work_fishing_25_34
rename V139 mal_empl_work_fishing_35_44
rename V145 fem_empl_work_fishing_less18
rename V146 fem_empl_work_fishing_18_24
rename V147 fem_empl_work_fishing_25_34
rename V148 fem_empl_work_fishing_35_44
rename V154 mal_empl_work_agric_less18
rename V155 mal_empl_work_agric_18_24
rename V156 mal_empl_work_agric_25_34
rename V157 mal_empl_work_agric_35_44
rename V163 fem_empl_work_agric_less18
rename V164 fem_empl_work_agric_18_24
rename V165 fem_empl_work_agric_25_34
rename V166 fem_empl_work_agric_35_44
rename V172 mal_empl_work_mines_less18
rename V173 mal_empl_work_mines_18_24
rename V174 mal_empl_work_mines_25_34
rename V175 mal_empl_work_mines_35_44
rename V181 fem_empl_work_mines_less18
rename V182 fem_empl_work_mines_18_24
rename V183 fem_empl_work_mines_25_34
rename V184 fem_empl_work_mines_35_44
rename V190 mal_empl_work_transf_less18
rename V191 mal_empl_work_transf_18_24
rename V192 mal_empl_work_transf_25_34
rename V193 mal_empl_work_transf_35_44
rename V199 fem_empl_work_transf_less18
rename V200 fem_empl_work_transf_18_24
rename V201 fem_empl_work_transf_25_34
rename V202 fem_empl_work_transf_35_44
rename V208 mal_empl_work_transport_less18
rename V209 mal_empl_work_transport_18_24
rename V210 mal_empl_work_transport_25_34
rename V211 mal_empl_work_transport_35_44
rename V217 fem_empl_work_transport_less18
rename V218 fem_empl_work_transport_18_24
rename V219 fem_empl_work_transport_25_34
rename V220 fem_empl_work_transport_35_44
rename V226 mal_empl_work_trade_bank_less18
rename V227 mal_empl_work_trade_bank_18_24
rename V228 mal_empl_work_trade_bank_25_34
rename V229 mal_empl_work_trade_bank_35_44
rename V235 fem_empl_work_trade_bank_less18
rename V236 fem_empl_work_trade_bank_18_24
rename V237 fem_empl_work_trade_bank_25_34
rename V238 fem_empl_work_trade_bank_35_44
rename v8 mal_work_indip_fishing_less25
rename v9 mal_work_indip_fishing_25_34
rename v10 mal_work_indip_fishing_35_44
rename v16 fem_work_indip_fishing_less25
rename v17 fem_work_indip_fishing_25_34
rename v18 fem_work_indip_fishing_35_44
rename v24 mal_work_indip_agric_less25
rename v25 mal_work_indip_agric_25_34
rename v26 mal_work_indip_agric_35_44
rename v32 fem_work_indip_agric_less25
rename v33 fem_work_indip_agric_25_34
rename v34 fem_work_indip_agric_35_44
rename v40 mal_work_indip_mines_less25
rename v41 mal_work_indip_mines_25_34
rename v42 mal_work_indip_mines_35_44
rename v48 fem_work_indip_mines_less25
rename v49 fem_work_indip_mines_25_34
rename v50 fem_work_indip_mines_35_44
rename v56 mal_work_indip_transf_less25
rename v57 mal_work_indip_transf_25_34
rename v58 mal_work_indip_transf_35_44
rename v64 fem_work_indip_transf_less25
rename v65 fem_work_indip_transf_25_34
rename v66 fem_work_indip_transf_35_44
rename v72 mal_work_indip_transport_less25
rename v73 mal_work_indip_transport_25_34
rename v74 mal_work_indip_transport_35_44
rename v80 fem_work_indip_transport_less25
rename v81 fem_work_indip_transport_25_34
rename v82 fem_work_indip_transport_35_44
rename v88 mal_work_indip_trade_bank_less25
rename v89 mal_work_indip_trade_bank_25_34
rename v90 mal_work_indip_trade_bank_35_44
rename v96 fem_work_indip_trade_bank_less25
rename v97 fem_work_indip_trade_bank_25_34
rename v98 fem_work_indip_trade_bank_35_44
}
*

foreach x in fishing agric mines transf transport trade_bank {
gen mal_empl_work_`x'_less25=mal_empl_work_`x'_18_24
gen fem_empl_work_`x'_less25=fem_empl_work_`x'_18_24
}

***************************************************************************************
*****************Compute share of workers in modern sectors by cohort******************
***************************************************************************************

foreach x in less25 25_34 35_44  {

**Modern workers (Transformation and Transport)
gen work_indip_`x'_mod=mal_work_indip_transf_`x'+fem_work_indip_transf_`x'+mal_work_indip_transport_`x'+fem_work_indip_transport_`x'
gen empl_work_`x'_mod=mal_empl_work_transf_`x'+fem_empl_work_transf_`x'+mal_empl_work_transport_`x'+fem_empl_work_transport_`x'

**All sectors (Transformation and Transport + Mines, fishing, and agriculture)
gen work_indip_`x'=work_indip_`x'_mod+mal_work_indip_fishing_`x'+fem_work_indip_fishing_`x'+mal_work_indip_agric_`x'+fem_work_indip_agric_`x'+mal_work_indip_mines_`x'+fem_work_indip_mines_`x'
gen empl_work_`x'=empl_work_`x'_mod+mal_empl_work_fishing_`x'+fem_empl_work_fishing_`x'+mal_empl_work_agric_`x'+fem_empl_work_agric_`x'+mal_empl_work_mines_`x'+fem_empl_work_mines_`x'

********************************broader classification (Transformation, Transport and Trade and banking as modern)

**Modern workers -- broader classification
gen work_indip2_`x'_mod=mal_work_indip_transf_`x'+fem_work_indip_transf_`x'+mal_work_indip_transport_`x'+fem_work_indip_transport_`x'+mal_work_indip_trade_bank_`x'+fem_work_indip_trade_bank_`x'
gen empl_work2_`x'_mod=mal_empl_work_transf_`x'+fem_empl_work_transf_`x'+mal_empl_work_transport_`x'+fem_empl_work_transport_`x'+mal_empl_work_trade_bank_`x'+fem_empl_work_trade_bank_`x'

**All sectors (Transformation, Transport, and Trade and Banking + Mines, fishing, and agriculture)
gen work_indip2_`x'=work_indip2_`x'_mod+mal_work_indip_fishing_`x'+fem_work_indip_fishing_`x'+mal_work_indip_agric_`x'+fem_work_indip_agric_`x'+mal_work_indip_mines_`x'+fem_work_indip_mines_`x'
gen empl_work2_`x'=empl_work2_`x'_mod+mal_empl_work_fishing_`x'+fem_empl_work_fishing_`x'+mal_empl_work_agric_`x'+fem_empl_work_agric_`x'+mal_empl_work_mines_`x'+fem_empl_work_mines_`x'


******Compute share of workers cohort in modern sectors*******
gen mod_workers_`x'=work_indip_`x'_mod+empl_work_`x'_mod
gen pop_workers_`x'=work_indip_`x'+ empl_work_`x'
gen share_mod_workers_`x'=mod_workers_`x'/pop_workers_`x'


******Compute share of workers cohort in modern sectors (broader classification)*******
gen mod_workers2_`x'=work_indip2_`x'_mod+empl_work2_`x'_mod
gen pop_workers2_`x'=work_indip2_`x'+ empl_work2_`x'
gen share_mod_workers2_`x'=mod_workers2_`x'/pop_workers2_`x'
}
*

keep department_id share_*

***Drop departments not included in the analysis
drop if department_id==54 | department_id==90  |department_id==67| department_id==68 |department_id==73 |department_id==74 | department_id==57


** since Paris is divided in center and banlieue 
collapse (mean) share_*, by (department_id)


foreach x in mod_workers mod_workers2 {

rename share_`x'_less25 share_cohort_`x'1886
rename share_`x'_25_34 share_cohort_`x'1876
rename share_`x'_35_44 share_cohort_`x'1866
}
*


reshape long share_cohort_mod_workers share_cohort_mod_workers2, i(department_id) j(year)
label var share_cohort_mod_workers "Share workers in modern sectors (attending school in year)"
label var share_cohort_mod_workers2 "Share workers in modern sectors (broader definition)" //includes also trade and banking

keep department_id year share_cohort_mod_workers
label var department_id department_id 
save "$folder/Data/generated_data/temp/cohort_empl.dta", replace


