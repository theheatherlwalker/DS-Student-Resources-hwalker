# DS103-05-07 - Factor Analysis Setup in R

# ----------------------------------------------------
# Load Libraries
# ----------------------------------------------------
# corpor ->> for correlations
# GPArotation ->> to do factor analysis
# psych ->> interpret the factor loadings
# IDPmisc ->> to remove missing data

# install.packages("corpcor")
library("corpcor")
library("GPArotation")
library("psych")
library("IDPmisc")

# ----------------------------------------------------
# Load in Data
# ----------------------------------------------------
financialWB = read.csv("data/financialWB.csv")

# ----------------------------------------------------
# View Data
# ----------------------------------------------------
View(financialWB)


# ----------------------------------------------------
# Data Wrangling
# ----------------------------------------------------
financialWB1 <- financialWB[, 8:17]


# ----------------------------------------------------
# Test Assumptions
# ----------------------------------------------------

# ----------------------------------------------------
#  | Sample Size
# ----------------------------------------------------
# Minimum sample size: 300+
# Current sample size: 6,394 rows

# ----------------------------------------------------
#  | Absence of Multicollinearity
# ----------------------------------------------------
financialWBmatrix <- cor(financialWB1) # create correlation matrix


View(round(financialWBmatrix, 2)) # view the matrix
# There's nothing with a correlation above 0.9, so
# there is no mutlicollinearity

# ----------------------------------------------------
#  | Some Relationship between Survey Items
# ----------------------------------------------------
# There's nothing with correlation LOWER than 0.3, so 
# there is some relationship between survey items.


# ----------------------------------------------------
#  | |  Barlett's Test (confirm correlation matrix findings)
# ----------------------------------------------------
cortest.bartlett(financialWB1)

# `R was not square, finding R from data`. That can be ignored; 
# it is just acknowledging that you fed in raw data instead of 
# a matrix, which is perfectly fine.

# Chi-Square value (`chisq`) and a _p_ value.
# You want this test to be significant, and if it is, 
# this means that you have suitable correlations 
# (not too high, not too low) to proceed with a factor analysis.


# ----------------------------------------------------
#  | |  Check your Determinants (confirm correlation matrix findings)
# ----------------------------------------------------
det(financialWBmatrix)

#If this value is greater than .00001 (yes, that's 4 zeros), 
# then again, you have a sufficient relation between your 
# variables to proceed with a factor analysis. 


# ----------------------------------------------------
#  Initial Pass to Determine Approximate Number of Factors
# ----------------------------------------------------
pcModel1 <- principal(financialWB1, nfactors = 10, rotate = "none")
pcModel1


# ----------------------------------------------------
#  | Examine the Scree Plot
# ----------------------------------------------------
plot(pcModel1$values, type="b")


# ----------------------------------------------------
#  Second Pass to Test the Suspected Number of Factors
# ----------------------------------------------------
# Test for 2 factors (as revealed by eigenvalues)
pcModel2 <- principal(financialWB1, nfactors = 2, rotate = "none")
pcModel2


# ----------------------------------------------------
#  | Examining Residuals to Determine Model Fit
# ----------------------------------------------------
# First line: create your residuals
residuals <- factor.residuals(financialWBmatrix, pcModel2$loadings)

# Second line: formats residuals as matrix and keeps only top half
residuals <- as.matrix(residuals[upper.tri(residuals)])

# This line will find only the large residuals values and put in variable
largeResid <- abs(residuals) > .05

# find the number of residuals that are large
sum(largeResid)

# get the percentage of residuals that are large as
# compared to the total number of rows
sum(largeResid/nrow(residuals))

# CONCLUSION: 0.3777778 result means that 37% of residuals
# are large. This is under 50%, so having only two factors
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

pcModel3 <- principal(financialWB1, nfactors = 2, rotate = "oblimin")
pcModel3


# The line of code below will print out only the loadings
# that are higher than .3, and sorts them from largest to 
# smallest.
print.psych(pcModel3, cut = .3, sort=TRUE)


# ----------------------------------------------------
#  | Orthogonal Rotation
# ----------------------------------------------------
# Varimax rotation
pcModel4 <- principal(financialWB1, nfactors = 2, rotate = "varimax")
print.psych(pcModel4, cut=.3, sort=TRUE)