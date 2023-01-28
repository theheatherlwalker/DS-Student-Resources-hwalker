# load the data
library(readxl) # needed to read excel document
zikaColumbia <- read_excel("/Users/heather/Documents/GitHub/DS-Student-Resources/DS104-Data-Wrangling-and-Visualization/Assignments/Heather Walker - DS104-02-12 - Combingin in R/data/ZikaColombia.xlsx")
zikaUS <- read_excel("/Users/heather/Documents/GitHub/DS-Student-Resources/DS104-Data-Wrangling-and-Visualization/Assignments/Heather Walker - DS104-02-12 - Combingin in R/data/ZikaUS.xlsx")

# view the data
View(zikaColumbia)
View(zikaUS)

# append the 2 datasets because there are no overlapping pieces of data
zikaCombined <- rbind(zikaColumbia, zikaUS)

# view the result
View(zikaCombined)