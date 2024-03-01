clear 
use "clean/wb_lifeexpectancy_clean.dta", clear

// Sort the data by country and year
sort country_name time

// Create a new variable to store the count of years for each country
egen count_years = count(time), by(country_name)

// Identify the maximum number of years
egen max_years = max(count_years)

// Keep only the observations for countries with the maximum number of years
keep if count_years == max_years

// Drop the temporary variables
drop count_years max_years

sum life_expectancy

// Create a scatter plot
scatter gdp_per_capita life_expectancy

// Save the scatter plot (optional)
graph export "clean/scatter_plot_gdppercapita.png", replace

*scatter2
scatter population life_expectancy
graph export "clean/scatter_plot_population.png", replace

regress life_expectancy gdp_per_capita population


