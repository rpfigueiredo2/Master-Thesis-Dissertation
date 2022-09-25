*QP Cardoso

clear all
set more off
cd F:\Tese\Base_de_dados\Dataset\Quadros_de_Pessoal\dta

//------------------------------------------------------------------------------
//1986

*Workers

use "QP_Trabalhadores_1986_Fins_Cientificos.dta"

keep ano_86 nuemp_86 ntrab_86 sexo_86 habi1_86 idade_Cod rbase_86 rprg_86 nhnor_86

*Merge firms dataset with workers dataset

merge m:1 nuemp_86 ano_86 using "QP_Emp_86.dta"
keep if _merge==3
drop _merge

keep ano_86 ntrab_86 sexo_86 habi1_86 idade_Cod rbase_86 rprg_86 nhnor_86 NPC_FIC n2emp_86 natju_86 pemp_86 caem3_86 ancon_86 VVEND_86

ren ano_86 t
label variable t "Year"
ren ntrab_86 worker_id
ren sexo_86 gender
label variable gender "Gender"
ren habi1_86 habil
ren idade_Cod age
label variable age "Age"
ren rbase_86 base_wage
label variable base_wage "Remuneração Base"
ren rprg_86 pr_reg
ren nhnor_86 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_86 nutsii
label variable nutsii "NUTS II"
ren natju_86 natju
label variable natju "Natureza Jurídica"
ren pemp_86 pessoal
ren ancon_86 ano_const
ren VVEND_86 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem3_86 cae_3d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_3d==321|cae_3d==322|cae_3d==323|cae_3d==324
replace sector="1" if cae_3d==331|cae_3d==332
replace sector="2" if cae_3d==341|cae_3d==342
replace sector="3" if cae_3d==351|cae_3d==352|cae_3d==353|cae_3d==354|cae_3d==355|cae_3d==356
replace sector="4" if cae_3d==361|cae_3d==362|cae_3d==369
replace sector="5" if cae_3d==371|cae_3d==372|cae_3d==381|cae_3d==382|cae_3d==383|cae_3d==384|cae_3d==385
replace sector="6" if cae_3d==390
replace sector="7" if cae_3d==610|cae_3d==620
replace sector="8" if cae_3d==631|cae_3d==632
replace sector="9" if cae_3d==711|cae_3d==712|cae_3d==713|cae_3d==719|cae_3d==720
replace sector="10" if cae_3d==810|cae_3d==820
replace sector="11" if cae_3d==831|cae_3d==832|cae_3d==833
replace sector="13" if cae_3d==932|cae_3d==933|cae_3d==934|cae_3d==939
replace sector="12" if cae_3d==931
replace sector="14" if cae_3d==920
replace sector="15" if cae_3d==935
replace sector="16" if cae_3d==941|cae_3d==942|cae_3d==949
replace sector="17" if cae_3d==951|cae_3d==952|cae_3d==953|cae_3d==959
replace sector="18" if cae_3d==311|cae_3d==312|cae_3d==313|cae_3d==314
drop if sector=="AAA"
destring sector, replace
drop cae_3d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Destringing age
replace age="68" if age==">=68"
replace age="17" if age=="<=17"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignorado" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi = 27.895 if t==1986
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1986_Cardoso", replace

//------------------------------------------------------------------------------
//1987

*Workers
clear all

use "QP_Trabalhadores_1987_Fins_Cientificos.dta"

keep ano_87 nuemp_87 ntrab_87 sexo_87 habi1_87 idade_Cod rbase_87 rprg_87 nhnor_87

*Merge firms dataset with workers dataset

merge m:1 nuemp_87 ano_87 using "QP_Emp_87.dta"
keep if _merge==3
drop _merge

keep ano_87 ntrab_87 sexo_87 habi1_87 idade_Cod rbase_87 rprg_87 nhnor_87 NPC_FIC n2emp_87 natju_87 pemp_87 caem3_87 ancon_87 VVEND_87

ren ano_87 t
label variable t "Year"
ren ntrab_87 worker_id
ren sexo_87 gender
label variable gender "Gender"
ren habi1_87 habil
ren idade_Cod age
label variable age "Age"
ren rbase_87 base_wage
label variable base_wage "Remuneração Base"
ren rprg_87 pr_reg
ren nhnor_87 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_87 nutsii
label variable nutsii "NUTS II"
ren natju_87 natju
label variable natju "Natureza Jurídica"
ren pemp_87 pessoal
ren ancon_87 ano_const
ren VVEND_87 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem3_87 cae_3d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_3d==321|cae_3d==322|cae_3d==323|cae_3d==324
replace sector="1" if cae_3d==331|cae_3d==332
replace sector="2" if cae_3d==341|cae_3d==342
replace sector="3" if cae_3d==351|cae_3d==352|cae_3d==353|cae_3d==354|cae_3d==355|cae_3d==356
replace sector="4" if cae_3d==361|cae_3d==362|cae_3d==369
replace sector="5" if cae_3d==371|cae_3d==372|cae_3d==381|cae_3d==382|cae_3d==383|cae_3d==384|cae_3d==385
replace sector="6" if cae_3d==390
replace sector="7" if cae_3d==610|cae_3d==620
replace sector="8" if cae_3d==631|cae_3d==632
replace sector="9" if cae_3d==711|cae_3d==712|cae_3d==713|cae_3d==719|cae_3d==720
replace sector="10" if cae_3d==810|cae_3d==820
replace sector="11" if cae_3d==831|cae_3d==832|cae_3d==833
replace sector="13" if cae_3d==932|cae_3d==933|cae_3d==934|cae_3d==939
replace sector="12" if cae_3d==931
replace sector="14" if cae_3d==920
replace sector="15" if cae_3d==935
replace sector="16" if cae_3d==941|cae_3d==942|cae_3d==949
replace sector="17" if cae_3d==951|cae_3d==952|cae_3d==953|cae_3d==959
replace sector="18" if cae_3d==311|cae_3d==312|cae_3d==313|cae_3d==314
drop if sector=="AAA"
destring sector, replace
drop cae_3d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Destringing age
replace age="68" if age==">=68"
replace age="17" if age=="<=17"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignorado" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi = 30.711 if t==1987
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1987_Cardoso", replace

//------------------------------------------------------------------------------
//1988

*Workers

use "QP_Trabalhadores_1988_Fins_Cientificos.dta"

keep ano_88 nuemp_88 ntrab_88 sexo_88 habi1_88 idade_Cod rbase_88 rprg_88 nhnor_88

*Merge firms dataset with workers dataset

merge m:1 nuemp_88 ano_88 using "QP_Emp_88.dta"
keep if _merge==3
drop _merge

keep ano_88 ntrab_88 sexo_88 habi1_88 idade_Cod rbase_88 rprg_88 nhnor_88 NPC_FIC n2emp_88 natju_88 pemp_88 caem3_88 ancon_88 VVEND_88

ren ano_88 t
label variable t "Year"
ren ntrab_88 worker_id
ren sexo_88 gender
label variable gender "Gender"
ren habi1_88 habil
ren idade_Cod age
label variable age "Age"
ren rbase_88 base_wage
label variable base_wage "Remuneração Base"
ren rprg_88 pr_reg
ren nhnor_88 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_88 nutsii
label variable nutsii "NUTS II"
ren natju_88 natju
label variable natju "Natureza Jurídica"
ren pemp_88 pessoal
ren ancon_88 ano_const
ren VVEND_88 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem3_88 cae_3d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_3d==321|cae_3d==322|cae_3d==323|cae_3d==324
replace sector="1" if cae_3d==331|cae_3d==332
replace sector="2" if cae_3d==341|cae_3d==342
replace sector="3" if cae_3d==351|cae_3d==352|cae_3d==353|cae_3d==354|cae_3d==355|cae_3d==356
replace sector="4" if cae_3d==361|cae_3d==362|cae_3d==369
replace sector="5" if cae_3d==371|cae_3d==372|cae_3d==381|cae_3d==382|cae_3d==383|cae_3d==384|cae_3d==385
replace sector="6" if cae_3d==390
replace sector="7" if cae_3d==610|cae_3d==620
replace sector="8" if cae_3d==631|cae_3d==632
replace sector="9" if cae_3d==711|cae_3d==712|cae_3d==713|cae_3d==719|cae_3d==720
replace sector="10" if cae_3d==810|cae_3d==820
replace sector="11" if cae_3d==831|cae_3d==832|cae_3d==833
replace sector="13" if cae_3d==932|cae_3d==933|cae_3d==934|cae_3d==939
replace sector="12" if cae_3d==931
replace sector="14" if cae_3d==920
replace sector="15" if cae_3d==935
replace sector="16" if cae_3d==941|cae_3d==942|cae_3d==949
replace sector="17" if cae_3d==951|cae_3d==952|cae_3d==953|cae_3d==959
replace sector="18" if cae_3d==311|cae_3d==312|cae_3d==313|cae_3d==314
drop if sector=="AAA"
destring sector, replace
drop cae_3d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Destringing age
replace age="68" if age==">=68"
replace age="17" if age=="<=17"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignorado" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi = 34.14 if t==1988
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1988_Cardoso", replace

//------------------------------------------------------------------------------
//1989

*Workers
clear all

use "QP_Trabalhadores_1989_Fins_Cientificos.dta"

keep ano_89 nuemp_89 ntrab_89 sexo_89 habi1_89 idade_Cod rbase_89 rprg_89 nhnor_89

*Merge firms dataset with workers dataset

merge m:1 nuemp_89 ano_89 using "QP_Emp_89.dta"
keep if _merge==3
drop _merge

keep ano_89 ntrab_89 sexo_89 habi1_89 idade_Cod rbase_89 rprg_89 nhnor_89 NPC_FIC n2emp_89 natju_89 pemp_89 caem3_89 ancon_89 VVEND_89

ren ano_89 t
label variable t "Year"
ren ntrab_89 worker_id
ren sexo_89 gender
label variable gender "Gender"
ren habi1_89 habil
ren idade_Cod age
label variable age "Age"
ren rbase_89 base_wage
label variable base_wage "Remuneração Base"
ren rprg_89 pr_reg
ren nhnor_89 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_89 nutsii
label variable nutsii "NUTS II"
ren natju_89 natju
label variable natju "Natureza Jurídica"
ren pemp_89 pessoal
ren ancon_89 ano_const
ren VVEND_89 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem3_89 cae_3d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_3d==321|cae_3d==322|cae_3d==323|cae_3d==324
replace sector="1" if cae_3d==331|cae_3d==332
replace sector="2" if cae_3d==341|cae_3d==342
replace sector="3" if cae_3d==351|cae_3d==352|cae_3d==353|cae_3d==354|cae_3d==355|cae_3d==356
replace sector="4" if cae_3d==361|cae_3d==362|cae_3d==369
replace sector="5" if cae_3d==371|cae_3d==372|cae_3d==381|cae_3d==382|cae_3d==383|cae_3d==384|cae_3d==385
replace sector="6" if cae_3d==390
replace sector="7" if cae_3d==610|cae_3d==620
replace sector="8" if cae_3d==631|cae_3d==632
replace sector="9" if cae_3d==711|cae_3d==712|cae_3d==713|cae_3d==719|cae_3d==720
replace sector="10" if cae_3d==810|cae_3d==820
replace sector="11" if cae_3d==831|cae_3d==832|cae_3d==833
replace sector="13" if cae_3d==932|cae_3d==933|cae_3d==934|cae_3d==939
replace sector="12" if cae_3d==931
replace sector="14" if cae_3d==920
replace sector="15" if cae_3d==935
replace sector="16" if cae_3d==941|cae_3d==942|cae_3d==949
replace sector="17" if cae_3d==951|cae_3d==952|cae_3d==953|cae_3d==959
replace sector="18" if cae_3d==311|cae_3d==312|cae_3d==313|cae_3d==314
drop if sector=="AAA"
destring sector, replace
drop cae_3d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Destringing age
replace age="68" if age==">=68"
replace age="17" if age=="<=17"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignorado" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi = 37.73 if t==1989
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1989_Cardoso", replace

//------------------------------------------------------------------------------
//1990

*This year has no worker data
clear all

use "QP_Emp_90.dta"

keep ano_90 NPC_FIC n2emp_90 natju_90 pemp_90 caem3_90 ancon_90 VVEND_90

ren ano_90 t
label variable t "Year"
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_90 nutsii
label variable nutsii "NUTS II"
ren natju_90 natju
label variable natju "Natureza Jurídica"
ren pemp_90 pessoal
ren ancon_90 ano_const
ren VVEND_90 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem3_90 cae_3d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_3d==321|cae_3d==322|cae_3d==323|cae_3d==324
replace sector="1" if cae_3d==331|cae_3d==332
replace sector="2" if cae_3d==341|cae_3d==342
replace sector="3" if cae_3d==351|cae_3d==352|cae_3d==353|cae_3d==354|cae_3d==355|cae_3d==356
replace sector="4" if cae_3d==361|cae_3d==362|cae_3d==369
replace sector="5" if cae_3d==371|cae_3d==372|cae_3d==381|cae_3d==382|cae_3d==383|cae_3d==384|cae_3d==385
replace sector="6" if cae_3d==390
replace sector="7" if cae_3d==610|cae_3d==620
replace sector="8" if cae_3d==631|cae_3d==632
replace sector="9" if cae_3d==711|cae_3d==712|cae_3d==713|cae_3d==719|cae_3d==720
replace sector="10" if cae_3d==810|cae_3d==820
replace sector="11" if cae_3d==831|cae_3d==832|cae_3d==833
replace sector="13" if cae_3d==932|cae_3d==933|cae_3d==934|cae_3d==939
replace sector="12" if cae_3d==931
replace sector="14" if cae_3d==920
replace sector="15" if cae_3d==935
replace sector="16" if cae_3d==941|cae_3d==942|cae_3d==949
replace sector="17" if cae_3d==951|cae_3d==952|cae_3d==953|cae_3d==959
replace sector="18" if cae_3d==311|cae_3d==312|cae_3d==313|cae_3d==314
drop if sector=="AAA"
destring sector, replace
drop cae_3d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Generating CPI variable using OECD Data
gen double cpi = 42.689 if t==1990
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1990_Cardoso", replace

//------------------------------------------------------------------------------
//1991

*Workers
clear all

use "QP_Trabalhadores_1991_Fins_Cientificos.dta"

keep ano_91 nuemp_91 ntrab_91 sexo_91 habi1_91 idade_91_TB_COD rbase_91 rprg_91 nhnor_91

*Merge firms dataset with workers dataset
ren nuemp_91 NUEMP
merge m:1 NUEMP ano_91 using "QP_Emp_91.dta"
keep if _merge==3
drop _merge

keep ano_91 ntrab_91 sexo_91 habi1_91 idade_91_TB_COD rbase_91 rprg_91 nhnor_91 NPC_FIC n2emp_91 natju_91 pemp_91 caem3_91 ancon_91 VVEND_91

ren ano_91 t
label variable t "Year"
ren ntrab_91 worker_id
ren sexo_91 gender
label variable gender "Gender"
ren habi1_91 habil
ren idade_91_TB_COD age
label variable age "Age"
ren rbase_91 base_wage
label variable base_wage "Remuneração Base"
ren rprg_91 pr_reg
ren nhnor_91 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_91 nutsii
label variable nutsii "NUTS II"
ren natju_91 natju
label variable natju "Natureza Jurídica"
ren pemp_91 pessoal
ren ancon_91 ano_const
ren VVEND_91 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem3_91 cae_3d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_3d==321|cae_3d==322|cae_3d==323|cae_3d==324
replace sector="1" if cae_3d==331|cae_3d==332
replace sector="2" if cae_3d==341|cae_3d==342
replace sector="3" if cae_3d==351|cae_3d==352|cae_3d==353|cae_3d==354|cae_3d==355|cae_3d==356
replace sector="4" if cae_3d==361|cae_3d==362|cae_3d==369
replace sector="5" if cae_3d==371|cae_3d==372|cae_3d==381|cae_3d==382|cae_3d==383|cae_3d==384|cae_3d==385
replace sector="6" if cae_3d==390
replace sector="7" if cae_3d==610|cae_3d==620
replace sector="8" if cae_3d==631|cae_3d==632
replace sector="9" if cae_3d==711|cae_3d==712|cae_3d==713|cae_3d==719|cae_3d==720
replace sector="10" if cae_3d==810|cae_3d==820
replace sector="11" if cae_3d==831|cae_3d==832|cae_3d==833
replace sector="13" if cae_3d==932|cae_3d==933|cae_3d==934|cae_3d==939
replace sector="12" if cae_3d==931
replace sector="14" if cae_3d==920
replace sector="15" if cae_3d==935
replace sector="16" if cae_3d==941|cae_3d==942|cae_3d==949
replace sector="17" if cae_3d==951|cae_3d==952|cae_3d==953|cae_3d==959
replace sector="18" if cae_3d==311|cae_3d==312|cae_3d==313|cae_3d==314
drop if sector=="AAA"
destring sector, replace
drop cae_3d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 46.995 if t==1991
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1991_Cardoso", replace

//------------------------------------------------------------------------------
//1992

*Workers
clear all

use "QP_Trabalhadores_1992_Fins_Cientificos.dta"

keep ano_92 nuemp_92 ntrab_92 sexo_92 habi1_92 idade_92_TB_COD rbase_92 rprg_92 nhnor_92

*Merge firms dataset with workers dataset
ren nuemp_92 NUEMP
merge m:1 NUEMP ano_92 using "QP_Emp_92.dta"
keep if _merge==3
drop _merge

keep ano_92 ntrab_92 sexo_92 habi1_92 idade_92_TB_COD rbase_92 rprg_92 nhnor_92 NPC_FIC n2emp_92 natju_92 pemp_92 caem3_92 ancon_92 VVEND_92

ren ano_92 t
label variable t "Year"
ren ntrab_92 worker_id
ren sexo_92 gender
label variable gender "Gender"
ren habi1_92 habil
ren idade_92_TB_COD age
label variable age "Age"
ren rbase_92 base_wage
label variable base_wage "Remuneração Base"
ren rprg_92 pr_reg
ren nhnor_92 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_92 nutsii
label variable nutsii "NUTS II"
ren natju_92 natju
label variable natju "Natureza Jurídica"
ren pemp_92 pessoal
ren ancon_92 ano_const
ren VVEND_92 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem3_92 cae_3d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_3d==321|cae_3d==322|cae_3d==323|cae_3d==324
replace sector="1" if cae_3d==331|cae_3d==332
replace sector="2" if cae_3d==341|cae_3d==342
replace sector="3" if cae_3d==351|cae_3d==352|cae_3d==353|cae_3d==354|cae_3d==355|cae_3d==356
replace sector="4" if cae_3d==361|cae_3d==362|cae_3d==369
replace sector="5" if cae_3d==371|cae_3d==372|cae_3d==381|cae_3d==382|cae_3d==383|cae_3d==384|cae_3d==385
replace sector="6" if cae_3d==390
replace sector="7" if cae_3d==610|cae_3d==620
replace sector="8" if cae_3d==631|cae_3d==632
replace sector="9" if cae_3d==711|cae_3d==712|cae_3d==713|cae_3d==719|cae_3d==720
replace sector="10" if cae_3d==810|cae_3d==820
replace sector="11" if cae_3d==831|cae_3d==832|cae_3d==833
replace sector="13" if cae_3d==932|cae_3d==933|cae_3d==934|cae_3d==939
replace sector="12" if cae_3d==931
replace sector="14" if cae_3d==920
replace sector="15" if cae_3d==935
replace sector="16" if cae_3d==941|cae_3d==942|cae_3d==949
replace sector="17" if cae_3d==951|cae_3d==952|cae_3d==953|cae_3d==959
replace sector="18" if cae_3d==311|cae_3d==312|cae_3d==313|cae_3d==314
drop if sector=="AAA"
destring sector, replace
drop cae_3d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 52.374 if t==1992
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1992_Cardoso", replace

//------------------------------------------------------------------------------
//1993

*Workers
clear all

use "QP_Trabalhadores_1993_Fins_Cientificos.dta"

keep ano_93 nuemp_93 ntrab_93 sexo_93 habi1_93 idade_93_TB_COD rbase_93 rprg_93 nhnor_93

*Merge firms dataset with workers dataset
ren nuemp_93 NUEMP
merge m:1 NUEMP ano_93 using "QP_Emp_93.dta"
keep if _merge==3
drop _merge

keep ano_93 ntrab_93 sexo_93 habi1_93 idade_93_TB_COD rbase_93 rprg_93 nhnor_93 NPC_FIC n2emp_93 natju_93 pemp_93 caem3_93 ancon_93 VVEND_93

ren ano_93 t
label variable t "Year"
ren ntrab_93 worker_id
ren sexo_93 gender
label variable gender "Gender"
ren habi1_93 habil
ren idade_93_TB_COD age
label variable age "Age"
ren rbase_93 base_wage
label variable base_wage "Remuneração Base"
ren rprg_93 pr_reg
ren nhnor_93 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_93 nutsii
label variable nutsii "NUTS II"
ren natju_93 natju
label variable natju "Natureza Jurídica"
ren pemp_93 pessoal
ren ancon_93 ano_const
ren VVEND_93 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem3_93 cae_3d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_3d==321|cae_3d==322|cae_3d==323|cae_3d==324
replace sector="1" if cae_3d==331|cae_3d==332
replace sector="2" if cae_3d==341|cae_3d==342
replace sector="3" if cae_3d==351|cae_3d==352|cae_3d==353|cae_3d==354|cae_3d==355|cae_3d==356
replace sector="4" if cae_3d==361|cae_3d==362|cae_3d==369
replace sector="5" if cae_3d==371|cae_3d==372|cae_3d==381|cae_3d==382|cae_3d==383|cae_3d==384|cae_3d==385
replace sector="6" if cae_3d==390
replace sector="7" if cae_3d==610|cae_3d==620
replace sector="8" if cae_3d==631|cae_3d==632
replace sector="9" if cae_3d==711|cae_3d==712|cae_3d==713|cae_3d==719|cae_3d==720
replace sector="10" if cae_3d==810|cae_3d==820
replace sector="11" if cae_3d==831|cae_3d==832|cae_3d==833
replace sector="13" if cae_3d==932|cae_3d==933|cae_3d==934|cae_3d==939
replace sector="12" if cae_3d==931
replace sector="14" if cae_3d==920
replace sector="15" if cae_3d==935
replace sector="16" if cae_3d==941|cae_3d==942|cae_3d==949
replace sector="17" if cae_3d==951|cae_3d==952|cae_3d==953|cae_3d==959
replace sector="18" if cae_3d==311|cae_3d==312|cae_3d==313|cae_3d==314
drop if sector=="AAA"
destring sector, replace
drop cae_3d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 56.237 if t==1993
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1993_Cardoso", replace

//------------------------------------------------------------------------------
//1994

*Workers
clear all

use "QP_Trabalhadores_1994_Fins_Cientificos.dta"

keep ano_94 nuemp_94 ntrab_94 sexo_94 habi1_94 idade_94_TB_COD rbase_94 rprg_94 nhnor_94

*Merge firms dataset with workers dataset
ren nuemp_94 NUEMP
merge m:1 NUEMP ano_94 using "QP_Emp_94.dta"
keep if _merge==3
drop _merge

keep ano_94 ntrab_94 sexo_94 habi1_94 idade_94_TB_COD rbase_94 rprg_94 nhnor_94 NPC_FIC n2emp_94 natju_94 pemp_94 caem3_94 ancon_94 VVEND_94

ren ano_94 t
label variable t "Year"
ren ntrab_94 worker_id
ren sexo_94 gender
label variable gender "Gender"
ren habi1_94 habil
ren idade_94_TB_COD age
label variable age "Age"
ren rbase_94 base_wage
label variable base_wage "Remuneração Base"
ren rprg_94 pr_reg
ren nhnor_94 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_94 nutsii
label variable nutsii "NUTS II"
ren natju_94 natju
label variable natju "Natureza Jurídica"
ren pemp_94 pessoal
ren ancon_94 ano_const
ren VVEND_94 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem3_94 cae_3d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_3d==321|cae_3d==322|cae_3d==323|cae_3d==324
replace sector="1" if cae_3d==331|cae_3d==332
replace sector="2" if cae_3d==341|cae_3d==342
replace sector="3" if cae_3d==351|cae_3d==352|cae_3d==353|cae_3d==354|cae_3d==355|cae_3d==356
replace sector="4" if cae_3d==361|cae_3d==362|cae_3d==369
replace sector="5" if cae_3d==371|cae_3d==372|cae_3d==381|cae_3d==382|cae_3d==383|cae_3d==384|cae_3d==385
replace sector="6" if cae_3d==390
replace sector="7" if cae_3d==610|cae_3d==620
replace sector="8" if cae_3d==631|cae_3d==632
replace sector="9" if cae_3d==711|cae_3d==712|cae_3d==713|cae_3d==719|cae_3d==720
replace sector="10" if cae_3d==810|cae_3d==820
replace sector="11" if cae_3d==831|cae_3d==832|cae_3d==833
replace sector="13" if cae_3d==932|cae_3d==933|cae_3d==934|cae_3d==939
replace sector="12" if cae_3d==931
replace sector="14" if cae_3d==920
replace sector="15" if cae_3d==935
replace sector="16" if cae_3d==941|cae_3d==942|cae_3d==949
replace sector="17" if cae_3d==951|cae_3d==952|cae_3d==953|cae_3d==959
replace sector="18" if cae_3d==311|cae_3d==312|cae_3d==313|cae_3d==314
drop if sector=="AAA"
destring sector, replace
drop cae_3d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 60.33 if t==1994
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1994_Cardoso", replace

//------------------------------------------------------------------------------
//1995

*Workers
clear all

use "QP_Trabalhadores_1995_Fins_Cientificos.dta"

keep ano_95 nuemp_95 ntrab_95 sexo_95 habi1_95 idade_95_TB_COD rbase_95 rprg_95 nhnor_95

*Merge firms dataset with workers dataset
ren nuemp_95 NUEMP
merge m:1 NUEMP ano_95 using "QP_Emp_95.dta"
keep if _merge==3
drop _merge

keep ano_95 ntrab_95 sexo_95 habi1_95 idade_95_TB_COD rbase_95 rprg_95 nhnor_95 NPC_FIC n2emp_95 natju_95 pemp_95 caem2_95 ancon_95 vvend_95

ren ano_95 t
label variable t "Year"
ren ntrab_95 worker_id
ren sexo_95 gender
label variable gender "Gender"
ren habi1_95 habil
ren idade_95_TB_COD age
label variable age "Age"
ren rbase_95 base_wage
label variable base_wage "Remuneração Base"
ren rprg_95 pr_reg
ren nhnor_95 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_95 nutsii
label variable nutsii "NUTS II"
ren natju_95 natju
label variable natju "Natureza Jurídica"
ren pemp_95 pessoal
ren ancon_95 ano_const
ren vvend_95 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_95 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 62.398 if t==1995
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1995_Cardoso", replace

//------------------------------------------------------------------------------
//1996

*Workers
clear all

use "QP_Trabalhadores_1996_Fins_Cientificos.dta"

keep ano_96 nuemp_96 ntrab_96 sexo_96 habil1_96 idade_96_TB_COD rbase_96 rprg_96 nhnor_96

*Merge firms dataset with workers dataset
ren nuemp_96 NUEMP
merge m:1 NUEMP ano_96 using "QP_Emp_96.dta"
keep if _merge==3
drop _merge

keep ano_96 ntrab_96 sexo_96 habil1_96 idade_96_TB_COD rbase_96 rprg_96 nhnor_96 NPC_FIC n2emp_96 natju_96 pemp_96 caem2_96 ancon_96 VVEND_96

ren ano_96 t
label variable t "Year"
ren ntrab_96 worker_id
ren sexo_96 gender
label variable gender "Gender"
ren habil1_96 habil
ren idade_96_TB_COD age
label variable age "Age"
ren rbase_96 base_wage
label variable base_wage "Remuneração Base"
ren rprg_96 pr_reg
ren nhnor_96 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_96 nutsii
label variable nutsii "NUTS II"
ren natju_96 natju
label variable natju "Natureza Jurídica"
ren pemp_96 pessoal
ren ancon_96 ano_const
ren VVEND_96 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_96 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 63.89 if t==1996
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1996_Cardoso", replace

//------------------------------------------------------------------------------
//1997

*Workers
clear all

use "QP_Trabalhadores_1997_Fins_Cientificos.dta"

keep ano_97 nuemp_97 ntrab_97 sexo_97 habi1_97 idade_97_TB_COD rbase_97 rprg_97 nhnor_97

*Merge firms dataset with workers dataset
ren nuemp_97 NUEMP
merge m:1 NUEMP ano_97 using "QP_Emp_97.dta"
keep if _merge==3
drop _merge

keep ano_97 ntrab_97 sexo_97 habi1_97 idade_97_TB_COD rbase_97 rprg_97 nhnor_97 NPC_FIC n2emp_97 natju_97 pemp_97 caem2_97 ancon_97 VVEND_97

ren ano_97 t
label variable t "Year"
ren ntrab_97 worker_id
ren sexo_97 gender
label variable gender "Gender"
ren habi1_97 habil
ren idade_97_TB_COD age
label variable age "Age"
ren rbase_97 base_wage
label variable base_wage "Remuneração Base"
ren rprg_97 pr_reg
ren nhnor_97 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_97 nutsii
label variable nutsii "NUTS II"
ren natju_97 natju
label variable natju "Natureza Jurídica"
ren pemp_97 pessoal
ren ancon_97 ano_const
ren VVEND_97 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_97 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 66.372 if t==1997
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1997_Cardoso", replace

//------------------------------------------------------------------------------
//1998

*Workers
clear all

use "QP_Trabalhadores_1998_Fins_Cientificos.dta"

keep ano_98 nuemp_98 ntrab_98 sexo_98 habi1_98 idade_98_TB_COD rbase_98 rprg_98 nhnor_98

*Merge firms dataset with workers dataset
ren nuemp_98 NUEMP
merge m:1 NUEMP ano_98 using "QP_Emp_98.dta"
keep if _merge==3
drop _merge

keep ano_98 ntrab_98 sexo_98 habi1_98 idade_98_TB_COD rbase_98 rprg_98 nhnor_98 NPC_FIC n2emp_98 natju_98 pemp_98 caem2_98 ancon_98 VVEND_98

ren ano_98 t
label variable t "Year"
ren ntrab_98 worker_id
ren sexo_98 gender
label variable gender "Gender"
ren habi1_98 habil
ren idade_98_TB_COD age
label variable age "Age"
ren rbase_98 base_wage
label variable base_wage "Remuneração Base"
ren rprg_98 pr_reg
ren nhnor_98 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_98 nutsii
label variable nutsii "NUTS II"
ren natju_98 natju
label variable natju "Natureza Jurídica"
ren pemp_98 pessoal
ren ancon_98 ano_const
ren VVEND_98 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_98 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 68.911 if t==1998
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1998_Cardoso", replace

//------------------------------------------------------------------------------
//1999

*Workers
clear all

use "QP_Trabalhadores_1999_Fins_Cientificos.dta"

keep ano_99 nuemp_99 ntrab_99 sexo_99 habi1_99 idade_99_TB_COD rbase_99 rprg_99 nhnor_99

*Merge firms dataset with workers dataset
ren nuemp_99 NUEMP
merge m:1 NUEMP ano_99 using "QP_Emp_99.dta"
keep if _merge==3
drop _merge

keep ano_99 ntrab_99 sexo_99 habi1_99 idade_99_TB_COD rbase_99 rprg_99 nhnor_99 NPC_FIC n2emp_99 natju_99 pemp_99 caem2_99 ancon_99 VVEND_99

ren ano_99 t
label variable t "Year"
ren ntrab_99 worker_id
ren sexo_99 gender
label variable gender "Gender"
ren habi1_99 habil
ren idade_99_TB_COD age
label variable age "Age"
ren rbase_99 base_wage
label variable base_wage "Remuneração Base"
ren rprg_99 pr_reg
ren nhnor_99 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_99 nutsii
label variable nutsii "NUTS II"
ren natju_99 natju
label variable natju "Natureza Jurídica"
ren pemp_99 pessoal
ren ancon_99 ano_const
ren VVEND_99 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_99 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 71.234 if t==1999
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_1999_Cardoso", replace

//------------------------------------------------------------------------------
//2000

*Workers
clear all

use "QP_Trabalhadores_2000_Fins_Cientificos.dta"

keep ano_00 nuemp_00 ntrab_00 sexo_00 habil1_00 idade_00_TB_COD rbase_00 rprg_00 nhnor_00

*Merge firms dataset with workers dataset
ren nuemp_00 NUEMP
merge m:1 NUEMP ano_00 using "QP_Emp_00.dta"
keep if _merge==3
drop _merge

keep ano_00 ntrab_00 sexo_00 habil1_00 idade_00_TB_COD rbase_00 rprg_00 nhnor_00 NPC_FIC n2emp_00 natju_00 pemp_00 caem2_00 ancon_00 VVEND_00

ren ano_00 t
label variable t "Year"
ren ntrab_00 worker_id
ren sexo_00 gender
label variable gender "Gender"
ren habil1_00 habil
ren idade_00_TB_COD age
label variable age "Age"
ren rbase_00 base_wage
label variable base_wage "Remuneração Base"
ren rprg_00 pr_reg
ren nhnor_00 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_00 nutsii
label variable nutsii "NUTS II"
ren natju_00 natju
label variable natju "Natureza Jurídica"
ren pemp_00 pessoal
ren ancon_00 ano_const
ren VVEND_00 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_00 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 73.67 if t==2000
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_2000_Cardoso", replace

//------------------------------------------------------------------------------
//2001

*This year has no worker data
clear all

use "QP_Emp_01.dta"

keep ano_01 NPC_FIC n2emp_01 natju_01 pemp_01 caem2_01 ancon_01 VVEND_01

ren ano_01 t
label variable t "Year"
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_01 nutsii
label variable nutsii "NUTS II"
ren natju_01 natju
label variable natju "Natureza Jurídica"
ren pemp_01 pessoal
ren ancon_01 ano_const
ren VVEND_01 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_01 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Generating CPI variable using OECD Data
gen double cpi = 76.408 if t==2001
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_2001_Cardoso", replace

//------------------------------------------------------------------------------
//2002

*Workers
clear all

use "QP_Trabalhadores_2002_Fins_Cientificos.dta"

keep ano_02 nuemp_02 ntrab_02 sexo_02 habil1_02 idade_02_TB_COD rbase_02 rprg_02 nhnor_02

*Merge firms dataset with workers dataset
ren nuemp_02 NUEMP
merge m:1 NUEMP ano_02 using "QP_Emp_02.dta"
keep if _merge==3
drop _merge

keep ano_02 ntrab_02 sexo_02 habil1_02 idade_02_TB_COD rbase_02 rprg_02 nhnor_02 NPC_FIC n2emp_02 natju_02 pemp_02 caem2_02 ancon_02 VVEND_02

ren ano_02 t
label variable t "Year"
ren ntrab_02 worker_id
ren sexo_02 gender
label variable gender "Gender"
ren habil1_02 habil
ren idade_02_TB_COD age
label variable age "Age"
ren rbase_02 base_wage
label variable base_wage "Remuneração Base"
ren rprg_02 pr_reg
ren nhnor_02 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_02 nutsii
label variable nutsii "NUTS II"
ren natju_02 natju
label variable natju "Natureza Jurídica"
ren pemp_02 pessoal
ren ancon_02 ano_const
ren VVEND_02 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_02 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 79.609 if t==2002
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_2002_Cardoso", replace

//------------------------------------------------------------------------------
//2003

*Workers
clear all

use "QP_Trabalhadores_2003_Fins_Cientificos.dta"

keep ano_03 nuemp_03 ntrab_03 sexo_03 habil1_03 idade_03_TB_COD rbase_03 rprg_03 nhnor_03

*Merge firms dataset with workers dataset
ren nuemp_03 NUEMP
merge m:1 NUEMP ano_03 using "QP_Emp_03.dta"
keep if _merge==3
drop _merge

keep ano_03 ntrab_03 sexo_03 habil1_03 idade_03_TB_COD rbase_03 rprg_03 nhnor_03 NPC_FIC n2emp_03 natju_03 pemp_03 caem2_03 ancon_03 VVEND_03

ren ano_03 t
label variable t "Year"
ren ntrab_03 worker_id
ren sexo_03 gender
label variable gender "Gender"
ren habil1_03 habil
ren idade_03_TB_COD age
label variable age "Age"
ren rbase_03 base_wage
label variable base_wage "Remuneração Base"
ren rprg_03 pr_reg
ren nhnor_03 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_03 nutsii
label variable nutsii "NUTS II"
ren natju_03 natju
label variable natju "Natureza Jurídica"
ren pemp_03 pessoal
ren ancon_03 ano_const
ren VVEND_03 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_03 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95|cae_2d==96|cae_2d==97
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 82.337 if t==2003
label variable cpi "Consumer Price Index (base 2008=100)"

save "QP_2003_Cardoso", replace

//------------------------------------------------------------------------------
//2004

*Workers
clear all

use "QP_Trabalhadores_2004_Fins_Cientificos.dta"

keep ano_04 nuemp_04 ntrab_04 sexo_04 habil1_04 idade_04_TB_COD rbase_04 rprg_04 nhnor_04

*Merge firms dataset with workers dataset
ren nuemp_04 NUEMP
merge m:1 NUEMP ano_04 using "QP_Emp_04.dta"
keep if _merge==3
drop _merge

keep ano_04 ntrab_04 sexo_04 habil1_04 idade_04_TB_COD rbase_04 rprg_04 nhnor_04 NPC_FIC n2emp_04 natju_04 pemp_04 caem2_04 ancon_04 VVEND_04

ren ano_04 t
label variable t "Year"
ren ntrab_04 worker_id
ren sexo_04 gender
label variable gender "Gender"
ren habil1_04 habil
ren idade_04_TB_COD age
label variable age "Age"
ren rbase_04 base_wage
label variable base_wage "Remuneração Base"
ren rprg_04 pr_reg
ren nhnor_04 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_04 nutsii
label variable nutsii "NUTS II"
ren natju_04 natju
label variable natju "Natureza Jurídica"
ren pemp_04 pessoal
ren ancon_04 ano_const
ren VVEND_04 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_04 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95|cae_2d==96|cae_2d==97
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi = 84.313 if t==2004
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2004_Cardoso", replace

//------------------------------------------------------------------------------
//2005

*Workers
clear all

use "QP_Trabalhadores_2005_Fins_Cientificos.dta"

keep ano_05 nuemp_05 ntrab_05 sexo_05 habil1_05 idade_05_TB_COD rbase_05 rprg_05 nhnor_05

*Merge firms dataset with workers dataset
ren nuemp_05 NUEMP
merge m:1 NUEMP ano_05 using "QP_Emp_05.dta"
keep if _merge==3
drop _merge

keep ano_05 ntrab_05 sexo_05 habil1_05 idade_05_TB_COD rbase_05 rprg_05 nhnor_05 NPC_FIC n2emp_05 natju_05 pemp_05 caem2_05 ancon_05 vvend_05

ren ano_05 t
label variable t "Year"
ren ntrab_05 worker_id
ren sexo_05 gender
label variable gender "Gender"
ren habil1_05 habil
ren idade_05_TB_COD age
label variable age "Age"
ren rbase_05 base_wage
label variable base_wage "Remuneração Base"
ren rprg_05 pr_reg
ren nhnor_05 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_05 nutsii
label variable nutsii "NUTS II"
ren natju_05 natju
label variable natju "Natureza Jurídica"
ren pemp_05 pessoal
ren ancon_05 ano_const
ren vvend_05 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_05 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95|cae_2d==96|cae_2d==97
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==2
replace hab_lit="2" if habil==3
replace hab_lit="3" if habil==4
replace hab_lit="4" if habil==5
replace hab_lit="5" if habil==6|habil==7
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi=87.123 if t==2005
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2005_Cardoso", replace

//------------------------------------------------------------------------------
//2006

*Workers
clear all

use "QP_Trabalhadores_2006_Fins_Cientificos.dta"

keep ano_06 nuemp_06 ntrab_06 sexo_06 habil2_06 idade_06_TB_COD rbase_06 rprg_06 nhnor_06

*Merge firms dataset with workers dataset
ren nuemp_06 NUEMP
merge m:1 NUEMP ano_06 using "QP_Emp_06.dta"
keep if _merge==3
drop _merge

keep ano_06 ntrab_06 sexo_06 habil2_06 idade_06_TB_COD rbase_06 rprg_06 nhnor_06 NPC_FIC n2emp_06 natju_06 pemp_06 caem2_06 ancon_06 vvend_06

ren ano_06 t
label variable t "Year"
ren ntrab_06 worker_id
ren sexo_06 gender
label variable gender "Gender"
ren habil2_06 habil
ren idade_06_TB_COD age
label variable age "Age"
ren rbase_06 base_wage
label variable base_wage "Remuneração Base"
ren rprg_06 pr_reg
ren nhnor_06 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_06 nutsii
label variable nutsii "NUTS II"
ren natju_06 natju
label variable natju "Natureza Jurídica"
ren pemp_06 pessoal
ren ancon_06 ano_const
ren vvend_06 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_06 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==17|cae_2d==18|cae_2d==19
replace sector="1" if cae_2d==20|cae_2d==36
replace sector="2" if cae_2d==21|cae_2d==22
replace sector="3" if cae_2d==23|cae_2d==24|cae_2d==25
replace sector="4" if cae_2d==26
replace sector="5" if cae_2d==27|cae_2d==28|cae_2d==29|cae_2d==30|cae_2d==31
replace sector="6" if cae_2d==32|cae_2d==33|cae_2d==34|cae_2d==35
replace sector="7" if cae_2d==50|cae_2d==51|cae_2d==52
replace sector="8" if cae_2d==55
replace sector="9" if cae_2d==60|cae_2d==61|cae_2d==62|cae_2d==63|cae_2d==64
replace sector="10" if cae_2d==65|cae_2d==66|cae_2d==67
replace sector="11" if cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74
replace sector="12" if cae_2d==80
replace sector="13" if cae_2d==85
replace sector="14" if cae_2d==90
replace sector="15" if cae_2d==91
replace sector="16" if cae_2d==92
replace sector="17" if cae_2d==93|cae_2d==95|cae_2d==96|cae_2d==97
replace sector="18" if cae_2d==15|cae_2d==16
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi=89.898 if t==2006
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2006_Cardoso", replace

//------------------------------------------------------------------------------
//2007

*Workers
clear all

use "QP_Trabalhadores_2007_Fins_Cientificos.dta"

keep ano_07 nuemp_07 ntrab_07 sexo_07 habil2_07 idade_07_TB_COD rbase_07 rprg_07 nhnor_07

*Merge firms dataset with workers dataset
ren nuemp_07 NUEMP
merge m:1 NUEMP ano_07 using "QP_Emp_07.dta"
keep if _merge==3
drop _merge

keep ano_07 ntrab_07 sexo_07 habil2_07 idade_07_TB_COD rbase_07 rprg_07 nhnor_07 NPC_FIC n2emp_07 natju_07 pemp_07 caem2_07 ancon_07 vvend_07

ren ano_07 t
label variable t "Year"
ren ntrab_07 worker_id
ren sexo_07 gender
label variable gender "Gender"
ren habil2_07 habil
ren idade_07_TB_COD age
label variable age "Age"
ren rbase_07 base_wage
label variable base_wage "Remuneração Base"
ren rprg_07 pr_reg
ren nhnor_07 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_07 nutsii
label variable nutsii "NUTS II"
ren natju_07 natju
label variable natju "Natureza Jurídica"
ren pemp_07 pessoal
ren ancon_07 ano_const
ren vvend_07 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_07 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==38
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi=92.564 if t==2007
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2007_Cardoso", replace

//------------------------------------------------------------------------------
//2008

*Workers
clear all

use "QP_Trabalhadores_2008_Fins_Cientificos.dta"

keep ano_08 nuemp_08 ntrab_08 sexo_08 habil2_08 idade_08_TB_COD rbase_08 rprg_08 nhnor_08

*Merge firms dataset with workers dataset
ren nuemp_08 NUEMP
merge m:1 NUEMP ano_08 using "QP_Emp_08.dta"
keep if _merge==3
drop _merge

keep ano_08 ntrab_08 sexo_08 habil2_08 idade_08_TB_COD rbase_08 rprg_08 nhnor_08 NPC_FIC n2emp_08 natju_08 pemp_08 caem2_08 ancon_08 vvend_08

ren ano_08 t
label variable t "Year"
ren ntrab_08 worker_id
ren sexo_08 gender
label variable gender "Gender"
ren habil2_08 habil
ren idade_08_TB_COD age
label variable age "Age"
ren rbase_08 base_wage
label variable base_wage "Remuneração Base"
ren rprg_08 pr_reg
ren nhnor_08 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_08 nutsii
label variable nutsii "NUTS II"
ren natju_08 natju
label variable natju "Natureza Jurídica"
ren pemp_08 pessoal
ren ancon_08 ano_const
ren vvend_08 vendas

*Activity Sector
*Trying to guess which industry dummies were kept
ren caem2_08 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==38
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi=94.173 if t==2008
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2008_Cardoso", replace

//------------------------------------------------------------------------------
//2009

*Workers
clear all

use "QP_Trabalhadores_2009_Fins_Cientificos.dta"

keep ano_09 nuemp_09 ntrab_09 sexo_09 nacio_09 prof_2d09 habil2_09 idade_09_TB_COD antg_09 nqua1_09 rbase_09 rprg_09 nhnor_09

*Merge firms dataset with workers dataset

merge m:1 nuemp_09 ano_09 using "QP_Emp_09.dta"
keep if _merge==3
drop _merge

keep ano_09 nuemp_09 ntrab_09 sexo_09 prof_2d09 habil2_09 idade_09_TB_COD antg_09 nqua1_09 rbase_09 rprg_09 nhnor_09 NPC_FIC n2emp_09 natju_09 PEMP_09 ancon_09 caem2_09 vvend_09

ren ano_09 t
label variable t "Year"
ren ntrab_09 worker_id
ren sexo_09 gender
label variable gender "Gender"
ren prof_2d09 prof_2d
ren habil2_09 habil
ren idade_09_TB_COD age
label variable age "Age"
ren antg_09 tenure
label variable tenure "Tenure"
ren nqua1_09 qual_lev
label variable qual_lev "Qualification level"
ren rbase_09 base_wage
label variable base_wage "Remuneração Base"
ren rprg_09 prest_reg
ren nhnor_09 horas
ren NPC_FIC id
label variable id "Firm id"
ren n2emp_09 nutsii
label variable nutsii "NUTS II"
ren natju_09 natju
ren PEMP_09 pessoal
label variable pessoal "Number of Workers"
ren ancon_09 ano_const
ren vvend_09 vendas
ren nuemp_09 NUEMP

*Activity Sector
*Recoding sectors
ren caem2_09 cae_2d
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==35|cae_2d==36|cae_2d==37|cae_2d==38|cae_2d==39
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 0 "Lower than 4 years educations or ignored" 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Generating CPI variable using OECD Data
gen double cpi=95.207 if t==2009
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2009_Cardoso", replace

//------------------------------------------------------------------------------
//2010

*Workers
clear all

use "QP_Trabalhadores_2010_Fins_Cientificos.dta"

keep ANO NUEMP EMP_ID ntrab sexo nacio prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais

*Merge firms dataset with workers dataset

label variable NUEMP "Número da Empresa"
merge m:1 NUEMP EMP_ID ANO using "QP_Emp_10.dta"
keep if _merge==3
drop _merge

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais NPC_FIC nut2_emp natju pemp ancon CAE2 vn

ren ANO t
label variable t "Year"
ren ntrab worker_id
ren sexo gender
label variable gender "Gender"
ren habil2 habil
ren idade_Cod age
label variable age "Age"
ren antig tenure
label variable tenure "Tenure"
ren nqual1 qual_lev
label variable qual_lev "Qualification level"
ren rbase base_wage
label variable base_wage "Remuneração Base"
ren hnormais horas
ren NPC_FIC id
label variable id "Firm id"
ren nut2_emp nutsii
label variable nutsii "NUTS II"
ren pemp pessoal
label variable pessoal "Number of Workers"
ren vn vendas

*Activity Sector
*Recoding sectors
ren CAE2 cae_2d
destring cae_2d, replace
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==35|cae_2d==36|cae_2d==37|cae_2d==38|cae_2d==39
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 0 "Lower than 4 years educations or ignored" 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Transforming constitution year from yearmonth to year
gen ano_const=string(ancon)
replace ano_const=substr(ano_const,1,4)
destring ano_const, replace
drop ancon

*Destringing age
replace age="17" if age=="<=17"
replace age="68" if age==">=68"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignored" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi=95.819 if t==2010
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2010_Cardoso", replace

//------------------------------------------------------------------------------
//2011

*Workers
clear all

use "QP_Trabalhadores_2011_Fins_Cientificos.dta"

keep ANO NUEMP EMP_ID ntrab sexo nacio prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais

*Merge firms dataset with workers dataset

label variable NUEMP "Número da Empresa"
merge m:1 NUEMP EMP_ID ANO using "QP_Emp_11.dta"
keep if _merge==3
drop _merge

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais NPC_FIC nut2_emp natju pemp ancon CAE2 vn

ren ANO t
label variable t "Year"
ren ntrab worker_id
ren sexo gender
label variable gender "Gender"
ren habil2 habil
ren idade_Cod age
label variable age "Age"
ren antig tenure
label variable tenure "Tenure"
ren nqual1 qual_lev
label variable qual_lev "Qualification level"
ren rbase base_wage
label variable base_wage "Remuneração Base"
ren hnormais horas
ren NPC_FIC id
label variable id "Firm id"
ren nut2_emp nutsii
label variable nutsii "NUTS II"
ren pemp pessoal
label variable pessoal "Number of Workers"
ren vn vendas

*Activity Sector
*Recoding sectors
ren CAE2 cae_2d
destring cae_2d, replace
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==35|cae_2d==36|cae_2d==37|cae_2d==38|cae_2d==39
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 0 "Lower than 4 years educations or ignored" 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Transforming constitution year from yearmonth to year
gen ano_const=string(ancon)
replace ano_const=substr(ano_const,1,4)
destring ano_const, replace
drop ancon

*Destringing age
replace age="17" if age=="<=17"
replace age="68" if age==">=68"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignored" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi=95.565 if t==2011
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2011_Cardoso", replace

//------------------------------------------------------------------------------
//2012

*Workers
clear all

use "QP_Trabalhadores_2012_Fins_Cientificos.dta"

keep ANO NUEMP EMP_ID ntrab sexo nacio prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais

*Merge firms dataset with workers dataset

label variable NUEMP "Número da Empresa"
merge m:1 NUEMP EMP_ID ANO using "QP_Emp_12.dta"
keep if _merge==3
drop _merge

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais NPC_FIC nut2_emp natju pemp ancon CAE2 vn

ren ANO t
label variable t "Year"
ren ntrab worker_id
ren sexo gender
label variable gender "Gender"
ren habil2 habil
ren idade_Cod age
label variable age "Age"
ren antig tenure
label variable tenure "Tenure"
ren nqual1 qual_lev
label variable qual_lev "Qualification level"
ren rbase base_wage
label variable base_wage "Remuneração Base"
ren hnormais horas
ren NPC_FIC id
label variable id "Firm id"
ren nut2_emp nutsii
label variable nutsii "NUTS II"
ren pemp pessoal
label variable pessoal "Number of Workers"
ren vn vendas

*Activity Sector
*Recoding sectors
ren CAE2 cae_2d
destring cae_2d, replace
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==35|cae_2d==36|cae_2d==37|cae_2d==38|cae_2d==39
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 0 "Lower than 4 years educations or ignored" 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Transforming constitution year from yearmonth to year
gen ano_const=string(ancon)
replace ano_const=substr(ano_const,1,4)
destring ano_const, replace
drop ancon

*Destringing age
replace age="17" if age=="<=17"
replace age="68" if age==">=68"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignored" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi=95.194 if t==2012
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2012_Cardoso", replace

//------------------------------------------------------------------------------
//2013

*Workers
clear all

use "QP_Trabalhadores_2013_Fins_Cientificos.dta"

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais

*Merge firms dataset with workers dataset

label variable NUEMP "Número da Empresa"
merge m:1 NUEMP EMP_ID ANO using "QP_Emp_13.dta"
keep if _merge==3
drop _merge

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais NPC_FIC nut2_emp natju pemp ancon CAE2 vn

ren ANO t
label variable t "Year"
ren ntrab worker_id
ren sexo gender
label variable gender "Gender"
ren habil2 habil
ren idade_Cod age
label variable age "Age"
ren antig tenure
label variable tenure "Tenure"
ren nqual1 qual_lev
label variable qual_lev "Qualification level"
ren rbase base_wage
label variable base_wage "Remuneração Base"
ren hnormais horas
ren NPC_FIC id
label variable id "Firm id"
ren nut2_emp nutsii
label variable nutsii "NUTS II"
ren pemp pessoal
label variable pessoal "Number of Workers"
ren vn vendas

*Activity Sector
*Recoding sectors
ren CAE2 cae_2d
destring cae_2d, replace
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==35|cae_2d==36|cae_2d==37|cae_2d==38|cae_2d==39
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 0 "Lower than 4 years educations or ignored" 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Transforming constitution year from yearmonth to year
gen ano_const=string(ancon)
replace ano_const=substr(ano_const,1,4)
destring ano_const, replace
drop ancon

*Destringing age
replace age="17" if age=="<=17"
replace age="68" if age==">=68"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignored" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi=97.334 if t==2013
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2013_Cardoso", replace

//------------------------------------------------------------------------------
//2014

*Workers
clear all

use "QP_Trabalhadores_2014_Fins_Cientificos.dta"

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais

*Merge firms dataset with workers dataset

label variable NUEMP "Número da Empresa"
merge m:1 NUEMP EMP_ID ANO using "QP_Emp_14.dta"
keep if _merge==3
drop _merge

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais NPC_FIC nut2_emp natju pemp ancon CAE2 vn

ren ANO t
label variable t "Year"
ren ntrab worker_id
ren sexo gender
label variable gender "Gender"
ren habil2 habil
ren idade_Cod age
label variable age "Age"
ren antig tenure
label variable tenure "Tenure"
ren nqual1 qual_lev
label variable qual_lev "Qualification level"
ren rbase base_wage
label variable base_wage "Remuneração Base"
ren hnormais horas
ren NPC_FIC id
label variable id "Firm id"
ren nut2_emp nutsii
label variable nutsii "NUTS II"
ren pemp pessoal
label variable pessoal "Number of Workers"
ren vn vendas

*Activity Sector
*Recoding sectors
ren CAE2 cae_2d
destring cae_2d, replace
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==35|cae_2d==36|cae_2d==37|cae_2d==38|cae_2d==39
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 0 "Lower than 4 years educations or ignored" 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Transforming constitution year from yearmonth to year
gen ano_const=string(ancon)
replace ano_const=substr(ano_const,1,4)
destring ano_const, replace
drop ancon

*Destringing age
replace age="17" if age=="<=17"
replace age="68" if age==">=68"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignored" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi=98.02 if t==2014
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2014_Cardoso", replace

//------------------------------------------------------------------------------
//2015

*Workers
clear all

use "QP_Trabalhadores_2015_Fins_Cientificos.dta"

keep ANO NUEMP EMP_ID ntrab sexo nacio prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais

*Merge firms dataset with workers dataset

label variable NUEMP "Número da Empresa"
merge m:1 NUEMP EMP_ID ANO using "QP_Emp_15.dta"
keep if _merge==3
drop _merge

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais NPC_FIC nut2_emp natju pemp ancon CAE2 vn

ren ANO t
label variable t "Year"
ren ntrab worker_id
ren sexo gender
label variable gender "Gender"
ren habil2 habil
ren idade_Cod age
label variable age "Age"
ren antig tenure
label variable tenure "Tenure"
ren nqual1 qual_lev
label variable qual_lev "Qualification level"
ren rbase base_wage
label variable base_wage "Remuneração Base"
ren hnormais horas
ren NPC_FIC id
label variable id "Firm id"
ren nut2_emp nutsii
label variable nutsii "NUTS II"
ren pemp pessoal
label variable pessoal "Number of Workers"
ren vn vendas

*Activity Sector
*Recoding sectors
ren CAE2 cae_2d
destring cae_2d, replace
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==35|cae_2d==36|cae_2d==37|cae_2d==38|cae_2d==39
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 0 "Lower than 4 years educations or ignored" 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Transforming constitution year from yearmonth to year
gen ano_const=string(ancon)
replace ano_const=substr(ano_const,1,4)
destring ano_const, replace
drop ancon

*Destringing age
replace age="17" if age=="<=17"
replace age="68" if age==">=68"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignored" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi=100 if t==2015
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2015_Cardoso", replace

//------------------------------------------------------------------------------
//2016

*Workers
clear all

use "QP_Trabalhadores_2016_Fins_Cientificos.dta"

keep ANO NUEMP EMP_ID ntrab sexo nacio prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais

*Merge firms dataset with workers dataset

label variable NUEMP "Número da Empresa"
merge m:1 NUEMP EMP_ID ANO using "QP_Emp_16.dta"
keep if _merge==3
drop _merge

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais NPC_FIC nut2_emp natju pemp ancon CAE2 vn

ren ANO t
label variable t "Year"
ren ntrab worker_id
ren sexo gender
label variable gender "Gender"
ren habil2 habil
ren idade_Cod age
label variable age "Age"
ren antig tenure
label variable tenure "Tenure"
ren nqual1 qual_lev
label variable qual_lev "Qualification level"
ren rbase base_wage
label variable base_wage "Remuneração Base"
ren hnormais horas
ren NPC_FIC id
label variable id "Firm id"
ren nut2_emp nutsii
label variable nutsii "NUTS II"
ren pemp pessoal
label variable pessoal "Number of Workers"
ren vn vendas

*Activity Sector
*Recoding sectors
ren CAE2 cae_2d
destring cae_2d, replace
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==35|cae_2d==36|cae_2d==37|cae_2d==38|cae_2d==39
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 0 "Lower than 4 years educations or ignored" 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Transforming constitution year from yearmonth to year
gen ano_const=string(ancon)
replace ano_const=substr(ano_const,1,4)
destring ano_const, replace
drop ancon

*Destringing age
replace age="17" if age=="<=17"
replace age="68" if age==">=68"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignored" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi=101.717 if t==2016
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2016_Cardoso", replace

//------------------------------------------------------------------------------
//2017

*Workers
clear all

use "QP_Trabalhadores_2017_Fins_Cientificos.dta"

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais

*Merge firms dataset with workers dataset

label variable NUEMP "Número da Empresa"
merge m:1 NUEMP EMP_ID ANO using "QP_Emp_17.dta"
keep if _merge==3
drop _merge

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais NPC_FIC nut2_emp natju pemp ANO_CONSTITUICAO CAE2 vn

ren ANO t
label variable t "Year"
ren ntrab worker_id
ren sexo gender
label variable gender "Gender"
ren habil2 habil
ren idade_Cod age
label variable age "Age"
ren antig tenure
label variable tenure "Tenure"
ren nqual1 qual_lev
label variable qual_lev "Qualification level"
ren rbase base_wage
label variable base_wage "Remuneração Base"
ren hnormais horas
ren NPC_FIC id
label variable id "Firm id"
ren nut2_emp nutsii
label variable nutsii "NUTS II"
ren pemp pessoal
label variable pessoal "Number of Workers"
ren ANO_CONSTITUICAO ancon
ren vn vendas

*Activity Sector
*Recoding sectors
ren CAE2 cae_2d
destring cae_2d, replace
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==35|cae_2d==36|cae_2d==37|cae_2d==38|cae_2d==39
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 0 "Lower than 4 years educations or ignored" 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Transforming constitution year from yearmonth to year
gen ano_const=string(ancon)
replace ano_const=substr(ano_const,1,4)
destring ano_const, replace
drop ancon

*Destringing age
replace age="17" if age=="<=17"
replace age="68" if age==">=68"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignored" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi=103.255 if t==2017
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2017_Cardoso", replace

//------------------------------------------------------------------------------
//2018

*Workers
clear all

use "QP_Trabalhadores_2018_Fins_Cientificos.dta"

keep ANO NUEMP EMP_ID ntrab sexo nacio prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais

*Merge firms dataset with workers dataset

label variable NUEMP "Número da Empresa"
merge m:1 NUEMP EMP_ID ANO using "QP_Emp_18.dta"
keep if _merge==3
drop _merge

keep ANO NUEMP EMP_ID ntrab sexo prof_2d habil2 idade_Cod antig nqual1 rbase prest_reg hnormais NPC_FIC nut2_emp natju pemp ANO_CONSTITUICAO CAE2 vn

ren ANO t
label variable t "Year"
ren ntrab worker_id
ren sexo gender
label variable gender "Gender"
ren habil2 habil
ren idade_Cod age
label variable age "Age"
ren antig tenure
label variable tenure "Tenure"
ren nqual1 qual_lev
label variable qual_lev "Qualification level"
ren rbase base_wage
label variable base_wage "Remuneração Base"
ren hnormais horas
ren NPC_FIC id
label variable id "Firm id"
ren nut2_emp nutsii
label variable nutsii "NUTS II"
ren pemp pessoal
label variable pessoal "Number of Workers"
ren ANO_CONSTITUICAO ancon
ren vn vendas

*Activity Sector
*Recoding sectors
ren CAE2 cae_2d
destring cae_2d, replace
gen sector="AAA"
label variable sector "Sector of Activity"
replace sector="0" if cae_2d==13|cae_2d==14|cae_2d==15
replace sector="1" if cae_2d==16|cae_2d==31
replace sector="2" if cae_2d==17|cae_2d==18
replace sector="3" if cae_2d==19|cae_2d==20|cae_2d==21|cae_2d==22
replace sector="4" if cae_2d==23
replace sector="5" if cae_2d==24|cae_2d==25|cae_2d==26|cae_2d==27|cae_2d==28
replace sector="6" if cae_2d==29|cae_2d==30|cae_2d==32
replace sector="7" if cae_2d==33|cae_2d==45|cae_2d==46|cae_2d==47
replace sector="8" if cae_2d==55|cae_2d==56
replace sector="9" if cae_2d==49|cae_2d==50|cae_2d==51|cae_2d==52|cae_2d==53|cae_2d==58|cae_2d==59|cae_2d==60|cae_2d==61
replace sector="10" if cae_2d==62|cae_2d==63|cae_2d==64|cae_2d==65|cae_2d==66
replace sector="11" if cae_2d==68|cae_2d==69|cae_2d==70|cae_2d==71|cae_2d==72|cae_2d==73|cae_2d==74|cae_2d==75|cae_2d==77|cae_2d==78|cae_2d==79|cae_2d==80|cae_2d==81|cae_2d==82
replace sector="12" if cae_2d==85
replace sector="13" if cae_2d==86|cae_2d==87|cae_2d==88
replace sector="14" if cae_2d==35|cae_2d==36|cae_2d==37|cae_2d==38|cae_2d==39
replace sector="15" if cae_2d==94
replace sector="16" if cae_2d==90|cae_2d==91|cae_2d==92|cae_2d==93
replace sector="17" if cae_2d==95|cae_2d==96|cae_2d==97|cae_2d==98
replace sector="18" if cae_2d==10|cae_2d==11|cae_2d==12
drop if sector=="AAA"
destring sector, replace
drop cae_2d
label define sectord 0 "Textiles, clothing, leather" 1 "Wood, cork, furniture" 2 "Paper, printing" 3 "Chemicals, rubber, plastic" 4 "Other non-metallic mineral prod." 5 "Metals, machinery" 6 "Other manuf." 7 "Trade, repairs" 8 "Hotels, restaurants" 9 "Transport, communication" 10 "Financial intermediation" 11 "Real estate, renting and business activities" 12 "Education" 13 "Health, social serv." 14 "Sewage, refuse disposal" 15 "Membership orgs." 16 "Recreational, cultural, sports activ." 17 "Other household, personal serv." 18 "food, bev."
label value sector sectord /* Label the values of the variable according to Cardoso */

*Nuts II
gen Lisbon=0
replace Lisbon=1 if nutsii==17
label variable Lisbon "Dummy for Lisbon"
drop nutsii

*Habilitações Literárias
gen hab_lit="0"
label variable hab_lit "Highest level of Education Achieved"
replace hab_lit="1" if habil==21
replace hab_lit="2" if habil==22
replace hab_lit="3" if habil==23
replace hab_lit="4" if habil==31
replace hab_lit="5" if habil==40|habil==50|habil==60|habil==70|habil==80
destring hab_lit, replace
label define habilitaçoes 0 "Lower than 4 years educations or ignored" 1 "4 years education" 2 "6 years education" 3 "9 years education" 4 "High-school degree" 5 "University Degree"
label value hab_lit habilitaçoes
drop habil

*Transforming constitution year from yearmonth to year
gen ano_const=string(ancon)
replace ano_const=substr(ano_const,1,4)
destring ano_const, replace
drop ancon

*Destringing age
replace age="17" if age=="<=17"
replace age="68" if age==">=68"
replace age="0" if age==""
destring age, replace
label define aged 0 "Ignored" 17 "<=17" 68 ">=68"
label value age aged

*Generating CPI variable using OECD Data
gen double cpi=105.127 if t==2018
label variable cpi "Consumer Price Index (base 2015=100)"

save "QP_2018_Cardoso", replace

//------------------------------------------------------------------------------
*Appending the datasets

clear all
set more off
cd F:\Tese\Base_de_dados\Dataset\Quadros_de_Pessoal\dta

use "QP_1986_Cardoso"
append using "QP_1987_Cardoso" "QP_1988_Cardoso" "QP_1989_Cardoso" "QP_1990_Cardoso" "QP_1991_Cardoso" "QP_1992_Cardoso" "QP_1993_Cardoso" "QP_1994_Cardoso" "QP_1995_Cardoso" "QP_1996_Cardoso" "QP_1997_Cardoso" "QP_1998_Cardoso" "QP_1999_Cardoso" "QP_2000_Cardoso" "QP_2001_Cardoso" "QP_2002_Cardoso" "QP_2003_Cardoso" "QP_2004_Cardoso" "QP_2005_Cardoso" "QP_2006_Cardoso" "QP_2007_Cardoso" "QP_2008_Cardoso" "QP_2009_Cardoso" "QP_2010_Cardoso" "QP_2011_Cardoso" "QP_2012_Cardoso" "QP_2013_Cardoso" "QP_2014_Cardoso" "QP_2015_Cardoso" "QP_2016_Cardoso" "QP_2017_Cardoso" "QP_2018_Cardoso"

*Correcting prest reg
replace pr_reg=prest_reg if pr_reg==.

*Drop observations with errors
drop if id==0

*Deflating monetary variables
replace base_wage=((base_wage)*(100/cpi))
replace pr_reg=((pr_reg)*(100/cpi))

*Correcting firm age inconsistencies and creating firm age variable
replace ano_const=. if ano_const==0
bys id: egen mode_birth=mode(ano_const), maxmode
replace ano_const=mode_birth
gen firm_age=t-ano_const
label variable firm_age "Firm age"
drop if ano_const==.
drop ano_const mode_birth

bys id: egen min_firm_age=min(firm_age)
drop if min_firm_age<0
drop min_firm_age

*Correcting age inconsistencies
replace age=. if age==0
gen birth_year = t-age
bys worker_id: egen mode_birth=mode(birth_year), maxmode
replace birth_year=mode_birth
replace age=t-birth_year
drop if birth_year==.
drop birth_year mode_birth

*Correcting age of workers to only 18-65 years old
drop if age<18
drop if age>65

*drop workers with invalid id number
drop if worker_id==0

*Only workers who are wage-earners
gen wage=base_wage+pr_reg
drop if wage==0

*Dropping duplicate observations
duplicates drop

*Deleting outliers: workers with reported wages 10*99 percentile
summarize wage, detail
keep if inrange(wage, r(p1), r(p99))

*Correcting number of workers
gen n=1
bys id t: gen sum_pessoal=sum(n)
bys id t: egen max_pessoal=max(sum_pessoal)
replace pessoal=max_pessoal
drop sum_pessoal max_pessoal n

*Drop firms with less than 6 workers
bys id: egen min_worker=min(pessoal) 
drop if min_worker < 6
drop min_worker

*Recoding Natureza Jurídica to Private, Public, Foreign
gen private=0
replace private=1 if natju==7|natju==8|natju==11|natju==12|natju==13|natju==14|natju==15|natju==16|natju==17|natju==18|natju==19|natju==21|natju==23|natju==30|natju==31|natju==32|natju==33|natju==34|natju==35|natju==36|natju==37|natju==38|natju==39|natju==41|natju==51|natju==61|natju==81|natju==83|natju==91|natju==95|natju==98
gen public=0
replace public=1 if natju==1|natju==2|natju==4|natju==6
gen foreign=0
replace foreign=1 if natju==71|natju==72|natju==73|natju==74|natju==75|natju==79
drop natju

*Deriving variables, shares of workers instead of workers
*Generating Shares

*Yearly Worker Hours
bys id t: gen sum_horas=sum(horas)
bys id t: egen max_horas=max(sum_horas)
drop if max_horas==0

*Gender shares
bys id t: gen sum_male = sum(horas) if gender==1
bys id t: egen max_male=max(sum_male)
bys id t: gen male_share =(max_male/max_horas)
label variable male_share "Share of Male Workers"
drop sum_male max_male gender

*Literary Qualification Level Shares
bys id t: gen sum_4y = sum(horas) if hab_lit==1
bys id t: egen max_4y=max(sum_4y)
bys id t: gen s4y_share =(max_4y/max_horas)
label variable s4y_share "Share of Workers with 4 years education"
drop sum_4y max_4y
bys id t: gen sum_6y = sum(horas) if hab_lit==2
bys id t: egen max_6y=max(sum_6y)
bys id t: gen s6y_share =(max_6y/max_horas)
label variable s6y_share "Share of Workers with 6 years education"
drop sum_6y max_6y
bys id t: gen sum_9y = sum(horas) if hab_lit==3
bys id t: egen max_9y=max(sum_9y)
bys id t: gen s9y_share =(max_9y/max_horas)
label variable s9y_share "Share of Workers with 9 years education"
drop sum_9y max_9y
bys id t: gen sum_high = sum(horas) if hab_lit==4
bys id t: egen max_high=max(sum_high)
bys id t: gen high_share =(max_high/max_horas)
label variable high_share "Share of Workers with High-school degree"
drop sum_high max_high
bys id t: gen sum_univ = sum(horas) if hab_lit==5
bys id t: egen max_univ=max(sum_univ)
bys id t: gen univ_share =(max_univ/max_horas)
label variable univ_share "Share of Workers with University Degree"
drop sum_univ max_univ hab_lit

*Age shares
bys id t: gen sum_age24 = sum(horas) if age==18|age==19|age==20|age==21|age==22|age==23|age==24
bys id t: egen max_age24=max(sum_age24)
bys id t: gen age1824_share =(max_age24/max_horas)
label variable age1824_share "Share of Workers with Age 18 years <= Age <= 24 years"
drop sum_age24
bys id t: gen sum_age29 = sum(horas) if age==25|age==26|age==27|age==28|age==29
bys id t: egen max_age29=max(sum_age29)
bys id t: gen age2529_share =((max_age29)/max_horas)
label variable age2529_share "Share of Workers with 25 years < Age <= 29 years"
drop sum_age29 max_age24
bys id t: gen sum_age34 = sum(horas) if age==30|age==31|age==32|age==33|age==34
bys id t: egen max_age34=max(sum_age34)
bys id t: gen age3034_share =((max_age34)/max_horas)
label variable age3034_share "Share of Workers with 30 years < Age <= 34 years"
drop sum_age34 max_age29
bys id t: gen sum_age39 = sum(horas) if age==35|age==36|age==37|age==38|age==39
bys id t: egen max_age39=max(sum_age39)
bys id t: gen age3539_share =((max_age39)/max_horas)
label variable age3539_share "Share of Workers with 35 years < Age <= 39 years"
drop sum_age39 max_age34
bys id t: gen sum_age44 = sum(horas) if age==40|age==41|age==42|age==43|age==44
bys id t: egen max_age44=max(sum_age44)
bys id t: gen age4044_share =((max_age44)/max_horas)
label variable age4044_share "Share of Workers with 40 years < Age <= 44 years"
drop sum_age44 max_age39
bys id t: gen sum_age49 = sum(horas) if age==45|age==46|age==47|age==48|age==49
bys id t: egen max_age49=max(sum_age49)
bys id t: gen age4549_share =((max_age49)/max_horas)
label variable age4549_share "Share of Workers with 45 years < Age <= 49 years"
drop sum_age49 max_age44
bys id t: gen sum_age54 = sum(horas) if age==50|age==51|age==52|age==53|age==54
bys id t: egen max_age54=max(sum_age54)
bys id t: gen age5054_share =((max_age54)/max_horas)
label variable age5054_share "Share of Workers with 50 years < Age <= 54 years"
drop sum_age54 max_age49
bys id t: gen sum_age59 = sum(horas) if age==55|age==56|age==57|age==58|age==59
bys id t: egen max_age59=max(sum_age59)
bys id t: gen age5559_share =((max_age59)/max_horas)
label variable age5559_share "Share of Workers with 55 years < Age <= 59 years"
drop sum_age59 max_age54
bys id t: gen sum_age60 = sum(horas) if age==60|age==61|age==62|age==63|age==64|age==65
bys id t: egen max_age60=max(sum_age60)
bys id t: gen age6065_share =(max_age60/max_horas)
label variable age6065_share "Share of Workers with 60 years <= Age <= 65 years"
drop sum_age60 max_age60 max_age59 age

*Average Hourly Wage
bys id t: gen sum_wage=sum(wage)
bys id t: egen max_wage=max(sum_wage)
bys id t: gen avg_wage=((max_wage)/(max_horas))
drop sum_wage max_wage

*Drop irrelevant variables
drop worker_id base_wage pr_reg wage
drop horas sum_horas
drop NUEMP tenure prof_2d qual_lev prest_reg EMP_ID

*Dropping duplicates because we have the shares of workers now
duplicates drop

*Renaming Schooling variables for easier computation
ren s4y_share school1_share
ren s6y_share school2_share
ren s9y_share school3_share
ren high_share school4_share
ren univ_share school5_share

*Dropping firms without sales
bys id: egen max_vendas=max(vendas) 
drop if max_vendas==0
drop max_vendas

order id t firm_age pessoal sector Lisbon private public foreign age1824_share age2529_share age3034_share age3539_share age4044_share age4549_share age5054_share age5559_share age6065_share female_share school1_share school2_share school3_share school4_share school5_share
sort id t

save "QP_1986-2018_Cardoso", replace

//------------------------------------------------------------------------------
*Regression

clear all
set more off
cd F:\Tese\Base_de_dados\Dataset\Quadros_de_Pessoal\dta
use "QP_1986-2018_Cardoso"

/*Trying to correct firms with missing years
bys id: gen gap=_n
gen gap1=t-gap
egen float gap2=group(id gap1)
bys id gap2: egen gap3=count(gap1)
drop if gap3==1
drop gap gap1 gap2 gap3 */

*Correcting sales
bys id: gen sales=vendas[_n+1]
drop if sales==.
drop if sales==0

*Deflating monetary variables
replace sales=((sales)*(100/cpi))

*Deleting outliers: firms with reported sales 10*99 percentile
summarize sales, detail
keep if inrange(sales, r(p1), r(p99))

replace male_share=0 if male_share==.
*Generating logs
gen ln_pessoal=ln(pessoal)
drop pessoal
gen ln_sales=ln((sales)/(12*max_horas))
gen vendas_ph=((sales)/(12*max_horas))
gen ln_wage=ln(avg_wage)
drop vendas sales max_horas
gen female_share=(1-male_share)

*Creating dummies for sector, years
xi, prefix(yr) i.t
compress yr*
xi, prefix(sect) i.sector
compress sect*

drop if id[_n]==id[_n-1] & t[_n]==t[_n-1]

xtset id t, yearly

*Correcting . values
replace age1824_share=0 if age1824_share==.
replace age2529_share=0 if age2529_share==.
replace age3034_share=0 if age3034_share==.
replace age3539_share=0 if age3539_share==.
replace age4044_share=0 if age4044_share==.
replace age4549_share=0 if age4549_share==.
replace age5054_share=0 if age5054_share==.
replace age5559_share=0 if age5559_share==.
replace age6065_share=0 if age6065_share==.
replace school1_share=0 if school1_share==.
replace school2_share=0 if school2_share==.
replace school3_share=0 if school3_share==.
replace school4_share=0 if school4_share==.
replace school5_share=0 if school5_share==.


*Generating a lag of the dependent variable
bys id: gen l1_ln_sales=l1.ln_sales

*Generating lags of the shares of worker ages
bys id: gen l1_age1824_share=l1.age1824_share
bys id: gen lag2_age1824_share=l2.age1824_share
bys id: gen lag3_age1824_share=l3.age1824_share
bys id: gen l1_age2529_share=l1.age2529_share
bys id: gen lag2_age2529_share=l2.age2529_share
bys id: gen lag3_age2529_share=l3.age2529_share
bys id: gen l1_age3034_share=l1.age3034_share
bys id: gen lag2_age3034_share=l2.age3034_share
bys id: gen lag3_age3034_share=l3.age3034_share
bys id: gen l1_age3539_share=l1.age3539_share
bys id: gen lag2_age3539_share=l2.age3539_share
bys id: gen lag3_age3539_share=l3.age3539_share
bys id: gen l1_age4044_share=l1.age4044_share
bys id: gen lag2_age4044_share=l2.age4044_share
bys id: gen lag3_age4044_share=l3.age4044_share
bys id: gen l1_age4549_share=l1.age4549_share
bys id: gen lag2_age4549_share=l2.age4549_share
bys id: gen lag3_age4549_share=l3.age4549_share
bys id: gen l1_age5054_share=l1.age5054_share
bys id: gen lag2_age5054_share=l2.age5054_share
bys id: gen lag3_age5054_share=l3.age5054_share
bys id: gen l1_age5559_share=l1.age5559_share
bys id: gen lag2_age5559_share=l2.age5559_share
bys id: gen lag3_age5559_share=l3.age5559_share
bys id: gen l1_age6065_share=l1.age6065_share
bys id: gen lag2_age6065_share=l2.age6065_share
bys id: gen lag3_age6065_share=l3.age6065_share

*Generating first difference
gen Dln_wage=D.ln_wage
gen Dln_pessoal=D.ln_pessoal
gen Dfemale_share=D.female_share
gen Dln_sales=D.ln_sales
gen Dschool1_share=D.school1_share
gen Dschool2_share=D.school2_share
gen Dschool3_share=D.school3_share
gen Dschool4_share=D.school4_share
gen Dschool5_share=D.school5_share
gen Dage1824_share=D.age1824_share
gen Dage2529_share=D.age2529_share
gen Dage3034_share=D.age3034_share
gen Dage3539_share=D.age3539_share
gen Dage4044_share=D.age4044_share
gen Dage4549_share=D.age4549_share
gen Dage5054_share=D.age5054_share
gen Dage5559_share=D.age5559_share
gen Dage6065_share=D.age6065_share

*Regression
drop age3539_share lag2_age3539_share lag3_age3539_share Dage3539_share
drop sector

*Wages
reg ln_wage ln_pessoal firm_age public foreign Lisbon age* school* female_share yr* sect*, robust cluster(id)
outreg2 using cardoso, replace tex dec(3)
areg ln_wage ln_pessoal age* school* female_share yr*, robust  absorb(id) cluster(id)
outreg2 using cardoso, append tex dec(3)
ivreg210 Dln_wage Dln_pessoal Dschool* Dfemale_share (Dage* = lag*), robust cluster(id) gmm
outreg2 using cardoso, append tex dec(3)

*Sales
reg ln_sales ln_pessoal firm_age public foreign Lisbon age* school* female_share yr* sect*, robust cluster(id)
outreg2 using cardoso, append tex dec(3)
areg ln_sales ln_pessoal age* school* female_share yr*, robust  absorb(id) cluster(id)
outreg2 using cardoso, append tex dec(3)
ivreg210 Dln_sales Dln_pessoal Dschool* Dfemale_share (Dage* = lag*), robust cluster(id) gmm
outreg2 using cardoso, append tex dec(3)

xtreg ln_sales ln_pessoal age* school* female_share yr*, fe
xtabond2 ln_sales ln_pessoal age* school* female_share yr*, gmm(l1_age*,collapse) iv(yr* lag*) noleveleq nodiffsargan twostep small


