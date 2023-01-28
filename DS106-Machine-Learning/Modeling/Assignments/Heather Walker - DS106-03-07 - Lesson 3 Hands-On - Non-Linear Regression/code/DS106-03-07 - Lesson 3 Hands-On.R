## DS106-03-07 - Lesson 3 Hands-On - Non-Linear Regression

#-------------------------------------------
# LOAD LIBRARIES

library("ggplot2")

# Libraries suggested from an example
library(dplyr)
# install.packages("patchwork")
library(patchwork) # To display 2 charts together
# install.packages("hrbrthemes")
library(hrbrthemes)

#-------------------------------------------
# LOAD IN DATA

nonlinear = read.csv("data/nonlinear.csv")

#-------------------------------------------
# VIEW DATA

View(nonlinear)


# QUESTION: `What non-linear model would work best for this data?`

#-------------------------------------------
# GRAPH DATA AGAINST A BEST-FIT QUADRATIC LINE - SIDE BY SIDE
# to see if the data is quadratic in nature

nonlinearSet1Graph <- ggplot(nonlinear, aes(x = X1, y=Y1)) + 
  geom_point() + 
  stat_smooth(method = "lm", formula = y ~x + I(x^2), size =1) + 
  theme_ipsum()

nonlinearSet2Graph <- ggplot(nonlinear, aes(x = X2, y=Y2)) + 
  geom_point() + 
  stat_smooth(method = "lm", formula = y ~x + I(x^2), size =1) + 
  theme_ipsum()

# DISPLAY THE PLOTS
# Display both charts side by side thanks to the patchwork package
# example: https://r-graph-gallery.com/line-chart-dual-Y-axis-ggplot2.html

nonlinearSet1 + nonlinearSet2


#-------------------------------------------
# GRAPH DATA TOGETHER (JUST TO SEE)

# must include argument label "data"
nonlinearBoth1 <- ggplot() + 
  geom_point(data = nonlinear, aes(x = X1, y=Y1), color = "blue") + 
  geom_point(data = nonlinear, aes(x = X2, y=Y2), color = "red")

# DISPLAY PLOT
nonlinearBoth1



#--------------------------------------------------------------------
#--------------------------------------------------------------------

# MODEL THE DATA
# Now that you know it is quadratic.
# Need to square the x term first:

X1squared <- nonlinear$X1^2
X2squared <- nonlinear$X2^2


#-------------------------------------------
# NOW USE lm() MODEL THE DATA

X1quadModel <- lm(nonlinear$Y1~nonlinear$X1+X1squared)
X2quadModel <- lm(nonlinear$Y2~nonlinear$X2+X2squared)


#-------------------------------------------
# SUMMARY

summary(X1quadModel)
summary(X2quadModel)

# If the F-statistic and p-value are significant,
# that means the x variable is a significant quadratic predictor
# of the y variable.
