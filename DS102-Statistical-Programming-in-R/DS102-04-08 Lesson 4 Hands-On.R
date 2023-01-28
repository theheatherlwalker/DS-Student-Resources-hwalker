# define variable eruption.times:
eruption.times <- faithful$eruptions

# split eruption.times with 2 logical condition:
short <- eruption.times[eruption.times <= 3]
long <- eruption.times[eruption.times > 3]

# find summary statistics of vectors --
# number of samples per vector:
length(short)
cat("Number of samples in short:", length(short), "\n")
length(long)
cat("Number of samples in long:", length(long), "\n")

# mean of vectors:
mean(short)
cat("Mean of short:", mean(short), "\n")
mean(long)
cat("Mean of long:", mean(long), "\n")

# standard deviation of vectors:
sd(short)
cat("Standard Deviation of short:", sd(short), "\n")
sd(long)
cat("Standard Deviation of long:", sd(long), "\n")