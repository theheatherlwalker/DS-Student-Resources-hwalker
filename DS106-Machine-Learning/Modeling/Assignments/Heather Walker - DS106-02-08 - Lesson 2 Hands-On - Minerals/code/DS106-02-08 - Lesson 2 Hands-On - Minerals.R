## DS106-02-08 - Lesson 2 Hands-On

#-------------------------------------------
# CALL PACKAGES / LIBRARIES
# to conduct logistic regression in R:

# to test assumptions
library("caret")
library("lmtest")

# for data wrangling
library("magrittr")
library("dplyr")
library("tidyr")
library("e1071")

# to graph logistic regression model
library("popbio")

#-------------------------------------------
# LOAD IN DATA

minerals = read.csv("data/minerals.csv")

#-------------------------------------------
# VIEW DATA

View(minerals)

#-------------------------------------------
# DATA WRANGLING
# The data is already coded as "binary", with
# 0 = "no gold present"
# 1 = "gold present"

#-------------------------------------------
# CREATE MODEL
# (but you won't use it yet)

mylogit <- glm(Gold ~ Antimony, data=minerals, family="binomial")

#-------------------------------------------
# MAKE PREDICTIONS WITH MODEL

probabilities <- predict(mylogit, type = "response")

#-------------------------------------------
# CONVERT PROBABILITIES
# Convert probabilities to positive and negative prediction, with
# anything above .5 (half) is positive,
# and anything below .5 is negative

probabilities <- predict(mylogit, type = "response")
minerals$Predicted <- ifelse(probabilities > .5, "pos", "neg")

#-------------------------------------------
# RECODE THE PREDICTED VARIABLE
# just like the "Rerence" as binary, you need to recode the predicted variable

minerals$PredictedR <- NA
minerals$PredictedR[minerals$Predicted=='pos'] <- 1
minerals$PredictedR[minerals$Predicted=='neg'] <- 0

#-------------------------------------------
# CONVERT VARIABLES TO FACTORS
# This is necessary because the next line of code you will run
# requires these variables to be factors. 

minerals$PredictedR <- as.factor(minerals$PredictedR)
minerals$Gold <- as.factor(minerals$Gold)

#-------------------------------------------
# CREATE CONFUSION MATRIX
# Create 2x2 chart that will test your sample size and provide
# some information on the accuracy of the prediction

conf_mat <- caret::confusionMatrix(minerals$PredictedR, minerals$Gold)
conf_mat

#-------------------------------------------
# CALCULATE THE LOGIT
# need to do more data wrangling to properly create logit
# only want to assess the linearity of the logit with numeric values

minerals1 <- minerals %>% 
  dplyr::select_if(is.numeric)

#-------------------------------------------
# RENAME THE COLUMN NAMES
# for the columns to be fed into predictors

predictors <- colnames(minerals1)

#-------------------------------------------
# CREATE THE LOGIT
# Calculated as the log of the probabilities
# divided by 1, minus the probabilities

minerals1 <- minerals1 %>%
  mutate(logit=log(probabilities/(1-probabilities))) %>%
  gather(key= "predictors", value="predictor.value", -logit)

#-------------------------------------------
# GRAPH LOGIT TO ASSESS FOR LINEARITY

ggplot(minerals1, aes(logit, predictor.value))+
  geom_point(size=.5, alpha=.5)+
  geom_smooth(method= "loess")+
  theme_bw()+
  facet_wrap(~predictors, scales="free_y")

#-------------------------------------------
# TEST FOR ERRORS Option 1:
# Graph the errors (residuals)

plot(mylogit$residuals)
# meets the assumption of independent errors!

#-------------------------------------------
# TEST FOR ERRORS Option 2: 
# use the Durbin-Watson test:

dwtest(mylogit, alternative="two.sided")
#If this test is not statistically significant (> .05), 
# then you are automatically good to go, 
# and you have independent errors.


#-------------------------------------------
# SCREENING FOR OUTLIERS WITH INFLUENCE MEASURES

infl <- influence.measures(mylogit)
summary(infl)


#-------------------------------------------
# ASK FOR SUMMARY

summary(mylogit)

#-------------------------------------------
# PLOT THE LOGISTIC MODEL

logi.hist.plot(minerals$Antimony,minerals$Gold, 
               boxp=FALSE, type="hist", col="gray")