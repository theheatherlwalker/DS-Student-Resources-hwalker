library(readxl)
babies <- read_excel("Documents/GitHub/DS-Student-Resources/DS104-Data-Wrangling-and-Visualization/Assignments/Heather Walker - DS104-01 Examples/babies.xlsx")
View(babies)

# Add new blank column named `Footprint`
babies$Footprint = " "

# DS104-01-04 - Renaming Columns
# Rename a column, `==` indicates original variable/column name
names(babies)[names(babies) == "ParentPhoneNumber"] <- "Phone"

# DS104-01-06 - Combining Columns
# To combine columns with `unite` function, need to import `tidyr` package
install.packages("tidyr")
library("tidyr")

# Specify name of the new dataset and original dataset
babies1 <- unite(babies, Address, StreetAddress, City, Zipcode, sep = "/")

# DS104-01-07 - Separating Columns
# Separate columns for `Address` column
babies2 <- separate(babies1, Address, c("StreetAddress", "City", "Zipcode"), sep="/")

