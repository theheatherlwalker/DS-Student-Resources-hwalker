# Call library
library(datasets)
mtcars

# Test for correlation
cor.test(mtcars$hp, mtcars$cyl, method="pearson", use = "complete.obs")
