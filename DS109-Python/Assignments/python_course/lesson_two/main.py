my_message = "Hello"
my_other_message = "how are you?"

# concatenate the above variables with a comma in between
my_final_message = my_message + ", " + my_other_message

print(my_final_message)



day = "1"
year = "2017"
month = "August"

today_is = month + " " + day + ", " + year

print(today_is)



day = 1
year = 2017
month = "August"

today_is = month + " " + day + ", " + year

print(today_is)



day = 1
year = 2017
month = "August"

today_is = month + " " + str(day) + ", " + str(year)

print(today_is)



day = 1
year = 2017
month = "August"

today_is = str.format("The date is {} {}, {} ", month, day, year)

print(today_is)



day = 1
year = 2017
month = "August"

today_is = str.format("The date is {}, {} {} ", year, month, day)

print(today_is)



experience = "this game is fun"
better_experience = experience.replace("fun", "awesome")

print(experience)
print(better_experience)



message = "I like cats, because cats are friendly"
new_message = message.replace('cats', 'dogs')

print(new_message)



my_message = "Split these words for me"
split_at_spaces = my_message.split()

print(split_at_spaces)



my_message = "apples,oranges,bananas"
split_at_commas = my_message.split(",")

print(split_at_commas)



# expressions within parentheses are evaluated first
result = (5 * 2) + (4 * 2)
print(result)
# after simplifying the expressions within the parentheses...
# result = (10) + (8) = 18

# ---

# do you understand how the final result, below, is computed?
result = 2 ** 3 * (5 - (3 - 2)) / 4 + 9 // 4
print(result)
# result = 8 * (4) / 4 + 2 = 8 * 1 + 2 = 10.0



a = 15
b = 5
c = 0

c = a + b
print("1. C =", c)

c += a
print("2. C =", c)

c *= a
print("3. C =", c)

c /= a
print("4. C =", c)

c %= a
print("5. C =", c)

c //= b
print("6. C =", c)

c = 2
c **= a
print("7. C =", c)



my_burger_price = 15

is_fifteen_dollars = my_burger_price == 15
# is_fifteen_dollars = `True` - price equals 15

is_not_twenty_dollars = my_burger_price != 20
# is_not_twenty_dollars = `True` - price does not equal 20

is_affordable = my_burger_price <= 10
# is_affordable = `False` - price is NOT less than or equal to 10

is_pricey = my_burger_price >= 15
# is_pricey = `True` - price is greater than or equal to 15

your_burger_price = 20

my_burger_costs_more = my_burger_price > your_burger_price
# my_burger_costs_more = `False` - your price is greater than mine

my_burger_costs_less = my_burger_price < your_burger_price
# my_burger_costs_less = `True` - my price is less than yours




# details of the person who wants to watch the movie
person_age = 17
person_money = 25

# the requirements to watch the movie
age_restriction = 18
movie_price = 10

# conditions
is_old_enough = person_age >= age_restriction
has_enough_money = person_money >= movie_price

# two conditions combined using 'and'
can_watch_movie = is_old_enough and has_enough_money
print(can_watch_movie)

# the output is False, because the person's age is less than the required age


######################################################
# DS109-02-14 - Review questions

# Question 4
10 % 3

# Question 6
9 // 2

######################################################
######################################################
# DS109-02-15 - Activity

# Task 1
# Create variables `a` and `b`
# Set `a` to 2, set `b` to 5.
a = 2
b = 5

# Task 2
# Subtract `b` from `a` and assign result to `c`
a = 25
b = 19
c = a - b
print(c)


# Task 3
# Add `a` to `b` and assign the result to `c`
a = 5
b = 7
c = a + b
print(c)



######################################################
######################################################
# DS109-02-16 - Indentation

my_message = "Hello World"
  print(my_message)



######################################################
######################################################
# DS109-02-17 - Decision Making

person_money = 12

if person_money >= 10:
  print("This person can watch the movie")



person_money = 8

if person_money >= 10:
  print("This person can watch the movie")



person_money = 8

if person_money >= 10:
  print("This person can watch the movie")
else:
  print("Sorry, but you don't have enough money")



person_age = 18

if person_age >= 18:
  print("I can watch an R-rated movie")
elif person_age >= 13:
  print("I can watch a PG13-rated movie")
else:
  print("I can watch a G-rated movie")



person_age = 18

if person_age >= 13:
  print("I can watch a PG13-rated movie")
elif person_age >= 18:
  print("I can watch an R-rated movie")
else:
  print("I can watch a G-rated movie")



person_age = 5

if person_age >= 18:
  print("I can watch an R-rated movie")
elif person_age >= 13:
  print("I can watch a PG13-rated movie")
else:
  print("I can watch a G-rated movie")



######################################################
######################################################
# DS109-02-18 - Multiple Decision Making Blocks per variable

person_age = 16

# first if/elif/else block
if person_age >= 18:
  print("I can watch an R-rated movie")
elif person_age >= 13:
  print("I can watch a PG13-rated movie")
else:
  print("I can watch a G-rated movie")

# second if/else block
if person_age >= 16:
  print("I can drive!")
else:
  print("I need to walk")



person_age = 18

if person_age >= 18:
  print("I can watch an R-rated movie")
  print("I can drive!")
elif person_age >= 16:
  print("I can watch a PG13-rated movie")
  print("I can drive!")
else:
  print("I need my mommy")



person_age = 15
has_car = False
mom_can_drive = True
outcome = ""

if person_age >= 18 and has_car:
  outcome = "I can go and see an R-rated movie"
elif person_age >= 13 and mom_can_drive:
  outcome = "Mom can take me to see a PG13-rated movie"
else:
  outcome = "I'm stuck at home today"

print(outcome)



person_age = 18
has_car = True
mom_can_drive = True
outcome = ""

if person_age >= 18 and has_car:
  outcome = "I can go and see an R-rated movie"
elif person_age >= 13 and mom_can_drive:
  outcome = "Mom can take me to see a PG13-rated movie"
else:
  outcome = "I'm stuck at home today"

print(outcome)