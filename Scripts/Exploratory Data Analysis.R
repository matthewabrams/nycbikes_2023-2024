# install and load necessary packages

library(tidyverse)
library(lubridate)
library(readr)
library(data.table)
library(ggplot2)
library(webr)
library(scales)
library(dplyr)
library(clipr)

tripdata_clean <- fread("/Users/matthewabrams/Desktop/NYC Bikes 2024-2025/New Dataset/Finalized_Bike_Data_2024-2025.csv")

# Creating tables summarizing categorical and quantitative data from an overall standpoint

# 1. Creating a frequency table for type of rider

rider_type_analysis <- data.frame(tripdata_clean %>% group_by(rider_type) %>% summarise(count = n())) 
write_clip(rider_type_analysis) # Copies table and paste into spreadsheet

# 2. Creating a frequency table for type of bike

bike_type_analysis <- data.frame(tripdata_clean %>% group_by(bike_type) %>% summarise(count = n()))
write_clip(bike_type_analysis)

# 3. Creating a frequency table for ride length type

ride_length_type_analysis <- data.frame(tripdata_clean %>% group_by(ride_length_type) %>% summarise(count = n()))
write_clip(ride_length_type_analysis)

# 4. Creating a frequency table for hours

time_of_ride_analysis <- data.frame(tripdata_clean %>% group_by(start_time) %>% summarise(count = n())) 
write_clip(time_of_ride_analysis)

# 5. Creating a frequency table for days (order by day of week)

tripdata_clean$day_of_week <- factor(tripdata_clean$day_of_week, levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

day_analysis <- data.frame(tripdata_clean %>% group_by(day_of_week) %>% summarise(count = n()))  
write_clip(day_analysis)

# 6. Creating a frequency table for months

month_analysis <- data.frame(tripdata_clean %>% group_by(date) %>% summarise(count = n()))  
write_clip(month_analysis)

# 7. Creating a frequency table for start stations

start_station_analysis <- data.frame(tripdata_clean %>% group_by(start_station_name) %>% summarise(count = n())) 
write_clip(start_station_analysis)

# 8. Creating a frequency table for end stations

end_station_analysis <- data.frame(tripdata_clean %>% group_by(end_station_name) %>% summarise(count = n())) 
write_clip(end_station_analysis)

# Creating graphs diving into deeper analysis

# Histogram with density of bike ride lengths (in minutes)

ggplot(tripdata_clean, aes(x=ride_length_in_min)) + 
  geom_histogram(color = "black", fill = "yellow",  binwidth = 5, boundary = 0, closed = "left") +
  labs(x = "Ride Time (in Minutes)", y = "Number of Rides") + scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6)) +
  ggtitle("Frequency of Ride Time With Citi Bikes") + 
  theme(axis.text.x=element_text(size=rel(0.8)), 
  panel.background = element_rect(fill = "lightblue", color = "black"),  # Panel background
  plot.background = element_rect(fill = "lightgray", color = "darkgray"))  # Plot background)  
       
# Aggregate count of rider and bike types prepping for pie donut

# members vs casual riders difference depending on total rides taken

tripdata_clean %>% 
  group_by(rider_type) %>% 
  summarise(ride_count = length(rider_type), ride_percentage = (length(rider_type) / nrow(tripdata_clean)) * 100)

PD = tripdata_clean %>% group_by(rider_type, bike_type) %>% summarise(count = n())
print(PD)

# Pie-Donut chart

PieDonut(PD, aes(rider_type, bike_type, count = count), title = "Proportion of Rides Grouped by Rider and Bike Type", ratioByGroup = FALSE, 
         r0 = 0, r1 = 0.5, r2 = 1, pieLabelSize	= 3, donutLabelSize = 3, use.labels = FALSE, titlesize = 4, showPieName = FALSE)

PD2 = tripdata_clean %>% group_by(bike_type, ride_length_type) %>% summarise(count = n())
print(PD2)

# Pie-Donut chart

PieDonut(PD2, aes(bike_type, ride_length_type, count = count), title = "Proportion of Rides Grouped by Rider and Ride Length Time", ratioByGroup = FALSE, 
         r0 = 0, r1 = 0.5, r2 = 1, pieLabelSize	= 3, donutLabelSize = 3, use.labels = FALSE, titlesize = 4, showPieName = FALSE)

# Bar Chart Rides per weekday stacked by type of rider

ggplot(tripdata_clean, aes(x=day_of_week, fill=rider_type)) + scale_fill_manual(values = c("purple","orange")) +
  geom_bar() + geom_text(aes(label = after_stat(count)), stat = "count", position = position_stack(vjust=0.5), colour = "black", size = 3.5) +
  labs(x="Days of the Week", y="Number of Rides", title= "Number of Citi Bike Rides That Occurred Per Weekday") +
  theme(panel.background = element_rect(fill = "lightblue", color = "black"),  # Panel background
        plot.background = element_rect(fill = "lightgray", color = "darkgray"),  # Plot background
        legend.background = element_rect(fill = "white", color = "black"),  # Legend background
        legend.key = element_rect(fill = "white")  # Legend key background
  ) + scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6))

# Bar Chart Rides per hour stacked by type of rider

ggplot(tripdata_clean, aes(x = start_time, fill=rider_type)) +
  geom_bar() + facet_wrap(~day_of_week) + scale_fill_manual(values = c("purple","orange")) +
  scale_y_continuous(labels = scales::comma) + 
  labs(x="Hour of Day", y="Number of Rides", title= "Number of Citi Bike Rides That Occurred Per Hour") + 
  theme(panel.background = element_rect(fill = "lightblue", color = "black"),  # Panel background
      plot.background = element_rect(fill = "lightgray", color = "darkgray"),  # Plot background
      legend.background = element_rect(fill = "white", color = "black"),  # Legend background
      legend.key = element_rect(fill = "white")  # Legend key background
)

# Conduct descriptive analysis
# Descriptive analysis on 'ride_length'
# mean = straight average (total ride length / total rides)
# median = midpoint number of ride length array
# max = longest ride
# min = shortest ride
# Comparing ride lengths grouped by rider types and days

tripdata_clean %>% 
  group_by(day_of_week, rider_type) %>% 
  summarise(average_ride_length = round(mean(ride_length_in_min),1), median_length = round(median(ride_length_in_min),1), 
            max_ride_length = max(ride_length_in_min), min_ride_length = min(ride_length_in_min), total_count = n())

# Box Plot of ride lengths in minutes grouped by day, split by rider type

ggplot(tripdata_clean, aes(x=day_of_week, y=ride_length_in_min, fill=rider_type)) + 
  geom_boxplot() + labs(x = "Day", y= "Ride Length (In Minutes)", title= "Bike Ride Length (In Minutes) During The Week") +
  facet_wrap(~rider_type) + scale_fill_manual(values = c(casual = 'purple', member = 'orange')) +
  theme(axis.text.x=element_text(size=rel(0.8), angle=90))

# Want to find the top 15 Citi bike routes where people bike to and from on weekends.

# Step 1: Create a subset dataframe focusing on start and end station columns, and days (filtering for weekends)

tripdata_weekend = tripdata_clean[tripdata_clean$day_of_week == 'Saturday' | tripdata_clean$day_of_week == 'Sunday']
location_weekend = tripdata_weekend  %>% group_by(start_station_name, end_station_name) %>% summarise(count = n())
location_weekend

# Step 2 Filter the top 15 values

top_15_counts_weekend <- location_weekend[order(location_weekend$count, decreasing = TRUE)[1:15], ]
top_15_counts_weekend$trips <- paste(top_15_counts_weekend$start_station_name, "to", top_15_counts_weekend$end_station_name, sep = " ") # Creating a column concating start and end station columns
top_15_counts_weekend

# Step 3 Create the bar plot

ggplot(top_15_counts_weekend, aes(x = reorder(trips, +count), y = count)) +
  geom_bar(stat = "identity", fill = "darkblue") + coord_flip() + scale_y_continuous(labels = scales::comma) +
  geom_text(aes(label = count), hjust = 1.5, color = "white") +
  labs(title = "Top 15 Pairwise Bike Stations on Weekends", x = "Location", y = "Number of Rides") +
  theme(axis.text.x=element_text(size=rel(0.8)), 
        panel.background = element_rect(fill = "white", color = "black"),  # Panel background
        plot.background = element_rect(fill = "lightgray", color = "darkgray"),  # Plot background
        )  # Legend key background)

# Want to find the top 15 Citi bike routes where people bike to and from on weekdays.

# Step 1: Create a subset dataframe focusing on start and end station columns, and days (filtering for weekdays)

tripdata_weekday <- filter(tripdata_clean, day_of_week %in%  c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"))
location_weekday = tripdata_weekday %>% group_by(start_station_name, end_station_name) %>% summarise(count = n())
location_weekday

# Step 2 Filter the top 15 values

top_15_counts_weekday<- location_weekday[order(location_weekday$count, decreasing = TRUE)[1:15], ]
top_15_counts_weekday$trips <- paste(top_15_counts_weekday$start_station_name, "to", top_15_counts_weekday$end_station_name, sep = " ") # Creating a column concating start and end station columns
top_15_counts_weekday

# Step 3 Create the bar plot

ggplot(top_15_counts_weekday, aes(x = reorder(trips,+count), y = count)) + 
  geom_bar(stat = "identity", fill = "darkblue") + coord_flip() + scale_y_continuous(labels = scales::comma) +
  geom_text(aes(label = count), hjust = 1.5, color = "white") +
  labs(title = "Top 15 Pairwise Bike Stations on Weekdays", x = "Location", y = "Number of Rides") +
  theme(axis.text.x=element_text(size=rel(0.8)), 
        panel.background = element_rect(fill = "white", color = "black"),  # Panel background
        plot.background = element_rect(fill = "lightgray", color = "darkgray")  # Plot background
  )  # Legend key background)

# Creating a line plot for distribution of citi bike rides across time grouped by type of bike

# Step 1: Aggregate data by count

aggregated_data <- tripdata_clean %>%
  group_by(date, rider_type, bike_type) %>%
  summarise(count = n())

print(aggregated_data, n = 44)

# Step 2: Use the aggregate data to create a line chart

ggplot(aggregated_data, aes(x = date, y = count, group = rider_type, color = rider_type)) + facet_wrap(~bike_type) +
  geom_line(linewidth = 1.5) + scale_color_manual(values = c("purple","orange")) + geom_point(size = 3, color = "red") +
  labs(x="Time", y="Number of Rides", title= "Number of Citi Bike Rides Throughout 2024") +
  theme_minimal() + theme(panel.background = element_rect(fill = "deepskyblue", color = "black"), axis.text = element_text(size = 6),  # Panel background
    plot.background = element_rect(fill = "lightgray", color = "darkgray"),  # Plot background
    legend.background = element_rect(fill = "white", color = "black"),  # Legend background
    legend.key = element_rect(fill = "white")  # Legend key background
  ) + scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6))

# Creating two stacked percentage chart of bike type usage across time: one for casual riders and one for member riders

# Step 1: Aggregate data by counting occurrences

aggregated_data2 <- tripdata_clean %>%
  count(date, bike_type, rider_type)

aggregated_data2

# Step 2: Calculate percentages for each group within each category

aggregated_data2 <- aggregated_data2 %>%
  group_by(date,rider_type) %>%
  mutate(Percentage = round(n/sum(n) * 100,1))

print(aggregated_data2, n = 44)

# Step 3: Create a stacked percentage bar chart

ggplot(aggregated_data2, aes(x = date, y = Percentage, fill = bike_type)) +
  geom_bar(stat = "identity") + geom_text(aes(label = paste0(Percentage, "%")), position = position_stack(vjust = 0.5), color = "white", size = 2.5) +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) + facet_wrap(~rider_type) +
  labs(title = "Proportion of Total Bike Rides Across Time", x = "Time", y = "Percentage") +
  theme_minimal() + scale_fill_manual(values = c("red","blue")) +
  theme(axis.text = element_text(size = 6), panel.background = element_rect(fill = "lightblue", color = "black"),  # Panel background
                          plot.background = element_rect(fill = "lightgray", color = "darkgray"),  # Plot background
                          legend.background = element_rect(fill = "white", color = "black"),  # Legend background
                          legend.key = element_rect(fill = "white")  # Legend key background
  )