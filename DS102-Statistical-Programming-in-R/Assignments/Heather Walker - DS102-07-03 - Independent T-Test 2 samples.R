# Import the data
# the needed .csv is already in the GitHub folder
# read from path (instead of changing working directory)
file <- "/Users/heather/Documents/GitHub/DS-Student-Resources/DS102-Statistical-Programming-in-R/Data/frostedflakes.csv"
frostedflakes <- read.csv(file)

# View the first 6 rows of data frame
head(frostedflakes)

# Create hypothesis test
# null hypothesis : \mu1 = \mu2
# alternative hypothesis :  \mu1 \neq \mu2

# Run t-test
t_ind <- t.test(frostedflakes$Lab, frostedflakes$IA400, alternative="two.sided", var.equal=FALSE)
print(t_ind)

# Graphing data for an independent t-test
# one column needs to be data values
# the other column needs to be variable choice
# use melt() to combine
library(reshape2)
ff <- melt(frostedflakes, id="X")
head(ff)

# Create the box plot
ggplot(ff) + geom_boxplot(aes(x = variable, y = value)) +
  xlab("Test Method") + ylab("Percentage of Sugar")

