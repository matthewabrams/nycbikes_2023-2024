# install and load necessary packages
library(tidyverse)
library(lubridate)
library(readr)
library(data.table)

# import data in R studio
jan23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202301-citibike-tripdata_1.csv")
jan23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202301-citibike-tripdata_2.csv")
feb23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202302-citibike-tripdata_1.csv")
feb23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202302-citibike-tripdata_2.csv")
mar23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202303-citibike-tripdata_1.csv")
mar23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202303-citibike-tripdata_2.csv")
mar23_part3 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202303-citibike-tripdata_3.csv")
apr23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202304-citibike-tripdata_1.csv")
apr23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202304-citibike-tripdata_2.csv")
apr23_part3 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202304-citibike-tripdata_3.csv")
may23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202305-citibike-tripdata_1.csv")
may23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202305-citibike-tripdata_2.csv")
may23_part3 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202305-citibike-tripdata_3.csv")
may23_part4 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202305-citibike-tripdata_4.csv")
jun23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202306-citibike-tripdata_1.csv")
jun23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202306-citibike-tripdata_2.csv")
jun23_part3 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202306-citibike-tripdata_3.csv")
jun23_part4 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202306-citibike-tripdata_4.csv")
jul23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202307-citibike-tripdata_1.csv")
jul23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202307-citibike-tripdata_2.csv")
jul23_part3 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202307-citibike-tripdata_3.csv")
jul23_part4 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202307-citibike-tripdata_4.csv")
aug23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202308-citibike-tripdata_1.csv")
aug23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202308-citibike-tripdata_2.csv")
aug23_part3 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202308-citibike-tripdata_3.csv")
aug23_part4 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202308-citibike-tripdata_4.csv")
sep23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202309-citibike-tripdata_1.csv")
sep23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202309-citibike-tripdata_2.csv")
sep23_part3 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202309-citibike-tripdata_3.csv")
sep23_part4 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202309-citibike-tripdata_4.csv")
oct23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202310-citibike-tripdata_1.csv")
oct23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202310-citibike-tripdata_2.csv")
oct23_part3 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202310-citibike-tripdata_3.csv")
oct23_part4 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202310-citibike-tripdata_4.csv")
nov23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202311-citibike-tripdata_1.csv")
nov23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202311-citibike-tripdata_2.csv")
nov23_part3 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202311-citibike-tripdata_3.csv")
dec23_part1 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202312-citibike-tripdata_1.csv")
dec23_part2 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202312-citibike-tripdata_2.csv")
dec23_part3 <- read_csv("/Users/matthewabrams/NYC Bikes 2023-2024/Datasets/202312-citibike-tripdata_3.csv")

# checking data sets for consistency
colnames(jan23_part1) 
colnames(jan23_part2) 
colnames(feb23_part1) 
colnames(feb23_part2)
colnames(mar23_part1)
colnames(mar23_part2)
colnames(mar23_part3)
colnames(apr23_part1)
colnames(apr23_part2) 
colnames(apr23_part3) 
colnames(may23_part1) 
colnames(may23_part2) 
colnames(may23_part3) 
colnames(may23_part4) 
colnames(jun23_part1) 
colnames(jun23_part2) 
colnames(jun23_part3) 
colnames(jun23_part4) 
colnames(jul23_part1) 
colnames(jul23_part2) 
colnames(jul23_part3) 
colnames(jul23_part4) 
colnames(aug23_part1) 
colnames(aug23_part2) 
colnames(aug23_part3) 
colnames(aug23_part4) 
colnames(sep23_part1) 
colnames(sep23_part2) 
colnames(sep23_part3) 
colnames(sep23_part4) 
colnames(oct23_part1) 
colnames(oct23_part2) 
colnames(oct23_part3) 
colnames(oct23_part4) 
colnames(nov23_part1) 
colnames(nov23_part2) 
colnames(nov23_part3) 
colnames(dec23_part1) 
colnames(dec23_part2) 
colnames(dec23_part3) 

## to check data structures (dbl, chr, date)
str(jan23_part1) 
str(jan23_part2) 
str(feb23_part1) 
str(feb23_part2)
str(mar23_part1)
str(mar23_part2)
str(mar23_part3)
str(apr23_part1)
str(apr23_part2) 
str(apr23_part3) 
str(may23_part1) 
str(may23_part2) 
str(may23_part3) 
str(may23_part4) 
str(jun23_part1) 
str(jun23_part2) 
str(jun23_part3) 
str(jun23_part4) 
str(jul23_part1) 
str(jul23_part2) 
str(jul23_part3) 
str(jul23_part4) 
str(aug23_part1) 
str(aug23_part2) 
str(aug23_part3) 
str(aug23_part4) 
str(sep23_part1) 
str(sep23_part2) 
str(sep23_part3) # type of data for col end_station_id is col_character(), need to change it

sep23_part3 <- transform(sep23_part3, end_station_id = as.numeric(end_station_id)) 
# transformed colume end_station_id from character to numeric
str(sep23_part3)

str(sep23_part4) 
str(oct23_part1) # type of data for col start_station_id and end station_id is col_character(), need to change it

oct23_part1 <- transform(oct23_part1, start_station_id = as.numeric(start_station_id)) 
# transformed colume start_station_id from character to numeric
oct23_part1 <- transform(oct23_part1, end_station_id = as.numeric(end_station_id)) 
# transformed colume end_station_id from character to numeric
str(oct23_part1)

str(oct23_part2) ## type of data for col start_station_id is col_character(), need to change it
oct23_part2 <- transform(oct23_part2, start_station_id = as.numeric(start_station_id)) 
# transformed colume start_station_id from character to numeric
oct23_part2 <- transform(oct23_part2, end_station_id = as.numeric(end_station_id)) 
# transformed colume end_station_id from character to numeric
str(oct23_part2)

str(oct23_part3) 
str(oct23_part4) 
str(nov23_part1) 
str(nov23_part2) 
str(nov23_part3) ## type of data for col start_station_id is col_character(), need to change it

nov23_part3 <- transform(nov23_part3, start_station_id = as.numeric(start_station_id)) 
str(nov23_part3)

str(dec23_part1) 
str(dec23_part2) 
str(dec23_part3) 

# merge individual monthly data frames into one large data frame
tripdata <- bind_rows(jan23_part1, jan23_part2, feb23_part1, feb23_part2,
                      mar23_part1, mar23_part2, mar23_part3, apr23_part1,
                      apr23_part2, apr23_part3, may23_part1, may23_part2, 
                      may23_part3, may23_part4, jun23_part1, jun23_part2, 
                      jun23_part3, jun23_part4, jul23_part1, jul23_part2, 
                      jul23_part3, jul23_part4, aug23_part1, aug23_part2, 
                      aug23_part3, aug23_part4, sep23_part1, sep23_part2, 
                      sep23_part3, sep23_part4, oct23_part1, oct23_part2, 
                      oct23_part3, oct23_part4, nov23_part1, nov23_part2, 
                      nov23_part3, dec23_part1, dec23_part2, dec23_part3)

fwrite(tripdata, "/Users/matthewabrams/NYC Bikes 2023-2024/New Dataset/Drafted_Bike_Data_2023-2024.csv", row.names=FALSE)