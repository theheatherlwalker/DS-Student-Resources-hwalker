# create a normal probability plot
# use eruption times from faithful dataset
ggplot(faithful, aes(sample = eruptions)) + geom_qq()

# create a normal probability plot
# use `Speed` samples from the `morley` data set
# (it IS a normally distributed data set)
ggplot(morley, aes(sample = Speed)) + geom_qq()
