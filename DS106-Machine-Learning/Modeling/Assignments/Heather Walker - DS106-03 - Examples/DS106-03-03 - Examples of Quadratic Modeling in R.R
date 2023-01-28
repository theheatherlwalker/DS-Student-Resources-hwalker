## DS106-03 - Examples of Quadratic Modeling in R

#-------------------------------------------
# LOAD LIBRARIES

library("ggplot2")

#-------------------------------------------
# LOAD IN DATA

bluegill_fish = read.csv("data/bluegill_fish.csv")

#-------------------------------------------
# VIEW DATA

View(bluegill_fish)


# QUESTION: `Does the age of the bluegill fish influence their length?`

#-------------------------------------------
# GRAPH DATA AGAINST A BEST-FIT QUADRATIC LINE
# to see if the data is quadratic in nature

quadPlot <- ggplot(bluegill_fish, aes(x = age, y=length)) + 
  geom_point() + stat_smooth(method = "lm", 
  formula = y ~x + I(x^2), size =1)
quadPlot

#-------------------------------------------
# MODEL THE DATA
# Now that you know it is quadratic.
# Need to square the x term first:

Agesq <- bluegill_fish$age^2

#-------------------------------------------
# NOW USE lm() MODEL THE DATA

quadModel <- lm(bluegill_fish$length~bluegill_fish$age+Agesq)

#-------------------------------------------
# SUMMARY

summary(quadModel)

# If the F-statistic and p-value are significant,
# that means the x variable is a significant quadratic predictor
# of the y variable.