# Script R file
# Skyler Yesiltepe, Global Temperature Change

# open packages
library("dplyr")
library("ggplot2")
library("maps")
library("viridis")
library("lintr")
#lint("temp_change.R")

# read the .csv file
globaltemp_df <- read.csv(
  "data/GlobalLandTemperaturesByCountry.csv", stringsAsFactors = FALSE
)

# filter data
earliest_year <- filter(globaltemp_df, dt == "1950-06-01")
latest_year <- filter(globaltemp_df, dt == "2013-06-01")
temp_diff <- latest_year$AverageTemperature - earliest_year$AverageTemperature
region <- earliest_year[["Country"]]
global_temp_diff <- tibble(region, temp_diff) %>%
  mutate(
    region = ifelse(region == "United States", "USA", region)
  )     

# construct plot
world_map <- map_data("world")
global_temp_map <- left_join(world_map, global_temp_diff, by = "region")
final_map <- ggplot(global_temp_map, aes(long, lat, group = group)) +
  geom_polygon(aes(fill = temp_diff), color = "white") +
  scale_fill_viridis_c(option = "C")