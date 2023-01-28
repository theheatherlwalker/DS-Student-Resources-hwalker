library(ggplot2)

library(lattice)

# import dataset
# NOTE: Set Working Directory to Project Folder
HR_data = read.csv('data/HR_data.csv')

# plot with ggplot
ggplot(HR_data, aes(salary))+ 
  geom_bar() +
  ggtitle("Frequency of Salary") +
  xlab("Salary Category") +
  ylab("Frequency")

# plot with lattice
barchart(HR_data$salary)

# caution: variable must be a factor in order to use `barchart()`
barchart(HR_data$Work_accident)

# changing details of the plot
barchart(HR_data$salary, main="Frequency of Salary", 
         ylab = "Salary Category", xlab = "Frequency", 
         col="green")

############################################################
# DS104-04-08 - Stacked Bar Charts in R

# stacked bar chart
ggplot(data=HR_data) +
  geom_bar(mapping = aes(x = sales, fill=salary)) + 
  ggtitle("Sales Categories by Salary Level") +
  xlab("Sales Category") +
  ylab("Frequency")

# making bar heights the same
ggplot(data=HR_data) +
  geom_bar(mapping = aes(x = sales, fill=salary), position = "fill") + 
  ggtitle("Sales Categories by Salary Level") +
  xlab("Sales Category") +
  ylab("Frequency")  


############################################################
# DS104-04-14 - Line Charts in R

# import dataset
# NOTE: Set Working Directory to Project Folder
earthquakes = read.csv('data/earthquakes.csv')

# find the structure of the data
str(earthquakes)
# M is "chr"

# use `as.numeric()` to use `M` as numeric instead of factor
earthquakes$M <- as.numeric(earthquakes$M)

# find the structure of the data
str(earthquakes)
# M is now a "str"

# plotting with Date as date
ggplot(earthquakes, aes(as.Date(Date, "%j-%b-%y"), M)) +
  geom_line() + 
  xlab("Date of Earthquake") + 
  ylab("Earthquake Magnitude") + 
  ggtitle("Magnitude of Earthquakes over Time")

