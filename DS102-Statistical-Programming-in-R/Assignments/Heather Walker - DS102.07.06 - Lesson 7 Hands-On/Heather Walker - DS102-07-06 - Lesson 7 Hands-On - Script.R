# loading R's built-in data sets
library(datasets) 
nhtemp

# Create 2 vectors
first25 <- nhtemp[1:25]
last25 <- nhtemp[36:60]

# Create hypothesis test


# Compute Dependent t-test on the 2 samples
t_dep <- t.test(first25, last25, paired = TRUE)
t_dep