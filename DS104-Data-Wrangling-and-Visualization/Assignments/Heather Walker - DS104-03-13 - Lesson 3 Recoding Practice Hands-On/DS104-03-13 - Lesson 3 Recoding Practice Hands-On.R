#####################################################################
# Part 1: Recoding in Python
# install/import needed packages
# install.packages("fastDummies")
library("fastDummies")

# import dataset
# NOTE: Set Working Directory to Project Folder
eatingHabits = read.csv('data/Eating_Habits.csv')

# view dataset
View(eatingHabits)

#####################################################################
# 2.1  Recode `Activity` into a new variable called `JunkFood`. 
# Anything that you would consider junk food, recode as a 1.
# Everything else should be recoded as a 0.

# find unique values to confirm syntax of entries
eatingHabitsUnique <- unique(eatingHabits$Activity)
print(eatingHabitsUnique)

# create empty column for new variable
eatingHabits$JunkFood <- NA

# recode as JunkFood as 1, everything else as 0
eatingHabits$JunkFood[eatingHabits$Activity=="Eating fruit"] <- 0
eatingHabits$JunkFood[eatingHabits$Activity=="Eating raw vegetables"] <- 0
eatingHabits$JunkFood[eatingHabits$Activity=="Eating candy, chocolate bars"] <- 1
eatingHabits$JunkFood[eatingHabits$Activity=="Eating potato chips, crisps"] <- 1
eatingHabits$JunkFood[eatingHabits$Activity=="Eating french fries"] <- 1
eatingHabits$JunkFood[eatingHabits$Activity=="Eating hamburgers, hot dogs or sausages"] <- 1
eatingHabits$JunkFood[eatingHabits$Activity=="Eating peanuts"] <- 0
eatingHabits$JunkFood[eatingHabits$Activity=="Eating whole wheat or rye bread"] <- 0
eatingHabits$JunkFood[eatingHabits$Activity=="Drinking soft drinks, cola or other drinks with sugar"] <- 1
eatingHabits$JunkFood[eatingHabits$Activity=="Drinking coffee"] <- 0
eatingHabits$JunkFood[eatingHabits$Activity=="Drinking low fat milk"] <- 0
eatingHabits$JunkFood[eatingHabits$Activity=="Drinking whole milk"] <- 0

# view result
View(eatingHabits)

#####################################################################
# 2.2  Recode `Sex` from text to numbers in the same variable.

# recode back into same variable
eatingHabits$Sex[eatingHabits$Sex=='Males'] <- 0 
eatingHabits$Sex[eatingHabits$Sex=='Females'] <- 1 

# view result
View(eatingHabits)
