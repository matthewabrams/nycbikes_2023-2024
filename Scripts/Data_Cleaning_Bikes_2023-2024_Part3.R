# install and load necessary packages
library(tidyverse)
library(lubridate)
library(readr)
library(data.table)

tripdata_clean <- fread("/Users/matthewabrams/NYC Bikes 2023-2024/New Dataset/Drafted_Bike_Data2_2023-2024.csv")

tripdata_clean <- tripdata_clean %>% 
  mutate(date = format(as.Date(started_at), "%m-%d-%Y")) %>% # extract date
  mutate(month = format(as.Date(started_at), "%m")) %>% # extract date
  mutate(day_of_week = format(as.Date(started_at), "%A")) %>% # extract day of week
  mutate(start_time = strftime(started_at, "%H")) %>% # extract hour of day
  mutate(ride_length_in_min = round(difftime(ended_at, started_at, units='mins'), digits = 2)) # Finding length of bike ride in minutes (nearest two decimal points)


tripdata_clean$ride_length_in_min <- as.numeric(tripdata_clean$ride_length_in_min) # converting column to numeric type

tripdata_clean

summary(tripdata_clean) 

# Minimum value has a negative value and Maximum value is over 150,000 minutes
# There is a monetary penalty for rides longer than 45 minutes for members and 30 minutes for casual customers
# It is less likely that any citi bike ride would take several hours
# The System host site indicates that for distance calculation, trips are capped at a 2 hour (120 minutes) limit
# It is highly probable that the bike was not engaged properly at the returning station
# Remove "bad" data where ride_length was negative or 'zero' and beyond 2 hours
tripdata_clean <- tripdata_clean[ride_length_in_min >= 0 & tripdata_clean$ride_length_in_min <= 120]

tripdata_clean$ride_length_type <- ifelse(tripdata_clean$ride_length_in_min > 30, "Long",
                                          ifelse(tripdata_clean$ride_length_in_min >= 15, "Medium", "Short")) 


# Deriving column from ride_length_in_min column 
# If the ride is more than 30 minutes: Long Ride
# If the ride is between 15 and 30 minutes: Medium Ride
# If the ride is less than 15 minutes: Short Ride

tripdata_clean = subset(tripdata_clean, select = -c(start_station_id,end_station_id, start_lat, start_lng, 
                                                    end_lat, end_lng)) # Dropping unwanted columns

tripdata_clean

fwrite(tripdata_clean, "/Users/matthewabrams/NYC Bikes 2023-2024/New Dataset/Finalized_Bike_Data_2023-2024.csv", row.names=FALSE)