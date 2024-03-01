import delimited using "raw/worldbank-lifeexpectancy-raw.csv", clear


keep time countryname gdppercapitapppconstant2011inter populationtotalsppoptotl lifeexpectancyatbirthtotalyearss

rename countryname country_name
rename gdppercapitapppconstant2011inter gdp_per_capita
rename populationtotalsppoptotl population 
rename lifeexpectancyatbirthtotalyearss life_expectancy



destring gdp_per_capita, replace force 
destring population, replace force
destring life_expectancy, replace force

drop if missing(population)
drop if missing(life_expectancy)
drop if missing(gdp_per_capita)

browse

save "clean/wb_lifeexpectancy_clean.dta", replace