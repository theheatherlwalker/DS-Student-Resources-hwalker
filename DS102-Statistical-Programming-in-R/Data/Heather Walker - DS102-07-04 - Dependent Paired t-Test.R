# Import the data
# read from path (instead of changing working directory)
file <- "/Users/heather/Documents/GitHub/DS-Student-Resources/DS102-Statistical-Programming-in-R/scores.csv"

# Read the data into a data frame
scores <- read.csv(file)
head(scores) # prints the first 6 rows

# Perform t-test on the 2 samples
t_dep <- t.test(scores$postest, scores$pretest, paired = TRUE)
t_dep

# Graphing data for the dependent t-test
# will need to specify variables used in melt()
library(reshape2) # call library
ss <- melt(scores, measure.vars = c("pretest", "postest"))

# Make box plots of pretest and postest data values
library(ggplot2) # call ggplot2
ggplot(ss) + geom_boxplot(aes(x = variable, y = value)) +
  xlab("Test") + ylab("Score")

# Another way to graph
# compute difference between postest and pretest for each student
# graph on histogram
dd <- scores$postest - scores$pretest
df <- data.frame(dd)
ggplot(df, aes(x = dd)) + geom_histogram(binwidth = 1) +
  xlab("Difference between postest and pretest")