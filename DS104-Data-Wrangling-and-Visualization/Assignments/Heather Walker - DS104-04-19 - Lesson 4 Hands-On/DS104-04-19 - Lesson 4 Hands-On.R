############################################################
# DS104-04-19 - Lesson 4 Hands-On

library(ggplot2)
library(tidyverse)


# import dataset
# NOTE: Set Working Directory to Project Folder
heartattacks = read.csv('data/L5P5.csv')

# view the dataset
View(heartattacks)

# combine Month Day and Year columns into Date column
heartattacks$Date <- paste(heartattacks$Month, heartattacks$Day, heartattacks$Year)

# convert Date column from string to date
heartattacks$Date = as.Date(heartattacks$Date, format = "%Y-%m-%d")

# plotting with Date as date
ggplot(heartattacks, aes(x=Date, y='Heart Attacks')) +
  geom_line() + 
  xlab("Date of Heart Attacks") + 
  ylab("Count of Heart Attacks") + 
  ggtitle("Heart Attacks, May through July 2003")