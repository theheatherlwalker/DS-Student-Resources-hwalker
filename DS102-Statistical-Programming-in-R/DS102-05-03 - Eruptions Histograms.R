# load dataset: faithful --
# I did this previously, but good practice to include it.
library(datasets)
faithful

# `faithful` is a data frame with 2 columns, one is `eruptions`
# create a histogram:
# (made redundant in next step)
# faithful_histogram <- ggplot(faithful, aes(x = eruptions))
# faithful_histogram + geom_histogram()

# create a vector of bin boundaries (==sometimes called breaks==)
# pass the vector as the breaks argument to `geom_histogram`
# create bins with width of `0.2`:
faithful_histogram + geom_histogram(breaks = seq(1.4, 5.2, by = 0.2))

# The waiting times for the Old Faithful data are in the column labeled waiting.
# You set up a histogram of these times with the following call to ggplot():
waiting_histogram <- ggplot(faithful, aes(x = waiting))
# bins whose width is 3 minutes:
waiting_histogram + geom_histogram(binwidth = 3)

