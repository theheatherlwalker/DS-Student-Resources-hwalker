# DS105-02-04 - Transformations in R

######################################################################

# ---INSTALL AND LOAD PACKAGES----------------------------------------
# install.packages("rcompanion")
# install.packages("IDPmisc")
library("rcompanion")
library("IDPmisc")

#----LOAD DATA-------------------------------------------------------
anime <- read.csv("./assets/anime.csv")

#----VIEW THE DATA---------------------------------------------------
View(anime)

#----PLOT NORMAL HISTORGRAM FOR VARIABLE `score`---------------------
plotNormalHistogram(anime$score)
## This one looks to be approximately normally distributed. No need to transform the `score` variable.

######################################################################
##### TRANFORMING POSITIVELY SKEWED DATA #############################

#----PLOT NORMAL HISTORGRAM FOR VARIABLE `scored_by`-----------------
plotNormalHistogram(anime$scored_by)
## NOT normally distributed, looks to be "horribly" positively skewed.

#----SQUARE ROOT TRANSFORMATION---------------------------------------
anime$scored_bySQRT <- sqrt(anime$scored_by)

#----RUN HISTOGRAM AGAIN----------------------------------------------
plotNormalHistogram(anime$scored_bySQRT)
## It looks better than before, but perhaps it can be better still.
## So we will need to make a larger transformation,using logarithmic transformation.

#----LOGARITHMIC TRANSFORMATION---------------------------------------
## Take the log of the `scored_by` variable
anime$scored_byLOG <- log(anime$scored_by)

#----RUN HISTOGRAM AGAIN----------------------------------------------
plotNormalHistogram(anime$scored_byLOG)
## `Error in seq.default(min(x), max(x), length = length) : 'from' must be a finite number`
## This is because the log transformation made a few of the numbers so small that R gave up, 
## and just gave them the value of `-inf`, or infinitely small.
## Most functions in R will not work with infinite data, including this one
## There is, however, a package and a line of code that can save the day.

#----USE `NaRV.omit()` TO OMIT MISSING AND INFINITE VALUE DATE---------

## The library `IDPmisc` contains an ability to omit missing and infinite value data,
## called `NaRV.omit()`. Simply put your dataset name in as the argument. 
library("IDPmisc")
anime2 <- NaRV.omit(anime)

#----RUN HISTOGRAM AGAIN----------------------------------------------
plotNormalHistogram(anime2$scored_byLOG)


######################################################################
##### TRANFORMING NEGATIVELY SKEWED DATA #############################

#----PLOT NORMAL HISTORGRAM FOR VARIABLE `scored_by`-----------------
plotNormalHistogram(anime$aired_from_year)
## NOT normally distributed, looks to be NEGATIVELY skewed.

#----SQUARE TRANSFORMATION---------------------------------------
anime$aired_from_yearSQ <- anime$aired_from_year * anime$aired_from_year

#----RUN HISTOGRAM AGAIN----------------------------------------------
plotNormalHistogram(anime$aired_from_yearSQ)
## It looks better than before, That looks a bit better, but not amazing. No where near normally distributed.
## So we will need to make a larger transformation, using CUBED transformation.

#----CUBE TRANSFORMATION---------------------------------------
anime$aired_from_yearCUBE <- anime$aired_from_year ^ 3

#----RUN HISTOGRAM AGAIN----------------------------------------------
plotNormalHistogram(anime$aired_from_yearCUBE)
## Overall, that definitely looks like the best option, so you can settle for that.
## Even though it is not perfect, you are out of options.

######################################################################
##### TRANFORMING NEGATIVELY SKEWED DATA #############################