# Graph 1 Tab Panel for Shiny.io

graph_1 <- tabPanel("First Graph",
                    mainPanel(h1("Graph 1 Title")))

library(dplyr)
library(plotly)

#load data
co2_data <- read.csv("data/global.1751_2014.csv", stringsAsFactors = FALSE)

# Returns a stacked bar chart for the co2_data, given specified
# years
build_stacked_bar <- function(year1, year2) {
  co2_data_filtered <- co2_data %>%
    filter(!is.na(Carbon.emissions.from.gas.flaring)) %>%
    filter(Year >= year1) %>%
    filter(Year <= year2) %>%
    select(
      -Per.capita.carbon.emissions..metric.tons.of.carbon..after.1949.only.)

  stacked_co2_chart <- plot_ly(
    data = co2_data_filtered,
    x = ~Year,
    y = ~Carbon.emissions.from.gas.fuel.consumption,
    type = "bar",
    name = "Gas Fuel Consumption"
  )

  stacked_co2_chart <- stacked_co2_chart %>%
    add_trace(y = ~Carbon.emissions.from.liquid.fuel.consumption,
              name = "Liquid Fuel Consumption")

  stacked_co2_chart <- stacked_co2_chart %>%
    add_trace(y = ~Carbon.emissions.from.solid.fuel.consumption,
              name = "Solid Fuel Consumption")

  stacked_co2_chart <- stacked_co2_chart %>%
    add_trace(y = ~Carbon.emissions.from.cement.production,
              name = "Cement Production")

  stacked_co2_chart <- stacked_co2_chart %>%
    add_trace(y = ~Carbon.emissions.from.gas.flaring,
              name = "Gas Flaring")

  stacked_co2_chart <- stacked_co2_chart %>%
    layout(title = "Global CO2 Emissions from Fossil Fuels through the Years",
           yaxis = list(title = "Carbon Emissions (million metric tons of C)"),
           barmode = "stack")

  return(stacked_co2_chart)
}