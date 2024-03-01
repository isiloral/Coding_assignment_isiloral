*read the clean data
use "WB_LifeExpectancy_data/clean_data/wb_lifeexpectancy_clean.dta", clear

*Sort the data by country and year
sort country_name time

*Create a new variable to store the count of years for each country
egen count_years = count(time), by(country_name)

*Identify the maximum number of years = 28
egen max_years = max(count_years)

*browse

*Keep only the countries with maximum number of years
keep if count_years == max_years

*Drop the other columns that no longer necessary
drop count_years max_years

*summarize the variable of interest
sum life_expectancy

*Create a scatter plot to observe relationship between gdp per capita and life expectancy
scatter gdp_per_capita life_expectancy

*Save the scatter plot into new folder called Plots
graph export "Plots/scatter_plot_gdppercapita.png", replace

*create and save the scatter plot2 to observe relationship between population and life expectancy
scatter population life_expectancy
graph export "Plots/scatter_plot_population.png", replace

*Linear regression
regress life_expectancy gdp_per_capita population


