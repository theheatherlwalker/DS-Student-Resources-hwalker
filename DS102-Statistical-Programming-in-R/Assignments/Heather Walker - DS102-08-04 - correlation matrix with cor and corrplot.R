# Install and load PerformanceAnalytics library
install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")


# limit to quantitative, continous variables with subsetting
# this keeps all rows and only the 1st 7 columns
mtcars_quant <- mtcars[, c(1,2,3,4,5,6,7)]

# need to turn data into correlation matrix
# because `corrplot` will not take data frame as argument
corr_matrix <- cor(mtcars_quant)
corr_matrix

# Install and call library `corrplot`
install.packages("corrplot")
library("corrplot")

# Create visually pleasing correlation matrix plot
corrplot(corr_matrix, type="upper", order="hclust", p.mat = corr_matrix, sig.level = 0.01, insig="blank")

# To choose the lower part of the correlation matrix
corrplot(corr_matrix, type="lower", order="hclust", p.mat = corr_matrix, sig.level = 0.01, insig="blank")

