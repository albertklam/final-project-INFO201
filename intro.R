# Natalie Roy
# Intro Tab Panels for Shiny.io

# Load necessary libraries
library(shiny)

# A variable for the introduction of the webpage
intro_page <- tabPanel(
  "Introduction",
  mainPanel(
    h1("Introduction"),
    p("The domain our group is interested in is the environment. There's lots
    of diverse data on different environmental occurrences like temperature,
    emissions, and air pollution. With concerns of global warming and growing
    emissions, analyzing environmental data is more important now than ever.
    Understanding environmental data can allow us to fully understand the scope
    of climate change, as well as help us plan what changes the government needs
    to make to best protect ourselves as well as the environment as a whole."),
    img(
      description = "Environment",
      src = "intro_image.jpg"
    ),
    h2("Our group aims to answer three specific questions pertaining to the
       environment:"),
    h4("What is the correlation between CO2 emission and temperature data?
        How has this correlation changed over time?"),
    p("CO2 emissions are a driving force of climate change, and understanding
    its correlation to other factors like temperature could give us lots of
    information about how the environment has changed over the years."),
    h4("How do the different kinds of fuels stack up in terms of emission
       amount?"),
    p("Lots of different sources and fuels are contributing to emissions, and
    understanding what sources contribute the most could tell us what we need to
    change to better protect the environment."),
    h4("How have emissions polluted the air and impacted societies?"),
    p("Given the impact emissions have had on the environment, emissions have
    definitely impacted people as well. How have people reacted to growing
    emissions, and how has this changed the population?"),
    br(),
    h2("We used three different datasets to answer these questions:"),
    p(tags$a(href = "https://datahub.io/core/co2-fossil-global", "CO2
    Emissions from Fossil Fuels"),
    "- This dataset from the Carbon Dioxide Information Analysis
    Center (CDIAC) gives information about the global CO2 emissions
    from various fossil fuel sources, dating from 1751 all the way to 2010."),
    p(tags$a(href =
    "https://www.kaggle.com/berkeleyearth/climate-change-earth-surface-
    temperature-data",
    "Earth Surface Temperature"), "- This dataset from Berkeley Earth combines
    1.6 billion temperature reports from 16 pre-existing archives and analyzes
    data from 1743 to 2013."),
    p(tags$a(
      href = "https://ourworldindata.org/air-pollution#all-charts-preview",
      "Air Pollution Death Rates by Country"),
      "- This dataset created by the
      Institute for Health Metrics and Evaluation contains information on the
      air pollution death rates for every country/region from the years 1990
      to 2017. The pollution dataset was joined by a ",
      tags$a(
      href = "https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?end=2018
      &start=2013", "GDP dataset"), "from the World Bank and a",
      tags$a(
      href = "https://datahub.io/JohnSnowLabs/country-and-continent-codes-
        list#resource-country-and-continent-codes-list-csv",
      "countries and continents code dataset"), " from DataHub.io"),

      h2("About"),
      p("This webpage was created by", tags$b("Albert Lam, Skyler Yesiltepe,
    Shreya Raj, and Natalie Roy"), "for the University of Washington's INFO 201
        Spring 2020 course."
    )
  )
)
