# Load data
install.packages("DAAG") # need to install the package first
library(DAAG) # call the library
View(greatLakes) # to view in RStudio as a table.

# Create vectors
erie <- greatLakes[,1]
huron <- greatLakes[,2]

# Create hypothesis test
# null hypothesis : \mu1 = \mu2
# alternative hypothesis :  \mu1 \neq \mu2

# Run t-test
t_ind <- t.test(erie, huron, alternative="two.sided", var.equal=FALSE)
print(t_ind)

# p-value is < 0.05, so REJECT null hypothesis.