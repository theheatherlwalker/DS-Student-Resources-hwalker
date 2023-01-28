# loading R's built-in data sets
library(datasets) 
View(mtcars) # to view in RStudio as a table.

# call ggplot2 to use
library(ggplot2)

# create box plot of `mpg` grouped by `cyl`.
ggplot(mtcars, aes(x = cyl, y = mpg)) + 
  geom_boxplot(aes(group=cyl)) +
  # make the plot look better
  ggtitle("Select 1973-74 Cars from U.S.") + xlab("Number of Engine Cylinders") + ylab("Miles per Gallon (mpg)")

# summarize count of cars by group: 4 cyl, 6 cyl, and 8 cyl.
mtcars %>% group_by(cyl) %>% summarize(count = n())