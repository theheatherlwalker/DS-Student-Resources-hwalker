# DS105-02-04 - Transformations in R - Cruise Ship data

######################################################################

# ---INSTALL AND LOAD PACKAGES----------------------------------------
# install.packages("rcompanion")
# install.packages("readxl") # for reading Excel files

library("rcompanion")
library("readxl")


#----LOAD DATA-------------------------------------------------------
cruise_ship <- read_excel("./assets/cruise_ship.xlsx")

#----VIEW THE DATA---------------------------------------------------
View(cruise_ship)

#----PLOT NORMAL HISTORGRAM FOR VARIABLE-----------------------------
plotNormalHistogram(cruise_ship$Tonnage)

######################################################################
##### TUKEY'S LADDER OF POWER TRANSFORMATION #########################

## And then you can transform it with Tukey's, where the function `transformTukey()`
## takes the argument `data$variable` and where the argument `plotit=` takes either
## `TRUE` to add a plot or `FALSE` to do without.

cruise_ship$TonnageTUK <- transformTukey(cruise_ship$Tonnage, plotit=FALSE)

#----RUN HISTOGRAM AGAIN----------------------------------------------
plotNormalHistogram(cruise_ship$TonnageTUK)
## And it did! Your data is now approximately normal, and it didn't require you to do a lot of trial and error guesswork.