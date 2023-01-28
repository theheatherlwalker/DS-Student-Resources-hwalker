# DS103-05-09 - Calculating Reliability Setup

# ----------------------------------------------------
# Load Libraries
# ----------------------------------------------------
# psych ->> interpret the factor loadings
# contains function `alpha()`
library("psych")

# ----------------------------------------------------
# Load in Data
# ----------------------------------------------------
financialWB = read.csv("data/financialWB.csv")

# ----------------------------------------------------
# | View Data
# ----------------------------------------------------
View(financialWB)

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
goodFWB <- financialWB1[, c(1,2,4,8)]
badFWB <- financialWB1[, c(3,5,6,7,9,10)]

# ----------------------------------------------------
# | Reverse Coding Items
# ----------------------------------------------------
# Next, you'll reverse code all the items that are "negative." 
financialWB1$FWB1_3r <- NA
financialWB1$FWB1_3r[financialWB1$FWB1_3 == 1] <- 5
financialWB1$FWB1_3r[financialWB1$FWB1_3 == 2] <- 4
financialWB1$FWB1_3r[financialWB1$FWB1_3 == 3] <- 3
financialWB1$FWB1_3r[financialWB1$FWB1_3 == 4] <- 2
financialWB1$FWB1_3r[financialWB1$FWB1_3 == 5] <- 1

financialWB1$FWB1_5r <- NA
financialWB1$FWB1_5r[financialWB1$FWB1_5 == 1] <- 5
financialWB1$FWB1_5r[financialWB1$FWB1_5 == 2] <- 4
financialWB1$FWB1_5r[financialWB1$FWB1_5 == 3] <- 3
financialWB1$FWB1_5r[financialWB1$FWB1_5 == 4] <- 2
financialWB1$FWB1_5r[financialWB1$FWB1_5 == 5] <- 1

financialWB1$FWB1_6r <- NA
financialWB1$FWB1_6r[financialWB1$FWB1_6 == 1] <- 5
financialWB1$FWB1_6r[financialWB1$FWB1_6 == 2] <- 4
financialWB1$FWB1_6r[financialWB1$FWB1_6 == 3] <- 3
financialWB1$FWB1_6r[financialWB1$FWB1_6 == 4] <- 2
financialWB1$FWB1_6r[financialWB1$FWB1_6 == 5] <- 1

financialWB1$FWB2_1r <- NA
financialWB1$FWB2_1r[financialWB1$FWB2_1 == 1] <- 5
financialWB1$FWB2_1r[financialWB1$FWB2_1 == 2] <- 4
financialWB1$FWB2_1r[financialWB1$FWB2_1 == 3] <- 3
financialWB1$FWB2_1r[financialWB1$FWB2_1 == 4] <- 2
financialWB1$FWB2_1r[financialWB1$FWB2_1 == 5] <- 1

financialWB1$FWB2_3r <- NA
financialWB1$FWB2_3r[financialWB1$FWB2_3 == 1] <- 5
financialWB1$FWB2_3r[financialWB1$FWB2_3 == 2] <- 4
financialWB1$FWB2_3r[financialWB1$FWB2_3 == 3] <- 3
financialWB1$FWB2_3r[financialWB1$FWB2_3 == 4] <- 2
financialWB1$FWB2_3r[financialWB1$FWB2_3 == 5] <- 1

financialWB1$FWB2_4r <- NA
financialWB1$FWB2_4r[financialWB1$FWB2_4 == 1] <- 5
financialWB1$FWB2_4r[financialWB1$FWB2_4 == 2] <- 4
financialWB1$FWB2_4r[financialWB1$FWB2_4 == 3] <- 3
financialWB1$FWB2_4r[financialWB1$FWB2_4 == 4] <- 2
financialWB1$FWB2_4r[financialWB1$FWB2_4 == 5] <- 1

# ----------------------------------------------------
# | Dropping the Old (Non-Recoded) Items
# ----------------------------------------------------
# Once you have completed all your reverse coding, 
# you'll want to drop out the old items that were 
# negative and not reverse-coded.
financialWB2 <- financialWB1[, c(1,2,4,8,11,12,13,14,15,16)]


# ----------------------------------------------------
# Calculating Reliability in R
# ----------------------------------------------------
# use `alpha` with data frame as argument

# ----------------------------------------------------
# | Interpreting output for `goodFWB`
# ----------------------------------------------------
alpha(goodFWB)

# `raw alpha` (Chronbach's alpha score) is 0.88, so it looks
# like the scale has pretty good reliability.

# `r.drop` is above 0.3

# `Non missing response requency` looks to be evenly distributed

# ----------------------------------------------------
# | Interpreting output for `badFWB`
# ----------------------------------------------------
alpha(badFWB)

# `Chronbach's alpha` (raw alpha) = 0.87
#     = [scale is reliable]
# Corrected-item totals (r.drop) ~ 0.6+)
#     = [Inter-item reliability is good]
# `Non missing response frequency` seems even
#     = [no item is causing respondents to all answer
#       the same way]


# ----------------------------------------------------
# | Interpreting output for `financialWB2` (scale as a whole)
# ----------------------------------------------------
alpha(financialWB2)

# `Chronbach's alpha` (raw alpha) = 0.92
#     = [scale is reliable]
# Corrected-item totals (r.drop) ~ 0.6)
#     = [Inter-item reliability is good]
# `Non missing response frequency` seems even
#     = [no item is causing respondents to all answer
#       the same way]


# ----------------------------------------------------
# Draw Conclusions about Your Scale
# ----------------------------------------------------
# After examining the financial wellbeing scale as a whole
# and examining its subscales, your conclusion is that this
# is a very reliable survey! 


