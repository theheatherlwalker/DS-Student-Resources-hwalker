# 0. load `rivers` dataset:
library(datasets)
rivers

# HISTOGRAM *******************************************************************

# 1. build a data frame with the `rivers` data set:
rr = data.frame(rivers)

# 2. View the first 6 rows of the data frame:
View(rr)

# 3. create a histogram with commands:
histogram.rivers <- ggplot(rr, aes(x = rivers))
histogram.rivers + geom_histogram()

# What is a good bin width?
# **************************
# 3.a. Number of data points: use `length()` to see how many rivers:
length(rivers) = number.rivers

# 3.b. Number of bins: take square root of number of data points
#      round up with command `ceiling()`
number.bins <- ceiling(sqrt(number.rivers))

# 3.c. Bin width: divide the range by the number of bins:
range.rivers <- max(rivers) - min(rivers)
bin.width <- ceiling(range.rivers/number.bins)

# Bin width should be `298`
histogram.rivers + geom_histogram(binwidth = 298)

# Make it look nicer
# ******************
histogram.rivers + geom_histogram(binwidth = 298, fill = "skyblue3", color = "dodgerblue4") +
  ggtitle("Major North American Rivers") + xlab("Length (in miles)") + ylab("Number of Rivers")


# BOX PLOT *******************************************************************

# no `x=` except empty quotes
# put the variable you want to plot under `y=`
box.rivers <- ggplot(rr, aes(x = "", y = rivers))
box.rivers + geom_boxplot() + xlab("")

# Mathematically screen for outliers:
summary(rr$rivers)
# Calculate IQR:
iqr <- 680 - 310
# multiply IQR by 1.5:
outlier.range <- iqr * 1.5
# calculate outliers:
680 + outlier.range
310 - outlier.range

# How many rivers are outside the upper outlier?
outliers.high <- rr[rr > 1235]
length(outliers.high)
print(outliers.high)
summary(outliers.high)

# NORMAL PROBABILITY PLOT ****************************************************

# create a normal probability plot
ggplot(rr, aes(sample = rivers)) + geom_qq()



