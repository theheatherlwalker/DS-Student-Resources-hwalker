# Install and load PerformanceAnalytics library
install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")

# limit to quantitative, continous variables with subsetting
# this keeps all rows and only the 1st 7 columns
mtcars_quant <- mtcars[, c(1,2,3,4,5,6,7)]

# Create correlation matrices
# call the function with data frame name, graph type,
# and method (type of correlation)
chart.Correlation(mtcars_quant, histogram=FALSE, method="pearson")



