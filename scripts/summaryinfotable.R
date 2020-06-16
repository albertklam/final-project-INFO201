# Summary Information Table
# Natalie Roy
# Date: 5/20/20

# load the necessary packages
library(dplyr)
library(knitr)

# function that creates a table of information based on the dataset
info_table <- function(dataset) {
  # group and arrange the data to show the sum of deaths per year
  needed_data <- dataset %>%
    select(Year, Air.pollution..total...deaths.per.100.000.) %>%
    group_by(Year) %>%
    summarize(sum_total = sum(Air.pollution..total...deaths.per.100.000.,
                              na.rm = TRUE)) %>%
    arrange(-sum_total)

  # returns the data in a formatted table
  return(kable(needed_data,
         row.names = FALSE,
         col.names = c("Year", "Total Air Pollution Deaths (per 100,000)")))
}
