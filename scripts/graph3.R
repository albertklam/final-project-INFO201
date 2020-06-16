# Graph 3 Tab Panel for Shiny.io

graph_3 <- tabPanel("Third Graph",
                    mainPanel(h1("Graph 3 Title")))

# Set up
library(dplyr)
library(ggplot2)
library(lintr)
#lint("graph3.R")

# Loading pollution dataset as well as GDP and Continent code datasets
# to join into pollution dataset for Shiny interaction and arranging by GDP
rate_df <- read.csv("data/deathrates.csv", stringsAsFactors = FALSE)
gdp_df <- read.csv("data/gdp.csv", stringsAsFactors = FALSE)
continent <- read.csv("data/continents.csv", stringsAsFactors = FALSE)
join_1 <- full_join(rate_df, gdp_df, by = c("Code" = "Country.Code"))
joined_df <- full_join(join_1, continent, by = c("Code" = "Country_Code"))

# cleaning df
df <- joined_df %>%
  rename(
    total = Air.pollution..total...deaths.per.100.000.,
    cont = Continent_Name
  ) %>%
  select(Entity, Year, total, X2018, cont) %>%
  group_by(cont) %>%
  top_n(150, X2018)

## function to build the plot
build_line <- function(df, variable) {

  chart <- df %>%
    filter(cont == variable) %>%
    ggplot(aes(x = Year, y = total, group = Entity)) +
    geom_line(aes(color = Entity)) +
    ggtitle("Number of deaths from air pollution (per 100,000), 1990 to 2017") +
    xlab("Year") +
    ylab("Deaths")

  new <- ggplotly(chart, tooltip = c("x", "y", "group"))

  return(new)
}
