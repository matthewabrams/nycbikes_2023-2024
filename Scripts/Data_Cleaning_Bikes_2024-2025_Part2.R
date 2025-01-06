# install and load necessary packages

library(tidyverse)
library(lubridate)
library(readr)
library(data.table)

tripdata <- fread("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/New Dataset/Drafted_Bike_Data_2024-2025.csv")

colnames(tripdata)  # List of column names
head(tripdata)  # See the first 6 rows of data frame.
str(tripdata)  # See list of columns and data types (numeric, character, etc)
summary(tripdata)  # Statistical summary of data. Mainly for numeric. Shows minimum date taking place in 2023. 

# Count missing values in each column, shows no missing values here

missing_per_column <- colSums(is.na(tripdata))
missing_per_column

# Double checking for each column in case there are white spaces considered as values

rideable_type_na <- table(tripdata$rideable_type) 
rideable_type_na

start_station_na <- table(tripdata$start_station_name) 
view(start_station_na)

end_station_na <- table(tripdata$end_station_name) 
view(end_station_na)

biker_na <- table(tripdata$member_casual) 
biker_na

# Start Station and End Station columns reveals empty spaces ('') yet marked as values

tripdata_clean1 <- tripdata[start_station_name != ''] # Dropping rows where either start or end station values have ""
tripdata_clean2 <- tripdata_clean1[end_station_name != '']

# We have removed 129,980 rows with blank values

start_station_na <- table(tripdata_clean2$start_station_name) 
view(start_station_na)

end_station_na <- table(tripdata_clean2$end_station_name) 
view(end_station_na)

# filtering for data only containing entries within 2024.

tripdata_clean2 <- tripdata_clean2[started_at >= '2024-01-01' & ended_at <= '2025-01-01'] 

# Though entries had people started rides on 12/31/23 and ended on 1/1/24, we want to focus on rides starting in the year 2024 (even if it means finishing the ride in 2025 if started on the last day of 2024).

# After filtering, we removed 8,222 entries where rides started in 2023 and ended in 2025.

tripdata_clean2 <- unique(tripdata_clean2) # Returns all entries without duplicates

tripdata_clean2 

# Replace multiple values in multiple columns

tripdata_clean2$rideable_type[tripdata_clean2$rideable_type =="electric_bike"] <- "electric"
tripdata_clean2$rideable_type[tripdata_clean2$rideable_type=="classic_bike"] <- "classic"

# Renaming columns 

colnames(tripdata_clean2)[colnames(tripdata_clean2) == "member_casual"] <- "rider_type"
colnames(tripdata_clean2)[colnames(tripdata_clean2) == "rideable_type"] <- "bike_type"

tripdata_clean2

fwrite(tripdata_clean2, "/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/New Dataset/Drafted_Bike_Data2_2024-2025.csv", row.names=FALSE)