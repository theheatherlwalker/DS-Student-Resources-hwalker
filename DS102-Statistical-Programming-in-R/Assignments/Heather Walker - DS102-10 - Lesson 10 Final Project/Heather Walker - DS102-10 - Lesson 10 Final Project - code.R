# Install and call Cigarette data set
# from Ecdat package
#install.packages("Ecdat")
library(Ecdat)

# Look at first 6 rows
head(Cigarette)

# Look at Cigarette in View()
View(Cigarette)

# Data exploration -- the extent of the data set years
summary(Cigarette$year)

# Libraries -- from all steps after loading data
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
library(corrplot)
library(reshape2) # for dependent t-test plot
library(tidyverse)


#############################################################################
# 1. CREATE BOX PLOT

# group *packpc* by *state*
ggplot(Cigarette, aes(x=state, y=packpc)) + 
  geom_boxplot(aes(group=state))

# Version with labels -- group *packpc* by *state*
ggplot(Cigarette, aes(x=state, y=packpc, fill=state)) + 
  geom_boxplot(
  
  # additional color settings 
  alpha=0.7,
  
  # custom outliers
  outlier.color="red",
  outlier.fill="red",
  outlier.size=3
  
  ) +
  theme(legend.position="none") +
  xlab("State") + ylab("Average number of cigarette packs sold per capita") +
  ggtitle("Cigarette Packs Sold in the United States, from 1985 to 1995")

#############################################################################
# 2. FIND AND PLOT MEDIAN *packpc* PER *year*

# combine summarize() with group_by() and store in variable
medianPackPC <- Cigarette %>% group_by(year) %>% summarize(yearMedian = median(packpc))

# look at medianPackPC
View(medianPackPC)
medianPackPC

# Seeing the min and max for y-axis
range(medianPackPC$yearMedian)

# plot medianPackPC - line plot
ggplot(medianPackPC, aes(x=year, y=yearMedian)) +
  geom_point(color="red") +
  geom_line() +
  scale_x_continuous(breaks = seq(1985,1995)) +
  xlab("Year") + ylab("Median number of cigarette packs per capita") +
  ggtitle("Cigarette Packs Sold in the United States, from 1985 to 1995")


#############################################################################
# 3. CREATE SCATTER PLOT OF *avgprs* VS. *packpc* (FOR ALL *year* AND *state*)

# color by *year*
ggplot(Cigarette, aes(x=avgprs, y=packpc, color=year)) + 
  geom_point() +
  scale_color_gradient(low = "tomato4", high = "tomato") +
  xlab("Average price per pack of cigarettes") + ylab("Cigarette packs per capita") +
  ggtitle("Price of Cigarette Packs Sold in the United States, from 1985 to 1995")

# Create a new column to calculate price in dollars
Cigarette <- mutate(Cigarette, avgprs.dollars = avgprs/100)
View(Cigarette)

# Change out avgprs with avgprs.dollars to get a better label of price
ggplot(Cigarette, aes(x=avgprs.dollars, y=packpc, color=year)) + 
  geom_point() +
  geom_smooth(method=lm, color="red", se=TRUE) +
  scale_color_gradient(low = "tomato4", high = "tomato") +
  scale_x_continuous(labels=scales::dollar_format()) +
  xlab("Average price per pack of cigarettes") + ylab("Cigarette packs sold per capita") +
  ggtitle("Price of Cigarette Packs Sold in the United States, from 1985 to 1995")

# Test for correlation
# use method="pearson"
cor.test(Cigarette$avgprs, Cigarette$packpc, method="pearson", use = "complete.obs")

# Compute linear regression of *avgprs* VS. *packpc* (for all *year* AND *state*)
lin_reg <- lm(avgprs ~ packpc, Cigarette)
print(lin_reg)

# Use summary to show *Adjusted R-squared* -- the variability of the line
summary(lin_reg)


#############################################################################
# 4.ADJUST FOR INFLATION

# Add a column and divide *avgprs* by *cpi* and then divide by 100 to get dollars
Cigarette <- mutate(Cigarette, inflation.dollars = (avgprs/cpi)/100)
View(Cigarette)

# Plot with this adjusted price
ggplot(Cigarette, aes(x=inflation.dollars, y=packpc, color=year)) + 
  geom_point() +
  geom_smooth(method=lm, color="orangered1", se=TRUE) +
  scale_color_gradient(low = "darkorange4", high = "darkorange") +
  scale_x_continuous(labels=scales::dollar_format()) +
  xlab("Adjusted average price per pack of cigarettes") + ylab("Cigarette packs sold per capita") +
  ggtitle("Inflation-Adjusted Average Price of Cigarette Packs Sold in the United States, from 1985 to 1995")

# Compute linear regression of *avgprs* VS. *packpc* (for all *year* AND *state*)
lin_reg.inflation <- lm(inflation.dollars ~ packpc, Cigarette)
print(lin_reg.inflation)

# Use summary to show *Adjusted R-squared* -- the variability of the line
summary(lin_reg.inflation)


#############################################################################
# 5. Compare 1985 to 1995 with paired t-test

# Create a data frame with just the rows from 1985
Cigarette.1985 <- filter(Cigarette, year == 1985)
View(Cigarette.1985)

# Create a data frame with just the rows from 1995
Cigarette.1995 <- filter(Cigarette, year == 1995)
View(Cigarette.1995)

# Create vector of number of packs per capita from 1985
packspc.1985 <- Cigarette.1985$packpc
packspc.1985 # to view the vector

# Create vector of number of packs per capita from 1995
packspc.1995 <- Cigarette.1995$packpc
packspc.1995 # to view the vector

# Perform Dependent t-Test
t_dep <- t.test(packspc.1985, packspc.1995, paired = TRUE)
t_dep

#############################################################################
# 5. EXTRA / ALTERNATE Compare 1985 to 1995 with paired t-test

# Create data frame with select of only year, and packpc
# with filter of both 1985 and 1995 at the same time
Cigarette.1985v1995 <- Cigarette %>% select(year, packpc) %>% filter(year %in% c(1985, 1995))
View(Cigarette.1985v1995)

# Create box plot -- simple
ggplot(Cigarette.1985v1995, aes(x = year, y = packpc)) + 
  geom_boxplot(aes(group=year))


# Create box plot -- prettier
ggplot(Cigarette.1985v1995, aes(x = year, y = packpc, group = year, fill = year)) + 
  geom_boxplot(
    
    # additional color settings 
    alpha=0.7,
    
    # custom outliers
    outlier.color="red",
    outlier.fill="red",
    outlier.size=3
    
  ) +
  scale_x_continuous(breaks = c(1985,1995)) +
  theme(legend.position="none") +
  xlab("Year, 1985 vs. 1995") + ylab("Average number of cigarette packs sold per capita") +
  ggtitle("Cigarette Packs Sold in the United States, comparing 1985 to 1995")


#############################################################################
# 6. What is the relationship between average income and cigarette pack sales per capita?

# Find income per capita -- income is in millions
Cigarette <- mutate(Cigarette, incomepercapita = (income*1000)/pop)
View(Cigarette)

# Scatter plot -- simple
ggplot(Cigarette, aes(x=incomepercapita, y=packpc)) + 
  geom_point() +
  ggtitle("Price of Cigarette Packs Sold in the United States, from 1985 to 1995")

# Scatter plot -- prettier with best fit line
ggplot(Cigarette, aes(x=incomepercapita, y=packpc, color=year)) + 
  geom_point() +
  geom_smooth(method=lm, color="red", se=TRUE) +
  scale_color_gradient(low = "blue", high = "green") +
  scale_x_continuous(labels=scales::dollar_format()) +
  xlab("Yearly income per capita") + ylab("Cigarette packs sold per capita") +
  ggtitle("Income vs. Cigarette Packs Sold in the United States, from 1985 to 1995")

# Compute linear regression of *incomepercapita* VS. *packpc* (for all *year* AND *state*)
lin_reg.income <- lm(incomepercapita ~ packpc, Cigarette)
print(lin_reg.income)

# Use summary to show *Adjusted R-squared* -- the variability of the line
summary(lin_reg.income)


#############################################################################
# 7. What was the packs sold per capita in state of TN vs. the rest of the United States? 

# Create data frame with only TN
packpc.TN <- Cigarette %>% select(state, year, packpc) %>% filter(state=="TN")
View(packpc.TN)
# remove "state" column
packpc.TN <- packpc.TN %>% select(year, packpc)

# get column names from packpc.TN and make it match
colnames(packpc.TN)
colnames(packpc.TN) <- c("year", "TN_Mean")


# Create data frame with all state excluding TN
# and average (mean) the packpc for all states by year
packpc.notTN <- Cigarette %>% select(state, year, packpc) %>% filter(state != "TN") %>% group_by(year) %>% summarize(stateMean = mean(packpc))
View(packpc.notTN)

# Using rbind() to caoncatenate the 2 data frames
packpc.byState <- list(packpc.TN, packpc.notTN)
packpc.byState %>% reduce(full_join, by="year")
packpc.byState <- as.data.frame(packpc.byState)


# Plot together
p <- ggplot(packpc.byState, aes(x=year))+
  geom_line(aes(y=stateMean), color="grey46") + 
  geom_point(aes(y=stateMean), color="grey46", size=4, alpha=0.7) + 
  geom_line(aes(y=TN_Mean), color="red3") + 
  geom_point(aes(y=TN_Mean), color="red3", size=4, alpha=0.7) + 
  theme(legend.position="none") +
  scale_x_continuous(breaks = seq(1985,1995)) +
  xlab("Year") + ylab("Cigarette packs sold per capita") +
  ggtitle("Cigarette Packs Sold in the United States, from 1985 to 1995")

# Add the labels
p + annotate("text", x=c(1985.75,1985.75), y=c(127.5,121), label=c("Tennessee", "All Other States"), color=c("red3", "grey46"), size=5, hjust=0)

