# Install and make available the gapminder package:
install.packages("gapminder")
library(gapminder)
head(gapminder)
country

# To see the levels (different values) of a factor, use `levels()`:
levels(gapminder$country)

# To see unique values for numerical variable, use `unique()`:
unique(gapminder$year)

# Create a box plot to see population changes:
library(ggplot2)
ggplot(gapminder, aes(x = factor(year), y = pop)) + geom_boxplot()

# Change vertical scale to logarithmic to see small AND large values:
ggplot(gapminder, aes(x = factor(year), y = pop)) + geom_boxplot() +
  scale_y_log10()


# ****************************************************************
# IN CASE OF ERROR:

# try loading library `dplyr` to perform filtering and other operations
library(dplyr)

# ****************************************************************
# FIND THE LARGEST COUNTRIES IN 2007 --

# 1st filter by rows for 2007
# 2nd arrange in those rows by population variable (big to small)
gm.big <- gapminder %>%
  filter(year == 2007) %>%
  arrange(desc(pop))

# Resulting tibble -- Biggest countries
head(gm.big, n = 10)

# Resulting tibble -- Smallest countries
tail(gm.big, n = 10)


# ****************************************************************
# FINDING OUTLIERS IN PER CAPITA GDP

# plot the per capita GDP for each year:
ggplot(gapminder, aes(x = factor(year), y = gdpPercap)) + geom_boxplot()

# TO FIND OUTLIERS:
# Find interquartile range -> multiply by 1.5 ->
# add it to the third quartile boundary
# 9325.5 - 1202.1 = 8123.4
# 8123.4 x 1.5 = 12,185.1
# 12,185.1 + 9325.5 = 13,988.25

# Use `filter()` function to select rows with gdpPercap greater than 13988
filter(gapminder, gdpPercap > 13988)


# ****************************************************************
# GRAPH LIFE EXPECTANCY

# plot life expectancy values for each year:
ggplot(gapminder, aes(x = factor(year), y = lifeExp)) + geom_boxplot()

# One country had a very low life expenctancy in 1992: 
filter(gapminder, lifeExp < 28)


# ****************************************************************
# ONLY EUROPEAN COUNTRIES

# What type of variable is Continent? Text = string
gm.Europe <- filter(gapminder, continent == "Europe")

# Create box plots of life expectancy
ggplot(gm.Europe, aes(x = factor(year), y = lifeExp)) + geom_boxplot()

# Find the outlier
filter(gm.Europe, lifeExp < 53)


# ****************************************************************
# FOCUS ON ANGOLA

# Filter the data for only Angola
gm_Angola <- filter(gapminder, country == "Angola")
head(gm_Angola)

# Plot life expectancy by year
ggplot(gm_Angola) + geom_line(aes(x = year, y = lifeExp)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy in Angola")

# Plot per capita GDP for Angola
ggplot(gm_Angola) + geom_line(aes(x = year, y = gdpPercap)) +
  ylab("Per Capita GDP") + ggtitle("GDP in Angola")


# ****************************************************************
# COMPARE 4 AFRICAN COUNTRIES: ANGOLA, GHANA, ETHIOPIA, AND SOUTH AFRICA

# Filter and create data frame
gm_Africa4 <- filter(gapminder,
                     country %in% c("Angola", "Ghana", "Ethiopia", "South Africa"))

# Eliminate extraneous variables
gm_AfricaClean <- select(gm_Africa4, country, year, lifeExp, gdpPercap)
head(gm_AfricaClean)

# Combine operations using teh %>% (pipe) operator!
gm_AfricaClean <- gapminder %>%
  filter(country %in% c("Angola", "Ghana", "Ethiopia", "South Africa")) %>%
  select(country, year, lifeExp, gdpPercap)

# ****************************************************************
# PLOTS OF 4 AFRICAN COUNTRIES: ANGOLA, GHANA, ETHIOPIA, AND SOUTH AFRICA

# Plot life exptectancy as a funciton of time:
ggplot(gm_AfricaClean) + geom_line(aes(x = year, y = lifeExp, color = country)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy in Four Countries")

# Plot per capita GDP with a different color per country:
ggplot(gm_AfricaClean) + geom_line(aes(x = year, y = gdpPercap, color = country)) +
  ylab("Per Capita GDP") + ggtitle("GDP in Four Countries")


# ****************************************************************
# USING GRID.ARRANGE()

# Install "gridExtra" package 
install.packages("gridExtra")
library("gridExtra")

# Create 2 plots in new variables
life_exp <- ggplot(gm_AfricaClean) + geom_line(aes(x = year, y = lifeExp, color = country)) 
GDP <- ggplot(gm_AfricaClean) + geom_line(aes(x = year, y = gdpPercap, color = country)) +
  ylab("Life Expectancy")

# Use grid.arrange() to put both plots together
grid.arrange(life_exp, GDP, ncol = 1)


# ****************************************************************
# ADDING ADDITIONAL VARIABLES TO THE PLOT

# Include both life expectancy and per capita GDP on a single graph
# can plot life expectancy as both lines and points
# make the size of the point be proportional to the per capita GDP
ggplot(gm_AfricaClean, aes(x = year, y = lifeExp, color = country)) +
  geom_line() + geom_point(aes(size = gdpPercap)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy and GDP in Four Countries")


# ****************************************************************
# PLOTTING GDP AND LIFE EXPECTANCY AGAINST EACH OTHER

# Start by plotting per capita GDP on x-axis
# plot life expectacy on the y-axis
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point()

# Connect the points to better see the values over time -- THIS DOES NOT DO THAT
# It just connect the dots closest to each other IN THE GRAPH
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point() + geom_line()

# THIS will draw lines between ADJACENT values in the DATA FRAME
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point() + geom_path()


# Make the points transparent with `alpha=`
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point(aes(alpha = year)) + geom_path()

# Change the transparency values with `scale_alpha()`
# and make the points larger with `size=` argument
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point(aes(alpha = year), size = 3) + geom_path() +
  scale_alpha(range = c(0.3, 1.0))


# Clearly label the graph
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point(aes(alpha = year), size = 3) + geom_path() +
  scale_alpha(range = c(0.3, 1.0)) +
  xlab("Per capita GDP") + ylab("Life Expectancy")


# ****************************************************************
# HOW DO THESE 4 COUNTRIES COMPARE TO THE REST OF AFRICA?

# Create a tibble with medians of life expectancy and per capita GDP
# for all the countries in Africa
gm_medians <- gapminder %>%
  filter(continent == "Africa") %>%
  group_by(year) %>%
  summarise(life_med = median(lifeExp), gdp_med = median(gdpPercap))

# Look at the resulting tibble:
gm_medians




