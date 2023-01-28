# load the data
library(readxl) # needed to read excel document
energy <- read_excel("/Users/heather/Documents/GitHub/DS-Student-Resources/DS104-Data-Wrangling-and-Visualization/Assignments/Heather Walker - DS104-02-03 - Transformations in R/data/energy.xlsx")
View(energy)

# needed for flip command `t()`
library(tidyr) 

# transposing the data
energy1 <- t(energy)
View(energy1) # view the result

# turn it back into data frame with `as.data.frame()`
energy2 <- as.data.frame(energy1)
View(energy2) # view the result
class(energy2) # confirm that `energy2` is a data frame
