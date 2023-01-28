# not included in example
# but good practice:
# installs the package "ggplot2"
install.packages("ggplot2")
# makes the package "ggplot2" usable in R
library("ggplot2")

# 1. create vector of height data assigned to variable `heights`:
height <- c(171, 192, 183, 177, 154, 176)

# 2. create a *data frame* from height:
height_df <- data.frame(height)

# 3. create a histogram with commands:
h <- ggplot(height_df, aes(x = height))
# example in lesson did not include print(): h + geom_histogram()
print(h + geom_histogram())

# Add bins
# made redundant in next step
# h + geom_histogram(binwidth = 10)

# Add title and labels
# made redundant in next step
# h + geom_histogram(binwidth = 10) +
# ggtitle("Histogram of Heights") +
# xlab("Height (in cm)")

# Add Relative frequency
# made redundant in next step
#h + geom_histogram(binwidth = 10, aes(y = ..count../sum(..count..))) +
#  ggtitle("Histogram of Heights") + xlab("Height (in cm)") +
#  ylab("Relative frequency")

# Add Color
h + geom_histogram(binwidth = 10, fill = "goldenrod", color = "deepskyblue4") +
  ggtitle("Histogram of Heights") + xlab("Height (in cm)")
