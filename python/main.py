import pandas as pd
import os

# Defining the folder path where the data is stored
folder_path = "WB_LifeExpectancy_data/"

# Listing all files in the specified folder
files = os.listdir(folder_path)

# An empty list to store the paths of all files
file_list = []

# Iterate through each file in the folder and its subfolders
for file in files:
    subfolder_path = folder_path + file
    subfolder = os.listdir(subfolder_path)

    # Build the full path for each file and append it to the file_list
    for subfolderfile in subfolder:
        file_list.append(subfolder_path + subfolderfile)

# Print the list of file paths
print(file_list)

# Open the CSV file to read headers
f = open("WB_LifeExpectancy_data/Raw_data/worldbank-lifeexpectancy-raw.csv")

# Headers: (whitespaces removed)
headers = f.readline().strip().split(",")

f.close()

# Indexing headers for each column
for i, header in enumerate(headers):
    print(i, header)

# Usings pandas to read the CSV file
df = pd.read_csv("WB_LifeExpectancy_data/Raw_data/worldbank-lifeexpectancy-raw.csv")

# Print the first few rows of the DataFrame
print(df.head())

# Inspect the number of columns and rows in the DataFrame
print(df.shape)

# Using dictionary for mapping original column names to new column names
column_mapping = {
    "Life expectancy at birth, total (years) [SP.DYN.LE00.IN]" : "life_expectancy",
    "GDP per capita, PPP (constant 2011 international $) [NY.GDP.PCAP.PP.KD]" : "gdp_per_capita",
    "Population, total [SP.POP.TOTL]" : "population",
    "Country Name": "country_name",
    "Country Code": "country_code",
    "Time Code": "time_code"
}

# Rename columns in the DataFrame using the defined mapping
df.rename(columns=column_mapping, inplace=True)

# Print the updated column names
print(df.columns)
