# DS106-01-01 Regression Setup in R

# Installing necessary packages
install.packages("car")
install.packages("caret")
install.packages("gvlma")
install.packages("predictmeans")
install.packages("e1071")
install.packages("lmtest")

# Load the packages
library("car")
library("caret")
library("gvlma")
library("predictmeans")
library("e1071")
library("lmtest")

manatee = read.csv("data/manatees.csv")

### Testing for Linearity
scatter.smooth(x=manatees$PowerBoats, y=manatees$ManateeDeaths, main="Manatee Deaths by Power Boats")

### Create a linear model
lmMod <- lm(ManateeDeaths~PowerBoats, data=manatees)

### Test for Homoscedasticity
par(mfrow=c(2,2))
plot(lmMod)

### Another test for Homoscedasticity
lmtest::bptest(lmMod)

### Non-Constant Variance test:
car::ncvTest(lmMod)

### Box-Cox transformation
distBCMod1 <- caret::BoxCoxTrans(manatees$ManateeDeaths)
print(distBCMod1)

# binding to dataset
manatees <- cbind(manatees, dist_newM=predict(distBCMod1, manatees$ManateeDeaths))

# create new linear model and run Breush-Pagan test
lmMod_bc2 <- lm(dist_newM~PowerBoats, data=manatees)
lmtest::bptest(lmMod_bc2)


### GVLMA Library for Assumptions
gvlma(lmMod_bc2)

### Screening for Outliers X space
# Cook's Distance
CookD(lmMod, group=NULL, plot=TRUE, idn=3, newwd=FALSE)

#Leverage
lev = hat(model.matrix(lmMod))
plot(lev)

manatees[lev>.2,]

### Screening for Outliers in Y space
# studentized deleted residual
car::outlierTest(lmMod)

### Screening for Outliers in x and y space
summary(influence.measures(lmMod))