Project Goal:
The goal of this project is to provide meaningful data analysis to a business about where in the United States would be best for them to start their business. They will be looking to start their business in an area that has a high amount of kids and also a high average income per household.

Dataset:
The initial dataset that I used was from the 2011-2015 ACS 5-year Public Use Microdata Samples(PUMS) –CSV format.  I chose to download the United States Housing Unit Records dataset. This came in a zipped folder with ACS 2011-2015_PUMS_README file, and the housing unit records dataset broken up into four .csv files. This data came from the United States Census Bureau, more specifically “factfinder.census.gov”. This dataset held information about all households in the United States. The raw data was 5.7 GB, after cleaning the subset of data that I used was 216,071 KB. The raw dataset as a whole consisted of 7,420,038 rows and 209 columns. 

US_Data_Cleaning.R:
This R script is used to read in the large dataset in chunks of 100,000 rows at a time and store them into files that contain just the four columns that pertain to this project making the files more managable.

US_Data_Visualization.R:
This R script reads in the managable files and concatenates them into one large file where data analysis and visualization is then performed.

State_Classifier.py:
This Python script calls in a file holding the cleaned data for percentage of children in population and average household income per state in the US. It then sets parameters as to whether or not the state will be a successful area to start this business. It then adds a column to the data file stating either Yes, it will be successfull, or No, it will not be. The file is then outputted to its original .csv format.
