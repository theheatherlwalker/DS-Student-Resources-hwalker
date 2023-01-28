# Call library of R data sets
library(datasets)
cars

# look at first 6 rows of `cars`
head(cars)

# Compute linear regression with function `lm()`
lin_reg <- lm(dist ~ speed, cars)
print(lin_reg)
# this is the equation it's calcuating:
# y = 3.932x -17.579

# To see all the information stored in linear regression object:
summary(lin_reg)

# Predict value --
# For 1920's car going 21 mph, what is the stopping distance?
# y = mx + b
# y = 3.93 * 21 - 17.57
# y = 64.99

# create scatter plot of speed vs. stopping distance 
# include a best fit line using `method=lm`
d <- ggplot(cars, aes(x = speed, y = dist))
d + geom_point() + geom_smooth(method=lm, se=FALSE)

