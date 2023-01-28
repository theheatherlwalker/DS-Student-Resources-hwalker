## DS106-02 - Logistic Regression in R

#-------------------------------------------
# ISNTALL PACKAGES / LIBRARIES
# to conduct logistic regression in R:

# to test assumptions
install.packages("caret")
install.packages("lmtest")

# for data wrangling
install.packages("magrittr")
install.packages("dplyr")
install.packages("tidyr")
install.packages("e1071")

# to graph logistic regression model
install.packages("popbio")

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

baseball = read.csv("data/baseball.csv")

#-------------------------------------------
# VIEW DATA

View(baseball)

#-------------------------------------------
# DATA WRANGLING
# Recoding for binary dependent variable

baseball$WinsR <- NA
baseball$WinsR[baseball$W.L=='W'] <- 1
baseball$WinsR[baseball$W.L=='L'] <- 0

#-------------------------------------------
# CREATE MODEL
# (but you won't use it yet)

mylogit <- glm(WinsR ~ HR.Count, data=baseball, family="binomial")

#-------------------------------------------
# MAKE PREDICTIONS WITH MODEL

probabilities <- predict(mylogit, type = "response")

#-------------------------------------------
# CONVERT PROBABILITIES
# Convert probabilities to positive and negative prediction, with
# anything above .5 (half) is positive,
# and anything below .5 is negative

probabilities <- predict(mylogit, type = "response")
baseball$Predicted <- ifelse(probabilities > .5, "pos", "neg")

#-------------------------------------------
# RECODE THE PREDICTED VARIABLE
# (just like you recoded wins and losses) you need to recode the
#predicted variable

baseball$PredictedR <- NA
baseball$PredictedR[baseball$Predicted=='pos'] <- 1
baseball$PredictedR[baseball$Predicted=='neg'] <- 0

#-------------------------------------------
# CONVERT VARIABLES TO FACTORS
# This is necessary because the next line of code you will run
# requires these variables to be factors. 

baseball$PredictedR <- as.factor(baseball$PredictedR)
baseball$WinsR <- as.factor(baseball$WinsR)

#-------------------------------------------
# CREATE CONFUSION MATRIX
# Create 2x2 chaert that will test your sample size and provide
# some information on the accuracy of the prediction

conf_mat <- caret::confusionMatrix(baseball$PredictedR, baseball$WinsR)
conf_mat

#-------------------------------------------
# CALCULATE THE LOGIT
# need to do more data wrangling to properly create logit
# only want to assess the linearity of the logit with numeric values

baseball1 <- baseball %>% 
  dplyr::select_if(is.numeric)

#-------------------------------------------
# RENAME THE COLUMN NAMES
# for the columns to be fed into predictors

predictors <- colnames(baseball1)

#-------------------------------------------
# CREATE THE LOGIT
# Calculated as the log of the probabilities
# divided by 1, minus the probabilities

baseball1 <- baseball1 %>%
  mutate(logit=log(probabilities/(1-probabilities))) %>%
  gather(key= "predictors", value="predictor.value", -logit)

#-------------------------------------------
# GRAPH LOGIT TO ASSESS FOR LINEARITY

ggplot(baseball1, aes(logit, predictor.value))+
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

logi.hist.plot(baseball$HR.Count,baseball$WinsR, 
               boxp=FALSE, type="hist", col="gray")