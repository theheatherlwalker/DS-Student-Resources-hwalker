# Install (1x per computer) and load (each session):
library(ggplot2)

# Create a scatter plot with 
# x-axis: eruptions and y-axis: waiting
d <- ggplot(faithful, aes(x = eruptions, y = waiting))
d + geom_point()

# Add title and improve axis labels:
d + geom_point() + ggtitle("Old Faithful Eruption vs Waiting Times") +
  xlab("Eruption Time (min)") + ylab("Wating Time (min)")

# Add a *best fit* line with `geom_smooth` with method lm (linear model)
d + geom_point() + geom_smooth(method=lm)

# If you don't want to include the grey *confidence region* around the line:
d + geom_point() + geom_smooth(method=lm, se=FALSE)

# Add some color:
d + geom_point() + geom_smooth(method=lm, se=FALSE, color = "goldenrod2")