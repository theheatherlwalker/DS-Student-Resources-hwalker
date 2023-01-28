
# DS109-02-20 - Operators Hands-On
#####################################################

# Part 1
#####################################################
# Create variables for your birthday as strings
# Print with format: November 11, 1991
day = "22"
month = "December"
year = "1985"

my_birthday = month + " " + day + ", " + year

print(my_birthday)



# Part 2
#####################################################
# Output should be: HAPPY BIRTHDAY TO YOU
first = "happy"
second = "birthday"
third = "to"
fourth = "you"

final = first + " " + second + " " + third + " " + fourth

print(final.upper())



# Part 3
#####################################################
# If under the age of 10, print `Not permitted`
# If under the age of 15, print `Permitted with a parent`
# If under the age of 18, print `Permitted with anyone over 18`
# If 18 or over, print `Permitted to attend alone`

age = 15

if age < 10:
  print("Not permitted.")
elif age < 15:
  print("Permitted with a parent.")
elif age < 18:
  print("Permitted with anyone over 18.")
elif age >= 18:
  print("Permitted to attend alone.")
else:
  print("Error.")

