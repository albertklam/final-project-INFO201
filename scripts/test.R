library(dplyr)
library(ggplot2)

rate_df <- read.csv("../data/deathrates.csv", stringsAsFactors = FALSE)

adf <- rate_df %>%
  rename(
    entity = Entity,
    code = Code,
    year = Year,
    total = Air.pollution..total...deaths.per.100.000.,
    indoor = Indoor.air.pollution..deaths.per.100.000.,
    out_part = Outdoor.particulate.matter..deaths.per.100.000.,
    out_ozone = Outdoor.ozone.pollution..deaths.per.100.000.
  ) %>%
  filter(year <= 2015) %>%
  filter(entity == "United States" | entity == "China" | entity == "Japan" |
           entity == "India" | entity == "Russia" | entity == "Brazil")

albert_plot <- ggplot(adf, aes(x = year, y = total, group = entity)) +
  geom_line(aes(color = entity)) +
  ggtitle("Number of deaths from air pollution (per 100,000), 1990 to 2015") +
  xlab("Year") +
  ylab("Deaths") +
  geom_text(data = df %>% filter(year == "2015"),
            aes(label = entity, year, color = entity), nudge_x = 1) +
  coord_cartesian(clip = "off") +
  theme(legend.position = "none", plot.margin = margin(0.5, 1, 0.3, 0.3, "cm"))