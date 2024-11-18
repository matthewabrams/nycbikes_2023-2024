# install and load necessary packages
library(tidyverse)
library(lubridate)
library(readr)
library(data.table)
library(ggplot2)
tripdata_clean <- fread("/Users/matthewabrams/NYC Bikes 2023-2024/New Dataset/Finalized_Bike_Data_2023-2024.csv")
       
# aggregate count of rideable types prepping for graphs
type_rider <- as.data.frame(table(tripdata_clean$rideable_type))
colnames(type_rider) <- c("Bike_Type", "Count")
print(type_rider)

#Making Pie Chart for type_rider
type_rider$percent <- round(type_rider$Count/sum(type_rider$Count)*100, 1)
type_rider$pct_label <- paste0(type_rider$Bike_Type, ": ",type_rider$percent, "%")
pie(x = type_rider$Count, labels = type_rider$pct_label, col=c("red", "blue")) 

# aggregate count of ride_length_type prepping for graphs
ride_length_type <- as.data.frame(table(tripdata_clean$ride_length_type))
colnames(ride_length_type) <- c("Bike_Type", "Count")
print(ride_length_type)

#Making Pie Chart for ride_length_type
ride_length_type$percent <- round(ride_length_type$Count/sum(ride_length_type$Count)*100, 1)
ride_length_type$pct_label <- paste0(ride_length_type$Bike_Type, ": ",ride_length_type$percent, "%")
pie(x = ride_length_type$Count, labels = ride_length_type$pct_label, col=c("darkgreen", "green", "lightgreen")) 

# aggregate count of rideable types prepping for graphs
member_type <- as.data.frame(table(tripdata_clean$member_casual))
colnames(member_type) <- c("Member_Type", "Count")
print(member_type)

# Making Pie Chart for member_type
member_type$percent <- round(member_type$Count/sum(member_type$Count)*100, 1)
member_type$pct_label <- paste0(member_type$Member_Type, ": ",member_type$percent, "%")
pie(x = member_type$Count, labels = member_type$pct_label, col=c("purple", "orange"))

# Conduct descriptive analysis
# descriptive analysis on 'ride_length'
# mean = straight average (total ride length / total rides)
# median = midpoint number of ride length array
# max = longest ride
# min = shortest ride
tripdata_clean%>% 
  summarise(average_ride_length = mean(ride_length_in_min), median_length = median(ride_length_in_min), 
            max_ride_length = max(ride_length_in_min), min_ride_length = min(ride_length_in_min))

# members vs casual riders difference depending on total rides taken
tripdata_clean %>% 
  group_by(member_casual) %>% 
  summarise(ride_count = length(rideable_type), ride_percentage = (length(rideable_type) / nrow(tripdata_clean)) * 100)

# Comparing ride lengths grouped by rider types and days
tripdata_clean %>% 
  group_by(member_casual,day_of_week) %>% 
  summarise(average_ride_length = mean(ride_length_in_min), median_length = median(ride_length_in_min), 
            max_ride_length = max(ride_length_in_min), min_ride_length = min(ride_length_in_min))

# Bar Chart Rides per weekday stacked by type of rider but first order by weekday
tripdata_clean$day_of_week <- factor(tripdata_clean$day_of_week, levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
ggplot(tripdata_clean, aes(x=fct_rev(as_factor(day_of_week)), fill=member_casual)) + coord_flip() +
  geom_bar() + 
  labs(x="Days of the Week", y="Number of Rides (in millions)", title= "Distribution of Citi Bikes Per Weekday") 

# Bar Chart Rides per hour stacked by type of rider
ggplot(tripdata_clean, aes(x = start_time, fill=member_casual)) +
  geom_bar() + facet_wrap(~day_of_week) + 
  labs(x="Hour of Day", y="Number of Rides (in hundred thousands)", title= "Distribution of Citi Bike Rides Per Hour") 

# Box Plot of ride lengths in minutes grouped by day, splitted by rider type
ggplot(tripdata_clean, aes(x=day_of_week, y=ride_length_in_min, fill=member_casual)) + 
  geom_boxplot() + labs(x = "Day", y= "Ride Length (In Minutes)") +
  facet_wrap(~member_casual) + 
  theme(axis.text.x=element_text(size=rel(0.8), angle=90))

# Filter the top 10 values
top_10_counts_start <- tripdata_clean %>%
  count(start_station_name, sort = TRUE) %>%  # Count and sort descending by count
  slice_head(n = 10) 

# Create the bar plot
ggplot(top_10_counts_start, aes(x = reorder(start_station_name, -n), y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Top 10 Locations Where People Bike From", x = "Start Station", y = "Number of Rides (in ten thousands)")+
  theme(axis.text.x=element_text(size=rel(0.8), angle=90))

# Filter the top 10 values
top_10_counts_end <- tripdata_clean %>%
  count(end_station_name, sort = TRUE) %>%  # Count and sort descending by count
  slice_head(n = 10) 

# Bar Chart Rides per Month stacked by type of rider
ggplot(tripdata_clean, aes(x = month, fill=member_casual)) +
  geom_bar() + 
  labs(x="Month", y="Number of Rides (in millions)", title= "Distribution of Citi Bike Rides Per Month (2023-2024)")