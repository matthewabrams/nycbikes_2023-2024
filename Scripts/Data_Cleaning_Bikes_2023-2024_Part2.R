# install and load necessary packages
library(tidyverse)
library(lubridate)
library(readr)
library(data.table)

tripdata <- fread("/Users/matthewabrams/NYC Bikes 2023-2024/New Dataset/Drafted_Bike_Data_2023-2024.csv")

colnames(tripdata)  # List of column names
head(tripdata)  # See the first 6 rows of data frame.
str(tripdata)  # See list of columns and data types (numeric, character, etc)
summary(tripdata)  # Statistical summary of data. Mainly for numeric. Shows minimum date taking place in 2022. 

#count NA values in each column
sapply(tripdata, function(x) sum(is.na(x)))

tripdata_clean <- tripdata[started_at >= '2023-01-01' & ended_at < '2024-01-01'] #filtering for data only containing entries of the year 2023.

tripdata_clean[duplicated(tripdata_clean)] #Checking for duplicates, no duplicates
tripdata_clean = tripdata_clean[!duplicated(tripdata_clean)] # How we would filter out duplicates if there were any

fwrite(tripdata_clean, "/Users/matthewabrams/NYC Bikes 2023-2024/New Dataset/Drafted_Bike_Data2_2023-2024.csv", row.names=FALSE)