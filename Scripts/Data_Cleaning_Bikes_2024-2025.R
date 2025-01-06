# install and load necessary packages

library(tidyverse)
library(lubridate)
library(readr)
library(data.table)

# import data in R studio

jan24 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202401-citibike-tripdata.csv")
feb24 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202402-citibike-tripdata.csv")
mar24 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202403-citibike-tripdata.csv")
apr24 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202404-citibike-tripdata.csv")
may24_part1 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202405-citibike-tripdata_1.csv")
may24_part2 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202405-citibike-tripdata_2.csv")
may24_part3 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202405-citibike-tripdata_3.csv")
may24_part4 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202405-citibike-tripdata_4.csv")
may24_part5 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202405-citibike-tripdata_5.csv")
jun24_part1 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202406-citibike-tripdata_1.csv")
jun24_part2 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202406-citibike-tripdata_2.csv")
jun24_part3 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202406-citibike-tripdata_3.csv")
jun24_part4 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202406-citibike-tripdata_4.csv")
jun24_part5 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202406-citibike-tripdata_5.csv")
jul24_part1 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202407-citibike-tripdata_1.csv")
jul24_part2 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202407-citibike-tripdata_2.csv")
jul24_part3 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202407-citibike-tripdata_3.csv")
jul24_part4 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202407-citibike-tripdata_4.csv")
jul24_part5 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202407-citibike-tripdata_5.csv")
aug24_part1 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202408-citibike-tripdata_1.csv")
aug24_part2 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202408-citibike-tripdata_2.csv")
aug24_part3 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202408-citibike-tripdata_3.csv")
aug24_part4 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202408-citibike-tripdata_4.csv")
aug24_part5 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202408-citibike-tripdata_5.csv")
sep24_part1 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202409-citibike-tripdata_1.csv")
sep24_part2 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202409-citibike-tripdata_2.csv")
sep24_part3 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202409-citibike-tripdata_3.csv")
sep24_part4 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202409-citibike-tripdata_4.csv")
sep24_part5 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202409-citibike-tripdata_5.csv")
oct24_part1 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202410-citibike-tripdata_1.csv")
oct24_part2 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202410-citibike-tripdata_2.csv")
oct24_part3 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202410-citibike-tripdata_3.csv")
oct24_part4 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202410-citibike-tripdata_4.csv")
oct24_part5 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202410-citibike-tripdata_5.csv")
oct24_part6 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202410-citibike-tripdata_6.csv")
nov24_part1 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202411-citibike-tripdata_1.csv")
nov24_part2 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202411-citibike-tripdata_2.csv")
nov24_part3 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202411-citibike-tripdata_3.csv")
nov24_part4 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202411-citibike-tripdata_4.csv")
dec24_part1 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202412-citibike-tripdata_1.csv")
dec24_part2 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202412-citibike-tripdata_2.csv")
dec24_part3 <- read_csv("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/Datasets/202412-citibike-tripdata_3.csv")

# to check data structures (dbl, chr, date)

str(jan24) 
str(feb24) 
str(mar24) 
str(apr24)
str(may24_part1)
str(may24_part2)
str(may24_part3)
str(may24_part4)
str(may24_part5) 
str(jun24_part1)
str(jun24_part2)
str(jun24_part3)
str(jun24_part4)
str(jun24_part5) 

str(jul24_part1) # Has an extra column "Unnamed: 0", need to drop
jul24_part1 = subset(jul24_part1, select = -c(`Unnamed: 0`)) # Dropping unwanted columns
str(jul24_part1)

str(jul24_part2) # Has an extra column "Unnamed: 0", need to drop
jul24_part2 = subset(jul24_part2, select = -c(`Unnamed: 0`)) # Dropping unwanted columns
str(jul24_part2)

str(jul24_part3) # Has an extra column "Unnamed: 0", need to drop and type of data for col start_station_id is col_character(), need to change it
jul24_part3 = subset(jul24_part3, select = -c(`Unnamed: 0`)) # Dropping unwanted columns
jul24_part3 <- transform(jul24_part3, start_station_id = as.numeric(start_station_id)) # transformed column start_station_id from character to numeric
str(jul24_part3)

str(jul24_part4) # Has an extra column "Unnamed: 0", need to drop and type of data for col start_station_id and end_station_id are col_character(), need to change it
jul24_part4 = subset(jul24_part4, select = -c(`Unnamed: 0`)) # Dropping unwanted columns
jul24_part4 <- transform(jul24_part4, start_station_id = as.numeric(start_station_id)) # transformed column start_station_id from character to numeric
jul24_part4 <- transform(jul24_part4, end_station_id = as.numeric(end_station_id)) # transformed column end_station_id from character to numeric
str(jul24_part4)

str(jul24_part5) # Has an extra column "Unnamed: 0", need to drop
jul24_part5 = subset(jul24_part5, select = -c(`Unnamed: 0`)) # Dropping unwanted columns
str(jul24_part5)

str(aug24_part1) # Has an extra column "rideable_type_duplicate_column_name_1", need to drop
aug24_part1 = subset(aug24_part1, select = -c(rideable_type_duplicate_column_name_1)) # Dropping unwanted columns
str(aug24_part1)

str(aug24_part2) # Has an extra column "rideable_type_duplicate_column_name_1", need to drop
aug24_part2 = subset(aug24_part2, select = -c(rideable_type_duplicate_column_name_1)) # Dropping unwanted columns
str(aug24_part2)

str(aug24_part3) # Has an extra column "rideable_type_duplicate_column_name_1", need to drop
aug24_part3 = subset(aug24_part3, select = -c(rideable_type_duplicate_column_name_1)) # Dropping unwanted columns
str(aug24_part3)

str(aug24_part4) # Has an extra column "rideable_type_duplicate_column_name_1", need to drop
aug24_part4 = subset(aug24_part4, select = -c(rideable_type_duplicate_column_name_1)) # Dropping unwanted columns
str(aug24_part4)

str(aug24_part5) # Has an extra column "rideable_type_duplicate_column_name_1", need to drop and type of data for col start_station_id is col_character(), need to change it
aug24_part5 = subset(aug24_part5, select = -c(rideable_type_duplicate_column_name_1)) # Dropping unwanted columns
aug24_part5 <- transform(aug24_part5, start_station_id = as.numeric(start_station_id)) # transformed column start_station_id from character to numeric
str(aug24_part5)

str(sep24_part1)
str(sep24_part2)
str(sep24_part3)
str(sep24_part4)
str(sep24_part5)
str(oct24_part1) 
str(oct24_part2) 

str(oct24_part3) # transformed colume end_station_id from character to numeric
oct24_part3 <- transform(oct24_part3, end_station_id = as.numeric(end_station_id)) 
str(oct24_part3) 

str(oct24_part4) 
str(oct24_part5) 

str(oct24_part6) # transformed colume end_station_id from character to numeric
oct24_part6 <- transform(oct24_part6, end_station_id = as.numeric(end_station_id)) 
str(oct24_part6)

str(nov24_part1) # transformed colume end_station_id from character to numeric
nov24_part1 <- transform(nov24_part1, end_station_id = as.numeric(end_station_id)) 
str(nov24_part1)

str(nov24_part2) 
str(nov24_part3)
str(nov24_part4) 
str(dec24_part1) 
str(dec24_part2)
str(dec24_part3) 

# merge individual monthly data frames into one large data frame

tripdata <- bind_rows(jan24, feb24, mar24, apr24, may24_part1, may24_part2, 
                      may24_part3, may24_part4, may24_part5, jun24_part1, 
                      jun24_part2, jun24_part3, jun24_part4, jun24_part5, 
                      jul24_part1, jul24_part2, jul24_part3, jul24_part4, jul24_part5,
                      aug24_part1, aug24_part2, aug24_part3, aug24_part4, 
                      aug24_part5, sep24_part1, sep24_part2, sep24_part3, 
                      sep24_part4, sep24_part5, oct24_part1, oct24_part2, 
                      oct24_part3, oct24_part4, oct24_part5, oct24_part6, 
                      nov24_part1, nov24_part2, nov24_part3, nov24_part4,
                      dec24_part1, dec24_part2, dec24_part3)

tripdata # Total of 44,399,598 records

tripdata = subset(tripdata, select = -c(ride_id, start_station_id, end_station_id, start_lat, start_lng, end_lat, end_lng)) # Dropping unwanted columns

fwrite(tripdata, "/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/New Dataset/Drafted_Bike_Data_2024-2025.csv", row.names=FALSE)
