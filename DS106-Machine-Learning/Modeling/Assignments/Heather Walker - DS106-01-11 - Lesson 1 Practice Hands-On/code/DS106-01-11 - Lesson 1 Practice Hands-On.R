# DS106-01-11 - Lesson 1 Practice Hands-On

# Load the packages
library("car")
library("caret")
library("gvlma")
library("predictmeans")
library("e1071")
library("lmtest")

heights = read.csv("data/heights.csv")

# View the data
View(heights)

### Testing for Linearity
scatter.smooth(x=heights$AM_Height, y=heights$PM_Height, main="Height Change Between Morning and Evening")

### Create a linear model
lmMod <- lm(AM_Height~PM_Height, data=heights)

### Test for Homoscedasticity
par(mfrow=c(2,2))
plot(lmMod)

### Another test for Homoscedasticity
lmtest::bptest(lmMod)

### Non-Constant Variance test:
car::ncvTest(lmMod)

### Box-Cox transformation
distBCMod1 <- caret::BoxCoxTrans(heights$PM_Height)
print(distBCMod1)

# binding to dataset
heights <- cbind(heights, dist_newM=predict(distBCMod1, heights$PM_Height))

# create new linear model and run Breush-Pagan test
lmMod_bc2 <- lm(dist_newM~AM_Height, data=heights)
lmtest::bptest(lmMod_bc2)


### GVLMA Library for Assumptions
gvlma(lmMod_bc2)

### Screening for Outliers X space
# Cook's Distance
CookD(lmMod, group=NULL, plot=TRUE, idn=3, newwd=FALSE)

#Leverage
lev = hat(model.matrix(lmMod))
plot(lev)

heights[lev>.2,]

### Screening for Outliers in Y space
# studentized deleted residual
car::outlierTest(lmMod)

### Screening for Outliers in x and y space
summary(influence.measures(lmMod))