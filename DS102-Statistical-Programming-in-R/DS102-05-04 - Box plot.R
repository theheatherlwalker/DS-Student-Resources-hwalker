# `cars` is another data set included in R
# view data set `cars` as spreadsheet:
View(cars)

# Call ggplot2 before you can graph
library(ggplot2)

# no `x=` except empty quotes
# put the variable you want to plot under `y=`
d <- ggplot(cars, aes(x = "", y = dist))
d + geom_boxplot() + xlab("")

# use `summary` function to compute all the values (plus the `mean`)
# specify the variable in the data frame that your interested in using
# with the dollar sign `$` AFTER the dataset name.
summary(cars$dist)
