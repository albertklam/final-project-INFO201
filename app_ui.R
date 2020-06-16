# Shiny UI

# Load necessary libraries
library(shiny)

# Source individual webpage files
source("intro.R")
source("scripts/graph1.R")
source("scripts/graph2.R")
source("scripts/graph3.R")

# Line Chart setup

graph_3_sidebar <- sidebarPanel(
  selectInput(
    inputId = "cont",
    label = "Display large countries by continent",
    choices = list("North America" = "North America",
                   "South America" = "South America",
                   "Asia" = "Asia",
                   "Europe" = "Europe",
                   "Africa" = "Africa",
                   "Oceania" = "Oceania")
  )
)

graph_3_main_panel <- mainPanel(
  plotlyOutput("line_chart"),
  br(),
  h4("Description"),
  p("The study of Informatics is as much about technology and data as it is
    about people. As such, our last visualization here aims to bring
    environmental data into the context of society; what is the impact?
    The purpose of this chart is to quantify and visualize the impact air
    pollution has on societies by displaying the change in death rate
    caused by air pollution over time. The y-axis, number of deaths per
    100,000 people, represents an age-standardized quantity that allows for
    comparing populations at different points in time. Sorting by continent
    provides a comparison of how much damage air pollution is causing in
    different regions and how that change over time compares. The countries
    displayed for each continent are the top 6 by GDP.")
)

graph_3 <- tabPanel(
  "Air Pollution Death Rates",
  titlePanel("Air Pollution Death Rates over Time"),
  sidebarLayout(
    graph_3_sidebar,
    graph_3_main_panel
  )
)




# Stacked Bar Chart Set Up
graph_1 <- tabPanel(
  "CO2 Emissions",
  titlePanel("Global CO2 Emissions over Time"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("year",
                  "Select the Year Range",
                  min = 1751,
                  max = 2014,
                  value = c(1925, 2014),
                  sep = "")
    ),
    mainPanel(
      plotlyOutput("stacked_bar"),
      br(),
      h4("Description"),
      p("This stacked bar chart attempts to understand how various
         types of fuels contribute to the total carbon emissions each
         year. Looking at the chart as a whole, we will also be able to
         answer if CO2 emissions truly increase as the years go by.
         With a stacked bar chart, it is easy to identify and compare
         the amount of carbon emissions from each source per year and see
         how the total amount of carbon emissions for each year compares
         to other years.")
    )
  )
)

# Map Set Up
graph_2_sidebar <- sidebarPanel(
  sliderInput("temp_year", "Select A Year", min = 1951,
              max = 2013, value = 2013, sep = "")
)

graph_2_main_panel <- mainPanel(
  plotlyOutput("world_map"),
  br(),
  h4("Description"),
  p("This map showcases data regarding the temperature difference (in Celcius),
    as recorded by Berkeley Earth, using the dates 06/01/1950 and 06/01 in the
    selected year. By subtracting a country's average temperature on 06/01/1950
    from the average temperature from a year selected by the slider, we can see
    if there is a general trend of increasing or decreasing global
    temperatures, and whether certain parts of the globe are more heavily
    impacted. Any country that is grey was missing temperature data.")
)

graph_2 <- tabPanel(
  "Global Temperature Differences",
  titlePanel(
    "Average Temperature Difference per Country from 1950 (in celcius)"
  ),
  sidebarLayout(
    graph_2_sidebar,
    graph_2_main_panel
  )
)

# Conclusion Tab

conclusion_page <- tabPanel(
  "Conclusion",
  mainPanel(
    h4("Graph 1 Insights"),
    p("We expected global CO2 emissions from fossil fuels to increase each
      year and by looking at the stacked bar chart, it is evident through
      the overall pattern that as the years increase, the total amount of
      carbon emissions increase. From the chart we also discovered how new
      forms of emission such as carbon emissions from cement production did
      not start until 1928 and carbon emissions from gas flaring did not start
      until 1950. When looking at each year individually, it seems as though
      carbon emissions from solid fuel consumption and liquid fuel consumption
      are the two highest forms of emissions while carbon emissions from cement
      production and gas flaring remain the two lowest forms of emission each
      year. This can be seen for example in the year 2014 where the largest
      carbon emissions from solid fuel consumption and liquid fuel consumption
      were 4117 million metric tons and 3280 million metric tons, respectively,
      and the carbon emissions from cement production and gas flaring remained
      significantly low comparatively at 568 million metric tons and 68 million
      metric tons, respectively."),
    p("Through this insight it is clear that carbon emissions from fossil fuels
    have been greatly increasing over time. With solid fuel consumption and
    liquid fuel consumption being the largest sources of carbon emission
    from fossil fuels, we need to spend the time and energy finding ways
    to reduce these carbon footprints in an effort to save this earth and
    us humans. The implications from these carbon emissions have the potential
    to be extremely devastating as they can cause shirking water supplies,
    increasing incidents of severe weather, geographical changes, etc."),
    br(),
    h4("Graph 2 Insights"),
    p("It is clear that there is a general trend towards increased average
      temperatures across the globe as the data moves towards present day.
      Most of the Western Hemisphere has experienced an increase in
      temperature, while certain regions such as Western Europe or parts of
      Africa look to have experienced a decrease in temperature
      (specifically for the month of June). These insights were expected,
      as it is common agreement that the average temperature on Earth has
      been increasing, but this map shows data regarding how drastic that
      temperature increase is, and how quickly it is occurring."),
    p("Overall, it appears that heavily industrialized nations have been
      experiencing a heavy increase in average temperature, while the
      increase has been less significant in regions such as the majority of
      Western and Southern Africa, or South America. A broad implication
      of this insight is that this trend seems to be continuing and growing,
      as there looks to be an average increase of about 1.5 degrees celcius in
      less than a century. This is extremely concerning, as many regions could
      grow to be uninhabitable if this trend continues. An example is the
      heatwaves that have affected European nations that past couple of years.
      Many individuals lose their lives during these heatwaves, and they are
      significantly more common than in the past, so changes must be made.
      One concern regarding this data is that it does not protect against
      yearly outliers, so countries may show increases/decreases in temperature
      if that year happened to be a bit strange in terms of its temperature.
      As such, any insights must be taken from multiple years of data, making
      sure to keep track of general trends rather than significant values."),
    br(),
    h4("Graph 3 Insights"),
    p("The main focus for this graph was to observe the impact of air
      pollution on society, both at different locations and times.
      Fortunately, all lines generally follow a negative slope,
      meaning that the death rates across all countries are
      declining over time. However, a few countries began - and
      ended - at rates considerably higher than the rest: Papua New
      Guinea and the Solomon Islands in Oceania. All the countries
      in South America and Europe started and ended relatively close
      together, apart from Russia. Of all the countries plotted,
      only the pattern from Russia is non-linear, spiking upwards once
      in 1994 before coming back down, only to increase once more from
      1998 to 2003. Asia had some interesting trends as well.
      Although India and China both started at relatively close
      and high numbers, China widened the gap between the two
      countries, from a difference of -37 (184 - 221) in 1990
      to -60 (72 - 132) in 2017. As such, China's death rate caused by
      air pollution is closer with the other top 6 countries in Asia,
      both compared to where China was before and where India is now."),
    p("This would suggest a better and more aggresive implementation
      and focus on environmental policy in China as opposed to India.
      But with a matter such as climate change and deaths caused by
      air pollution, it is more important what the absolute figures
      are, rather than relative. That is, while countries like India and
      Papua New Guinea have more work to do than many other countries,
      none can afford to be lax in their approach to effectively minimize
      the harmful ramifications wrought by an incessant consumption
      of unsustainable resources."),
    br()
  )
)

# Combine everything into the ui
ui <- navbarPage(
  theme = "style.css",
  "Environmental Data Project",
  intro_page,
  graph_1,
  graph_2,
  graph_3,
  conclusion_page
)
