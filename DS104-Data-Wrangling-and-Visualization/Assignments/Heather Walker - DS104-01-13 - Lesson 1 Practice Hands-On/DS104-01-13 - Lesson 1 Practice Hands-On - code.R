# DS104-01-13 - Lesson 1 Practice Hands-On
# Heather Walker - 2022-10-05

# Import the dataset
FakeNews <- read.csv("~/Documents/GitHub/DS-Student-Resources/DS104-Data-Wrangling-and-Visualization/Assignments/Heather Walker - DS104-01-13 - Lesson 1 Practice Hands-On/data/FakeNews.csv")

# take a look at dataset in View()
View(FakeNews)

# 1. Add a column labeled `StoryType` and fill it with `Fake`
FakeNews$StoryType = "Fake"

# 2. Remove the `when` column
FakeNews2 = subset(FakeNews, select = -c(when))

# View the new dataframe
View(FakeNews2)

# 3. Separate the `url` column to a website column and domain column
library(tidyr) # NOTE: will need to call library `tidyr`to use `sep=`
FakeNews2 <- separate(FakeNews2, url, c("Website", "Domain"), sep="_/")

# 4. Put back together the domain column.
FakeNews3 <- unite(FakeNews2, FullUrl, Website, Domain, sep = "_/")
View(FakeNews3)

# 5. Keep only the first 10 rows of data.
FakeNews4 <- FakeNews3[1:10,]

# View the final dataframe
View(FakeNews4)