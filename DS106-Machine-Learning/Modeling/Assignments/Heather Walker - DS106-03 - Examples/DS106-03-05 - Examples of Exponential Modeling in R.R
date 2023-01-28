## DS106-03-05 - Examples of Exponential Modeling in R

#-------------------------------------------
# LOAD LIBRARIES

# none needed!

#-------------------------------------------
# LOAD IN DATA

bacteria = read.csv("data/bacteria.csv")

#-------------------------------------------
# VIEW DATA

View(bacteria)


# QUESTION: "How much does bacteria grow over time?"
# `Count`, your y variable, over time `Period`, your x variable.

#-------------------------------------------
# MODEL THE DATA
# Take the log() of the y variable

exMod <- lm(log(bacteria$Count)~bacteria$Period)

#-------------------------------------------
# SUMMARY

summary(exMod)

# If the F-statistic and p-value are significant,
# that means the x variable demonstrates exponential change
# with the y variable.