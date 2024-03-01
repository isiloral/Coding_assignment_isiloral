*import data
import delimited using "WB_LifeExpectancy_data\raw_data\worldbank-lifeexpectancy-raw.csv", clear

*keeping only the necessary columns for my analysis
keep time countryname gdppercapitapppconstant2011inter populationtotalsppoptotl lifeexpectancyatbirthtotalyearss

*rename the columns
rename countryname country_name
rename gdppercapitapppconstant2011inter gdp_per_capita
rename populationtotalsppoptotl population 
rename lifeexpectancyatbirthtotalyearss life_expectancy

*convert string into float for further analysis
destring gdp_per_capita, replace force 
destring population, replace force
destring life_expectancy, replace force

*dropping the null values
drop if missing(population)
drop if missing(life_expectancy)
drop if missing(gdp_per_capita)

*browse

*save the clean data
save "WB_LifeExpectancy_data/clean_data/wb_lifeexpectancy_clean.dta", replace