






# PART 1
####################################################

# create a list called `list_of_names`
# containing: "Kurt" "David" "Katherine"
list_of_names = [ "Kurt", "David", "Katherine" ]

# print "Where is ____ today?" for each name
for name in list_of_names:
	print( "Where is " + name + " today?")



# PART 2
####################################################

# Create list variable with 3 different cars
my_favorite_cars = [ "Canoo van", "Mini Cooper", "Lexus CT 200h" ]

# Create list variable with 4 different flowers
my_favorite_flowers = [ "rose", "honeysuckle", "daffodil", "morning glory" ]

# Create list variable with 5 different animals
my_favorite_animals = [ "dog", "cat", "bird", "horse", "miniature donkey" ]


# Concatenate all 3 lists variables
my_favorite_things = my_favorite_cars + my_favorite_flowers + my_favorite_animals

# Use a `for` loop to print out items in the list with an even number of letters
for thing in my_favorite_things:
    if len(thing) % 2 == 0:
        print(thing)
        continue

# print( "The loop is over." )



# PART 3
####################################################

# Create a list with numbers from 1 - 20
number_range = list(range(1,21))
# printing list and adding line breaks
print(number_range, end='\n\n')

# Loop through the list and print the number
# when it meets the specified criteria
for number in number_range:
    if (number % 3 == 0) and (number % 5 == 0):
        print("ZipZap")
    elif (number % 3 == 0):
        print("Zip")
    elif (number % 5 == 0):
        print("Zap")
    else:
        print(number)
