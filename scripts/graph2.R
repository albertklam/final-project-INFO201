# Graph 2 Tab Panel for Shiny.io

graph_2 <- tabPanel("Second Graph",
                    mainPanel(h1("Graph 2 Title")))

library(dplyr)
library(ggplot2)
library(maps)
library(viridis)
library(lintr)
library(stringr)

# read the .csv file
globaltemp_df <- read.csv(
  "data/GlobalLandTemperaturesByCountry.csv", stringsAsFactors = FALSE
)

# construct map
build_map <- function(temp_year) {
  earliest_year <- filter(globaltemp_df, dt == "1950-06-01")
  latest_year <- filter(
    globaltemp_df, dt == paste(temp_year, "-06-01", sep = "")
  )
  temp_diff <- latest_year$AverageTemperature -
    earliest_year$AverageTemperature
  region <- earliest_year[["Country"]]
  global_temp_diff <- tibble(region, temp_diff) %>%
    mutate(
      region = str_replace(region, "United States", "USA")
    )

  world_map <- map_data("world")
  global_temp_map <- left_join(world_map, global_temp_diff, by = "region")
  final_map <- ggplot(global_temp_map, aes(long, lat, group = group)) +
    geom_polygon(aes(fill = temp_diff), color = "white") +
    scale_fill_viridis_c(option = "C")

  return(final_map)
}