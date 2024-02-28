import pandas as pd
import os 

folder_path = "WB_LifeExpectancy_data/"

files = os.listdir(folder_path)

file_list = []

for file in files:
  subfolder_path = folder_path + file
  subfolder = os.listdir(subfolder_path)
  for subfolderfile in subfolder:
    file_list.append(subfolder_path + subfolderfile)

print(file_list)

f = open("WB_LifeExpectancy_data/Clean_data/worldbank-lifeexpectancy.csv")

headers = f.readline().strip().split(",")

f.close()

for i, header in enumerate(headers):
  print(i, header)

df = pd.read_csv("WB_LifeExpectancy_data/Clean_data/worldbank-lifeexpectancy.csv")

print(df.head())

#Inspecting the number of columns and rows
print(df.shape)

#using dictionaries
column_mapping = {"lifeexp" : "life_expectancy", "gdppc" : "gdp_percapita"}
df.rename(columns = column_mapping, inplace = True)
print(df.columns)
