# DS105-02-05 - Transformations in R Activity - cruise ships
###############################################################################

#==============================================================================
# INSTALL AND LOAD PACKAGES

# install.packages("rcompanion")
# install.packages("readxl") # for reading Excel files
library("rcompanion")
library("readxl")

# LOAD DATA
cruise_ship <- read_excel("./assets/cruise_ship.xlsx")

# VIEW THE DATA
View(cruise_ship)

#==============================================================================
# VARIABLE: `YearBlt`

# PLOT NORMAL HISTORGRAM FOR VARIABLE
plotNormalHistogram(cruise_ship$YearBlt)

# TRANSFORM:
cruise_ship$YearBltTUK <- transformTukey(cruise_ship$YearBlt, plotit=FALSE)


# RUN HISTOGRAM AGAIN
plotNormalHistogram(cruise_ship$YearBltTUK)


#==============================================================================
# VARIABLE: `Tonnage`

# PLOT NORMAL HISTORGRAM FOR VARIABLE
plotNormalHistogram(cruise_ship$Tonnage)

# TRANSFORM: TUKEY'S LADDER OF POWER
cruise_ship$TonnageTUK <- transformTukey(cruise_ship$Tonnage, plotit=FALSE)

# RUN HISTOGRAM AGAIN
plotNormalHistogram(cruise_ship$TonnageTUK)

#==============================================================================
# VARIABLE: `passngrs`

# PLOT NORMAL HISTORGRAM FOR VARIABLE
plotNormalHistogram(cruise_ship$passngrs)

# TRANSFORM: TUKEY'S LADDER OF POWER
cruise_ship$passngrsTUK <- transformTukey(cruise_ship$passngrs, plotit=FALSE)

# RUN HISTOGRAM AGAIN
plotNormalHistogram(cruise_ship$passngrsTUK)

#==============================================================================
# VARIABLE: `Length`

# PLOT NORMAL HISTORGRAM FOR VARIABLE
plotNormalHistogram(cruise_ship$Length)

# TRANSFORM:
cruise_ship$LengthTUK <- transformTukey(cruise_ship$Length, plotit=FALSE)


# RUN HISTOGRAM AGAIN
plotNormalHistogram(cruise_ship$LengthTUK)


#==============================================================================
# VARIABLE: `Cabins`

# PLOT NORMAL HISTORGRAM FOR VARIABLE
plotNormalHistogram(cruise_ship$Cabins)

# TRANSFORM: TUKEY'S LADDER OF POWER
cruise_ship$CabinsTUK <- transformTukey(cruise_ship$Cabins, plotit=FALSE)

# RUN HISTOGRAM AGAIN
plotNormalHistogram(cruise_ship$CabinsTUK)


#==============================================================================
# VARIABLE: `Crew`

# PLOT NORMAL HISTORGRAM FOR VARIABLE
plotNormalHistogram(cruise_ship$Crew)

# TRANSFORM: TUKEY'S LADDER OF POWER
cruise_ship$CrewTUK <- transformTukey(cruise_ship$Crew, plotit=FALSE)

# RUN HISTOGRAM AGAIN
plotNormalHistogram(cruise_ship$CrewTUK)


#==============================================================================
# VARIABLE: `PassSpcR`

# PLOT NORMAL HISTORGRAM FOR VARIABLE
plotNormalHistogram(cruise_ship$PassSpcR)

# TRANSFORM: TUKEY'S LADDER OF POWER
cruise_ship$PassSpcRTUK <- transformTukey(cruise_ship$PassSpcR, plotit=FALSE)

# RUN HISTOGRAM AGAIN
plotNormalHistogram(cruise_ship$PassSpcRTUK)


#==============================================================================
# VARIABLE: `outcab`

# PLOT NORMAL HISTORGRAM FOR VARIABLE
plotNormalHistogram(cruise_ship$outcab)

# TRANSFORM: TUKEY'S LADDER OF POWER
cruise_ship$outcabTUK <- transformTukey(cruise_ship$outcab, plotit=FALSE)

# RUN HISTOGRAM AGAIN
plotNormalHistogram(cruise_ship$outcabTUK)

