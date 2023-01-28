# Load R data sets
library(datasets)
mtcars

# variable `mpg` - car's mileage in miles per gallon
# variable `disp` - engine displacement in cubic inches

# Plot relationship between mpg and disp
d <- ggplot(mtcars, aes(x = disp, y = mpg))
d + geom_point() + geom_smooth(method=lm, se=FALSE)
