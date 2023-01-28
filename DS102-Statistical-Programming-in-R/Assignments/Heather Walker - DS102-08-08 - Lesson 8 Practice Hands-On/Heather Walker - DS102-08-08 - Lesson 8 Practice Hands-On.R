# Load R data sets
library(datasets)
mtcars

# ***********************************************
# variable `hp` - engine horsepower
# variable `qsec` - quarter mile time

# Plot relationship between hp and qsec
d <- ggplot(mtcars, aes(x = hp, y = qsec))

# Add title and improve axis labels:
d + geom_point() + geom_smooth(method=lm, se=TRUE) + ggtitle("1920's Quarter Mile Time vs. Engine Horsepower") +
  xlab("Engine Horsepower") + ylab("Quarter Mile Time (seconds)")

# Compute linear regression with function `lm()`
lin_reg <- lm(hp ~ qsec, mtcars)
print(lin_reg)

# To see all the information stored in linear regression object:
summary(lin_reg)

# this is the equation it's calculating:
# y = mx + b
# y = -27.17x + 631.70

# ***********************************************
# variable `wt` - vehicle weight in thousands of pounds
# variable `qsec` - quarter mile time

# Plot relationship between hp and qsec
d <- ggplot(mtcars, aes(x = wt, y = qsec))

# Add title and improve axis labels:
d + geom_point() + geom_smooth(method=lm, se=TRUE) + ggtitle("1920's Quarter Mile Time vs. Vehicle Weight") +
  xlab("Weight (1,000 pounds)") + ylab("Quarter Mile Time (seconds)")

# Compute linear regression with function `lm()`
lin_reg <- lm(wt ~ qsec, mtcars)
print(lin_reg)

# To see all the information stored in linear regression object:
summary(lin_reg)

# this is the equation it's calculating:
# y = mx + b
# y = -0.09567x + 4.92479
