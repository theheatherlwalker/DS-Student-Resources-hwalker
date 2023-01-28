# Import the data
# the needed .csv is already in the GitHub folder
# read from path (instead of changing working directory)
file <- "/Users/heather/Documents/GitHub/DS-Student-Resources/DS102-Statistical-Programming-in-R/Data/frostedflakes.csv"
data <- read.csv(file)

# View the first 6 rows of data frame
head(frostedflakes)

# Create hypothesis test
# null hypothesis : \mu = 37
# alternative hypothesis :  \mu \neq 37

# Run t-test
t_obj <- t.test(frostedflakes$Lab, mu = 37)
print(t_obj)

# Graph this t-test:
d <- ggplot(frostedflakes, aes(x = Lab))
d + geom_histogram(binwidth = 1) +
  geom_vline(xintercept = t_obj$conf.int[1], color = "red") +
  geom_vline(xintercept = t_obj$conf.int[2], color = "red") +
  geom_vline(xintercept = t_obj$null.value, color = "green")

# Check to see if Lab variable is normal
# Use normal probability plot
ggplot(frostedflakes, aes(sample = Lab)) + geom_qq()