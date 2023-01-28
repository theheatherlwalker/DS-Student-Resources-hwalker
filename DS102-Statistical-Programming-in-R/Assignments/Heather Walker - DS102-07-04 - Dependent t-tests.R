# Import the data
# the needed .csv is already in the GitHub folder
# read from path (instead of changing working directory)
file_scores <- "/Users/heather/Documents/GitHub/DS-Student-Resources/DS102-Statistical-Programming-in-R/scores.csv"
scores <- read.csv(file_scores)

head(scores)

t_dep <- t.test(scores$postest, scores$pretest, paired = TRUE)
t_dep

# graph the data for the dependent t-test

# reshape data with melt()
library(reshape2)
scores_shaped <- melt(scores, measure.vars = c("pretest", "postest"))

# Create a box plot
ggplot(scores_shaped) + geom_boxplot(aes(x = variable, y = value)) +
  xlab("Test") + ylab("Score")
