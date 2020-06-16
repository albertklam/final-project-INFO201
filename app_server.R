# Shiny server

# Load the necessary libraries
library(shiny)

# Source the map scripts
source("scripts/graph1.R")


# Creates the server
server <- function(input, output) {

  # Each map script will have a variable in here making the graphs interactive
  output$line_chart <- renderPlotly({
    return(build_line(df, input$cont))
  })
  output$stacked_bar <- renderPlotly({
    return(build_stacked_bar(input$year[1], input$year[2]))
  })
  output$world_map <- renderPlotly({
    return(build_map(input$temp_year))
  })
}
