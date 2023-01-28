# DS103-05-12 - Lesson 5 Hands-On - Part 2 Calculating Reliability Setup

# ----------------------------------------------------
# Load Libraries
# ----------------------------------------------------
# psych ->> interpret the factor loadings
# contains function `alpha()`
library("psych")

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
#  | Test for NA values
# ----------------------------------------------------
studentSurvey1edit <- drop_na(studentSurvey1)
View(studentSurvey1edit)

# ----------------------------------------------------
# Question Setup
# ----------------------------------------------------
# Is my survey reliable?
# Does it measure the same thing every time?

# ----------------------------------------------------
# Data Wrangling
# ----------------------------------------------------
# Be sure all the data is "going the same direction" - 
# all negative, or all positive.

# ----------------------------------------------------
# | Subsetting Data
# ----------------------------------------------------
# Since my model found only 1 factor, I only need to subset once
# keep subset `studentSurvey1edit`

# ----------------------------------------------------
# Calculating Reliability in R
# ----------------------------------------------------
# use `alpha` with data frame as argument

# ----------------------------------------------------
# | Interpreting output for `studentSurvey1edit`
# ----------------------------------------------------
alpha(studentSurvey1edit)

# `Chronbach's alpha` (raw alpha) = 0.92
#     = [scale is reliable]
# Corrected-item totals (r.drop) from 0.58 to 0.74)
#     = [Inter-item reliability is good]
# `Non missing response frequency` does NOT seem even
#     = [items 4 and 5 are causing respondents to all answer
#       the same way, vs. items 1, 2, 3.]


# ----------------------------------------------------
# Draw Conclusions about Your Scale
# ----------------------------------------------------
# This survey is reliable EXCEPT that reliability testing
# indicates that item 4 and 5 have some issues, more people
# are answering the question the same way.

