# install and load necessary packages

library(tidyverse)
library(lubridate)
library(readr)
library(data.table)

tripdata_clean2 <- fread("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/New Dataset/Drafted_Bike_Data2_2024-2025.csv")

tripdata_clean2 <- tripdata_clean2 %>% 
  mutate(date = format(as.Date(started_at), "%Y-%m")) %>% # extract date
  mutate(day_of_week = format(as.Date(started_at), "%A")) %>% # extract day of week
  mutate(start_time = strftime(started_at, "%H")) %>% # extract hour of day
  mutate(ride_length_in_min = round(difftime(ended_at, started_at, units='mins'), digits = 2)) # Finding length of bike ride in minutes (nearest two decimal points)

tripdata_clean2

tripdata_clean2$ride_length_in_min <- as.numeric(tripdata_clean2$ride_length_in_min) # converting column to numeric type

summary(tripdata_clean2) 

# Minimum value has a negative value and Maximum value is over 1,500 minutes

# Observing times under the started_at column are later than the times under the ended_at column, causing the negative values in time.

# Breaking dataset into two datasets: one where ride_length_in_min is less than 0 and one where ride_length_in_min is 0 or more

tripdata_negative = tripdata_clean2[ride_length_in_min < 0]
tripdata_negative

tripdata_positive = tripdata_clean2[ride_length_in_min >= 0]
tripdata_positive

# For the dataset where ride_length_in_min is less than 0, switching the order of started_at and ended_at columns for the table

tripdata_negative <- subset(tripdata_negative, select = c(bike_type, ended_at, started_at, start_station_name, end_station_name, rider_type, date, day_of_week, 
                                                          start_time, ride_length_in_min))

# After, renaming started_at as ended_at, renaming ended_at as started_at (not changing the times under both columns)

tripdata_negative <- tripdata_negative %>% 
  rename("ended_at" = "started_at",
         "started_at" = "ended_at")

tripdata_negative

# Dropping the old ride_length_in_min column of tripdata_negative dataframe, recreating the same column 
tripdata_negative = subset(tripdata_negative, select = -c(ride_length_in_min))
tripdata_negative <- tripdata_negative %>% 
  mutate(ride_length_in_min = round(difftime(ended_at, started_at, units='mins'), digits = 2)) # Finding length of bike ride in minutes (nearest two decimal points)

tripdata_negative$ride_length_in_min <- as.numeric(tripdata_negative$ride_length_in_min) # converting column to numeric type

tripdata_negative

# Combining the tripdata_negative and trip_data_positive dataframes

tripdata_clean3 <- bind_rows(tripdata_negative, tripdata_positive)

tripdata_clean3 = subset(tripdata_clean3, select = -c(started_at, ended_at)) # Dropping unwanted columns

tripdata_clean3

summary(tripdata_clean3)

# No longer negative values under ride_length_in_min column, however minumum value shows 0 minutes

tripdata_zero = tripdata_clean3[ride_length_in_min < 1]
tripdata_zero

# 93,633 entries show where rides last less than 1 minute, also where value under start_station_name column is the same as value under end_station_name
# There is a monetary penalty for rides longer than 45 minutes for members and 30 minutes for casual customers
# It is less likely that any citi bike ride would take several hours
# The System host site indicates that for distance calculation, trips are capped at a 2 hour (120 minutes) limit
# It is highly probable that the bike was not engaged properly at the returning station
# Remove "bad" data where ride_length was less than one minute and beyond 2 hours

tripdata_clean4 <- tripdata_clean3[tripdata_clean3$ride_length_in_min >= 1 & tripdata_clean3$ride_length_in_min <= 120]

# Aside removing entries where rides last less than 1 minute, we also removed 86,195 entries where rides last over 2 hours.

tripdata_clean4$ride_length_type <- ifelse(tripdata_clean4$ride_length_in_min > 40, "Long",
                                          ifelse(tripdata_clean4$ride_length_in_min > 20, "Medium", "Short")) 

# Deriving column from ride_length_in_min column 
# If the ride is more than 40 minutes: Long Ride
# If the ride is between 20 and 40 minutes: Medium Ride
# If the ride is less than 20 minutes: Short Ride

tripdata_clean4

fwrite(tripdata_clean4, "/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/New Dataset/Finalized_Bike_Data_2024-2025.csv", row.names=FALSE)