# scripts R file
# Albert Lam, air pollution deaths chart

# Set up
library(dplyr)
library(ggplot2)
library(lintr)
# lint("albertchart.R")

# Data set on # of deaths per 100,000 people caused by air pollution
rate_df <- read.csv("data/deathrates.csv", stringsAsFactors = FALSE)

# Renaming columns for easier access
# Selecting for certain countries
new_df <- rate_df %>%
  rename(
    total = Air.pollution..total...deaths.per.100.000.,
    indoor = Indoor.air.pollution..deaths.per.100.000.,
    out_part = Outdoor.particulate.matter..deaths.per.100.000.,
    out_ozone = Outdoor.ozone.pollution..deaths.per.100.000.
  ) %>%
  filter(Year <= 2015) %>%
  filter(Entity == "United States" | Entity == "China" | Entity == "Japan" |
           Entity == "Russia" | Entity == "India" | Entity == "Brazil")

albert_plot <- ggplot(df, aes(x = Year, y = total, group = Entity)) +
  geom_line(aes(color = Entity)) +
  ggtitle("Number of deaths from air pollution (per 100,000), 1990 to 2015") +
  xlab("Year") +
  ylab("Deaths") +
  geom_text(data = df %>% filter(Year == "2015"),
            aes(label = Entity, Year, color = Entity), nudge_x = 1) +
  coord_cartesian(clip = "off") +
  theme(legend.position = "none", plot.margin = margin(0.5, 1, 0.3, 0.3, "cm"))

####

na_5 <- rate_df %>%
  rename(
    total = Air.pollution..total...deaths.per.100.000.,
    indoor = Indoor.air.pollution..deaths.per.100.000.,
    out_part = Outdoor.particulate.matter..deaths.per.100.000.,
    out_ozone = Outdoor.ozone.pollution..deaths.per.100.000.
  ) %>%
  filter(Year <= 2015) %>%
  filter(Entity == "United States" | Entity == "Mexico" | Entity == "Canada" |
           Entity == "Dominican Republic" | Entity == "Guatemala")

sa_5 <- rate_df %>%
  rename(
    total = Air.pollution..total...deaths.per.100.000.,
    indoor = Indoor.air.pollution..deaths.per.100.000.,
    out_part = Outdoor.particulate.matter..deaths.per.100.000.,
    out_ozone = Outdoor.ozone.pollution..deaths.per.100.000.
  ) %>%
  filter(Year <= 2015) %>%
  filter(Entity == "Brazil" | Entity == "Argentina" | Entity == "Colombia" |
           Entity == "Chile" | Entity == "Peru")

asia_5 <- rate_df %>%
  rename(
    total = Air.pollution..total...deaths.per.100.000.,
    indoor = Indoor.air.pollution..deaths.per.100.000.,
    out_part = Outdoor.particulate.matter..deaths.per.100.000.,
    out_ozone = Outdoor.ozone.pollution..deaths.per.100.000.
  ) %>%
  filter(Year <= 2015) %>%
  filter(Entity == "China" | Entity == "India" | Entity == "Japan" |
           Entity == "Indonesia" | Entity == "South Korea")

eu_5 <- rate_df %>%
  rename(
    total = Air.pollution..total...deaths.per.100.000.,
    indoor = Indoor.air.pollution..deaths.per.100.000.,
    out_part = Outdoor.particulate.matter..deaths.per.100.000.,
    out_ozone = Outdoor.ozone.pollution..deaths.per.100.000.
  ) %>%
  filter(Year <= 2015) %>%
  filter(Entity == "Germany" | Entity == "Russia" | Entity == "United Kingdom" |
           Entity == "France" | Entity == "Italy")

af_5 <- rate_df %>%
  rename(
    total = Air.pollution..total...deaths.per.100.000.,
    indoor = Indoor.air.pollution..deaths.per.100.000.,
    out_part = Outdoor.particulate.matter..deaths.per.100.000.,
    out_ozone = Outdoor.ozone.pollution..deaths.per.100.000.
  ) %>%
  filter(Year <= 2015) %>%
  filter(Entity == "Egypt" | Entity == "Nigeria" | Entity == "South Africa" |
           Entity == "Algeria" | Entity == "Morocco")

###


ggplot(af_5, aes(x = Year, y = total, group = Entity)) +
  geom_line(aes(color = Entity)) +
  ggtitle("Number of deaths from air pollution (per 100,000), 1990 to 2015") +
  xlab("Year") +
  ylab("Deaths") +
  geom_text(data = af_5 %>% filter(Year == "2015"),
            aes(label = Entity, Year, color = Entity), nudge_x = 1) +
  coord_cartesian(clip = "off") +
  theme(legend.position = "none", plot.margin = margin(0.5, 1, 0.3, 0.3, "cm"))
