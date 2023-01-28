# Call the needed libraries:
library(dplyr) # to manipulate data
library(ggplot2) # graphical tools
library(gapminder) # data set to use

# What are all the countries available in data set?
levels(gapminder$country)

# What are the years of the data set?
unique(gapminder$year)

###################################################
# Select 5 countries and assign to new data frame:
gm_NordicRegion <- filter(gapminder,
                     country %in% c("Denmark", "Norway", "Sweden", "Finland", "Iceland"))

# Eliminate extraneous variables
gm_NordicClean <- select(gm_NordicRegion, country, year, lifeExp, gdpPercap)

# Confirm elimination by looking at new data frame
head(gm_NordicClean)


###################################################
# Arrange countries by GDP in 1952
# 1st filter by rows for 1952
# 2nd arrange in those rows by GDP (variable: gdpPercap)
gm_NordicGDP1952 <- gm_NordicClean %>%
  filter(year == 1952) %>%
  arrange(gdpPercap) # will be ascending (smallest to biggest)

# Resulting tibble -- LOWEST per capita GDP in 1952:
head(gm_NordicGDP1952, n = 5)


###################################################
# Arrange countries by GDP in 2007
# 1st filter by rows for 2007
# 2nd arrange in those rows by GDP (variable: gdpPercap)
gm_NordicGDP2007 <- gm_NordicClean %>%
  filter(year == 2007) %>%
  arrange(gdpPercap) # will be ascending (smallest to biggest)

# Resulting tibble -- LOWEST per capita GDP in 2007:
head(gm_NordicGDP2007, n = 5)


###################################################
# Plots for data exploration

# Plot life expectancy as a function of time:
ggplot(gm_NordicClean) + geom_line(aes(x = year, y = lifeExp, color = country)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy in Nordic Region")

# Plot per capita GDP with a different color per country:
ggplot(gm_NordicClean) + geom_line(aes(x = year, y = gdpPercap, color = country)) +
  ylab("Per Capita GDP") + ggtitle("GDP in Nordic Regions")


###################################################
# Create a tibble median of `lifeExp` for each year for 5 countries
gm_mediansNordic <- gm_NordicClean %>%
  group_by(year) %>%
  summarise(life_medNordic = median(lifeExp))

# Look at the resulting tibble:
gm_mediansNordic


###################################################
# Create a tibble median of `lifeExp` for each year for all countries
gm_mediansAll <- gapminder %>%
  group_by(year) %>%
  summarise(life_medAll = median(lifeExp))

# Look at the resulting tibble:
gm_mediansAll


###################################################
# Plot the medians to see differences

# Plot median life expectancy by year in Nordic Region
ggplot(gm_mediansNordic) + geom_line(aes(x = year, y = life_medNordic)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy By Year in Nordic Region")

# Plot median life expectancy by year in all countries
ggplot(gm_mediansAll) + geom_line(aes(x = year, y = life_medAll)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy By Year in All Countries")


# Combine to compare
ggplot(gm_mediansNordic) + geom_line(aes(x = year, y = life_medNordic)) +
  ggplot(gm_mediansAll) + geom_line(aes(x = year, y = life_medAll)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy and GDP in Four Countries")
