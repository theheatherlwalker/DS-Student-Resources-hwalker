# DS103-05-12 - Lesson 5 Hands-On - Part 1 Factor Analysis

# ----------------------------------------------------
# Load Libraries
# ----------------------------------------------------
# corpor ->> for correlations
# GPArotation ->> to do factor analysis
# psych ->> interpret the factor loadings
# IDPmisc ->> to remove missing data

library("corpcor")
library("GPArotation")
library("psych")
library("IDPmisc")

# For dropping NA values
library(dplyr) 
library(tidyr)

# ----------------------------------------------------
# Load in Data
# ----------------------------------------------------
studentSurvey = read.csv("data/studentSurvey.csv")

# ----------------------------------------------------
# View Data
# ----------------------------------------------------
View(studentSurvey)

# ----------------------------------------------------
# Data Wrangling
# ----------------------------------------------------
studentSurvey1 <- studentSurvey[, 31:42]
studentSurvey1

# ----------------------------------------------------
#  | Remove null values
# ----------------------------------------------------
studentSurvey1edit <- drop_na(studentSurvey1)
View(studentSurvey1edit)

# ----------------------------------------------------
# Test Assumptions
# ----------------------------------------------------

# ----------------------------------------------------
#  | Sample Size
# ----------------------------------------------------
# Minimum sample size: 300+
# Current sample size: 464 rows after dropping null values

# ----------------------------------------------------
#  | Absence of Multicollinearity
# ----------------------------------------------------
studentSurveyMatrix <- cor(studentSurvey1edit) # create correlation matrix
studentSurveyMatrix

View(round(studentSurveyMatrix, 2)) # view the matrix

# There's nothing with a correlation HIGHER than 0.9, so
# there is no mutlicollinearity

# ----------------------------------------------------
#  | Some Relationship between Survey Items
# ----------------------------------------------------
# There's nothing with correlation LOWER than 0.3, so 
# there is some relationship between survey items.


# ----------------------------------------------------
#  | |  Barlett's Test (confirm correlation matrix findings)
# ----------------------------------------------------
cortest.bartlett(studentSurvey1edit)

# Chi-Square value (`chisq`) and a _p_ value.
# You want this test to be significant, and if it is, 
# this means that you have suitable correlations 
# (not too high, not too low) to proceed with a factor analysis.



# ----------------------------------------------------
#  | |  Check your Determinants (confirm correlation matrix findings)
# ----------------------------------------------------
det(studentSurveyMatrix)

# If this value is greater than .00001 (yes, that's 4 zeros), 
# then again, you have a sufficient relation between your 
# variables to proceed with a factor analysis. 


# ----------------------------------------------------
#  Initial Pass to Determine Approximate Number of Factors
# ----------------------------------------------------
pcModel1 <- principal(studentSurvey1edit, nfactors = 10, rotate = "none")
pcModel1


# ----------------------------------------------------
#  | Examine the Scree Plot
# ----------------------------------------------------
plot(pcModel1$values, type="b")


# ----------------------------------------------------
#  Second Pass to Test the Suspected Number of Factors
# ----------------------------------------------------
# Test for 1 factor (as revealed by eigenvalues)
pcModel2 <- principal(studentSurvey1edit, nfactors = 1, rotate = "none")
pcModel2


# ----------------------------------------------------
#  | Examining Residuals to Determine Model Fit
# ----------------------------------------------------
# First line: create your residuals
residuals <- factor.residuals(studentSurveyMatrix, pcModel2$loadings)

# Second line: formats residuals as matrix and keeps only top half
residuals <- as.matrix(residuals[upper.tri(residuals)])

# This line will find only the large residuals values and put in variable
largeResid <- abs(residuals) > .05

# find the number of residuals that are large
sum(largeResid)

# get the percentage of residuals that are large as
# compared to the total number of rows
sum(largeResid/nrow(residuals))

# CONCLUSION: 0.4545455 result means that ~45% of residuals
# are large. This is under 50%, so having only 1 factor
# is a pretty good model fit for the data.


# ----------------------------------------------------
#  Rotate the Factors to Determine Where Each Survey Item Fits
# ----------------------------------------------------

# ----------------------------------------------------
#  | Oblique Rotation
# ----------------------------------------------------
# Start with `oblimin` because it is assumed that the survey
# items are conceptually related to each other
# keep number of factors at 2 becuase examination of residuals
# showed that it was a good fit for the data

pcModel3 <- principal(studentSurvey1edit, nfactors = 1, rotate = "oblimin")
pcModel3


# The line of code below will print out only the loadings
# that are higher than .3, and sorts them from largest to 
# smallest.
print.psych(pcModel3, cut = .3, sort=TRUE)


# ----------------------------------------------------
#  | Orthogonal Rotation
# ----------------------------------------------------
# Varimax rotation
pcModel4 <- principal(studentSurvey1edit, nfactors = 1, rotate = "varimax")
print.psych(pcModel4, cut=.3, sort=TRUE)