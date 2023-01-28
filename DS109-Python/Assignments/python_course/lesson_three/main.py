####################################################
####################################################
# DS109-03-03 - Python Lists

my_message = "Split these words for me"
split_at_spaces = my_message.split()
print(split_at_spaces)



####################################################
####################################################
# DS109-03-04 - Creating a List

another_variable = "Hello world"
my_list = ["String", 3, 7.5, another_variable]

print(my_list)



planets = ['Earth', 'Mars', 'Saturn', 'Venus']
print(planets)



numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(numbers)



name = "Heather"
birthday = "12/22/1985"
favorite_color = "blue"
Heather = [ name, birthday, favorite_color ]
print(Heather)


####################################################
####################################################
# DS109-03-05 - Creating a List Activity

# Create a variable `states` with the specified states.
states = [ "California", "Texas", "Florida", "New York" ]



####################################################
####################################################
# DS109-03-06 - Nested and Empty Lists

# Example of Nested Lists
our_world = ['Earth', ['United States', 'Canada', 'Mexico'], [1, 2, 3]]
print(our_world)


# Example of Empty List
my_empty_list = []



####################################################
####################################################
# DS109-03-07 - Tuples

my_tuple = ('doctor', 'nurse', 'PA')
print(my_tuple)


# Example of empty tuple
empty_tuple = ()


# Tuple with only 1 item
one_item_tuple = ('just me',)
print(one_item_tuple)


# Mixed dateype tuple

# you've already seen a string tuple
string_tuple = ("this", "contains", "string", "values")

# you can, of course, create tuples with numbers
number_tuple = (23, 23.5, 9, 144)

# like lists, you can create tuples with a mix of types
mixed_tuple = ("Bob", 33, "Sally", 29, "Spike", 8)



####################################################
####################################################
# DS109-03-08 - Create a Tuple Activity

# Create a tuple named `items`
items = ( "widget", [ "white", "black", "brown" ], 25 )



####################################################
####################################################
# DS109-03-09 - Lists and Tuples Indexing

colors_list = ['red', 'green', 'blue', 'yellow']
num_colors = len(colors_list)
print(num_colors)



# print the third item of the list
colors_list = ['red', 'green', 'blue', 'yellow']
print(colors_list[2])

# print the second item of the tuple
numbers_tuple = (22, 33, 44, 55)
print(numbers_tuple[1])



# print the last item of the list
colors_list = ['red', 'green', 'blue', 'yellow']
print(colors_list[-1])

# print the last item of the tuple
numbers_tuple = (22, 33, 44, 55)
print(numbers_tuple[-1])



colors_list = ['red', 'green', 'blue', 'yellow']

# access the last item with index `-1`
first_from_end = colors_list[-1]

# access the next-to-last item with index `-2`
second_from_end = colors_list[-2]

# access the second from the last item with index `-3`
third_from_end = colors_list[-3]

print(first_from_end)
print(second_from_end)
print(third_from_end)



colors_list = ['red', 'green', 'blue', 'yellow']

# get the first three items
first_three_items = colors_list[0:3]

# get the middle two items
middle_two_items = colors_list[1:3]

print(first_three_items)
print(middle_two_items)



####################################################
####################################################
# DS109-03-10 - Modifying Lists

# the starting list
contacts = ['Sally', 'Bob', 'Mary', 'Steven']

# Bob prefers to go by "Robert"
# Bob is at index 1 in the list
contacts[1] = "Robert"

print(contacts)



colors_list = ['white', 'white', 'white', 'white']
print(colors_list)

colors_list[0] = 'red'
colors_list[1] = 'green'
colors_list[2] = 'blue'
colors_list[3] = 'yellow'
print(colors_list)

colors_list[-1] = 'purple'
print(colors_list)



####################################################
####################################################
# DS109-03-11 - Adding to Lists

my_string = "Hello there Bob"

# splits string into list using space as the delimiter/separator
my_string_items = my_string.split()
print(my_string_items)

# but we forgot Sally!
# add 'and' and 'Sally' to the list
my_string_items.append("and")
my_string_items.append("Sally")

print(my_string_items)



numbers = [1, 2, 3, 4, 5]

# add 6 to the end
numbers.append(6)

# add 'seven' to the end
numbers.append('seven')
print(numbers)

numbers.append('eight')
numbers.append(9)
print(numbers)



my_list = [1, 2, 4]

# Oops! Forgot 3!
my_list.insert(2, 3)
print(my_list)



my_list = [1, 2, 3, 5]

# add 'zero' to the beginning of the list
my_list.insert(0, 'zero')

# insert `four' at index 4
my_list.insert(4, 'four')

print(my_list)



####################################################
####################################################
# DS109-03-12 - Adding to Lists Activity

colors = ['red', 'white', 'blue']

# insert 'green' between `red` and `white`
colors.insert(1, 'green')

# insert `yellow' between `white` and `blue`
colors.insert(3, 'yellow')

print(colors)



####################################################
####################################################
# DS109-03-13 - Removing an Item from a List

numbers = [1, 2, 3, 4]

# delete item at index 2
del numbers[2]
print(numbers)

# the position of value 4 has changed
# its index went from 3 to 2, due to the deletion

# delete the first item
del numbers[0]
print(numbers)

# delete the last item
del numbers[-1]
print(numbers)



colors = ['red', 'blue', 'yellow', 'green']
colors.remove('yellow')
print(colors)



colors = ['red', 'blue', 'red', 'green']
colors.remove('red')
print(colors)



####################################################
####################################################
# DS109-03-14 - Modify Lists Activity

colors = ['green', 'white', 'green', 'yellw', 'yellw', 'white']

# correct the spelling of `yellow`
colors[3] = 'yellow'
colors[4] = 'yellow'

# remove all instances of `white`
colors.remove('white')
colors.remove('white')


# add `purple` to the end of the list
colors.append('purple')

# print out the list of colors
print(colors)



####################################################
####################################################
# DS109-03-15 - Creating a list from a range of numbers

numbers = list(range(1, 11))
print(numbers)


the_range = range(1, 11)
numbers = list(the_range)


no_start_range = range(5)
numbers = list(no_start_range)
print(numbers)


inc_by_2_range = range(2, 11, 2)
numbers = list(inc_by_2_range)
print(numbers)


inc_by_10_range = range(0, 101, 10)
numbers = list(inc_by_10_range)
print(numbers)



####################################################
####################################################
# DS109-03-16 - Sorting a List

numbers = [2, 6, 3, 9, 1, 10]
strings = ['dog', 'cat', 'bird']

#sort numerically
numbers.sort()

# sort alphabetically
strings.sort()

print(numbers)
print(strings)


# sort in reverse order
numbers = [2, 6, 3, 9, 1, 10]
numbers.sort(reverse=True)
print(numbers)


# non-permanent sorting
numbers = [2, 6, 3, 9, 1, 10]

print("This is the original set of numbers: ")
print(numbers)

print("This is the sorted set of numbers: ")
print(sorted(numbers))

print("This is the original set of numbers again: ")
print(numbers)



####################################################
####################################################
# DS109-03-17 - Iterating over a collection

# original, before `for loop`
countries = ['USA', 'Canada', 'England', 'Ireland']
print(countries)

# now with `for loop`
countries = ['USA', 'Canada', 'England', 'Ireland']

# loop through list of countries using `for` loop
for country in countries:
    print(country)



# 1. a list of numbers from 1-5
all_numbers = [1, 2, 3, 4, 5]

# 2. an empty list that will store even numbers
even_numbers = []

# 3. loop through `all_numbers` and add the even
#    numbers to the `even_numbers` list
for the_number in all_numbers:
    # 4. if the number is even, add to `even_numbers`
    if the_number % 2 == 0:
        even_numbers.append(the_number)
    else:
        print("Ignoring the odd number: ", the_number)

# 5. print out `even_numbers`
print(even_numbers)


####################################################
# Try it yourself
# write 3 `for loops` that iterate and print each item

no_start_range = range(5)
numbers = list(no_start_range)
for number in numbers:
    print(number)


inc_by_2_range = range(2, 11, 2)
numbers = list(inc_by_2_range)
for number in numbers:
    print(number)


my_message = "Split these words for me"
split_at_spaces = my_message.split()
for word in split_at_spaces:
    print(word)



####################################################
####################################################
# DS109-03-18 - Iterate Lists Activity

# original list of numbers
numbers = [10, 25, 50]

# list for doubled numbers, empty to start
doubled_numbers = []

# double each number in `numbers`
# and add to `doubled_numbers`
for number in numbers:
	doubled_numbers.append(number * 2)

# practice only -- checking length
print(len(numbers))
print(len(doubled_numbers))

# print both lists
print(numbers)
print(doubled_numbers)



####################################################
####################################################
# DS109-03-19 - While Loops

a_number = 1
while a_number <= 5:
  print(a_number)
  a_number += 1



all_numbers = [1, 2, 3, 4, 5]
even_numbers = []

# use a while loop to iterate over the list
current_position = 0
while current_position < len(all_numbers):
    the_number = all_numbers[current_position]
    if the_number % 2 == 0:
        even_numbers.append(the_number)
    else:
        print("Ignoring the odd number: ", the_number)
    current_position += 1

print(even_numbers)




####################################################
####################################################
# DS109-03-20 - Terminating a For Loop

# using `break` to terminate a For loop
for letter in "Sally":
  if letter == "l":
    break
  print("Current letter: " + letter)

print("The loop is over.")


# using `break` to terminate a While loop
a_number = 7

while a_number > 0:
    print("Current number value is:", a_number)
    a_number -= 1
    if a_number == 4:
        break

print("The loop is over.")


# skipping an iteration of a loop
everyone = ['Sally', 'Billy', 'Mary', 'Bob']
looking_for = 'Mary'

for person in everyone:
    if person != looking_for:
        continue
    print("Found " + looking_for + "!")