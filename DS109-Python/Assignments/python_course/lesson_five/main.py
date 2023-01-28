############################################################
# DS109-05-03 - Functions

# Example of defining a function
def greeting():
    """This function prints a greeting"""
    print("Hello!")

greeting()


############################################################
# DS109-05-04 - Providing data to a Function

# Example of providing data to a function
def increment(value):
    """This function increments a value"""
    print("Old value =", value)
    value += 1
    print("New value =", value)

increment(10)


# Example of function with default parameters
def increment(value, step_size):
    """This function increments a value"""
    print("Old value =", value)
    value += step_size
    print("New value =", value)

increment(10, 5)


# Example of optional `step_size` parameter
def increment(value, step_size=1):
    """This function increments a value"""
    print("Old value =", value)
    value += step_size
    print("New value =", value)

increment(10,5) # uses specified optional value `5`
increment(10) # uses the default values



############################################################
# DS109-05-05 - Returning data from a Function

# Example of function returning data
def increment(value, step_size=1):
    """This function increments a value"""
    return value + step_size

new_value = increment(5, 3)
print("The new value is", new_value)


# Another example
def sum(x, y):
    """This function sums the inputs"""
    return x + y

result = sum(10, 15)
print("The sum of 10 and 15 is", result)



# Function that returns a tuple of dictionaries
def get_settings():
    """This function returns two dictionaries as a tuple"""
    dict1 = {'name': 'Bob', 'color': 'blue'}
    dict2 = {'name': 'Sally', 'color': 'red'}
    return (dict1, dict2)

tuple = get_settings()
print(tuple)



# Example of function returning no value
def greeting():
    """This function prints a greeting"""
    print("Hello!")

print(greeting())



############################################################
# DS109-05-06 - Local Variables and Scope

# this `user` variable is declared outside of the function
user = 'Andrew Jones'

def my_function(first, last):
    # this `user` variable is declared inside of the function
    # and is unrelated to the `user` variable declared outside of the function
    user = first + ' ' + last
    return user

print(user)


# print the user variable int he function
print(my_function('John', 'Smith'))



# The user variable is in global scope
user = "Andrew Jones"

def the_user():
    """Return the value of global variable user"""
    # The global variable user is returned
    return user

# will print the global variable `user`
print(the_user())



# Example of changing value of global variable
y = 25

def my_function():
    global y

    print('y is', y)
    y = 5
    print('the new value of global y is', y)

my_function()
print('y is now', y)




############################################################
# DS109-05-08 - Count Function Activity


count = 0

def get_count (data_list, update_count=False):
  """This functions counts the numeric values"""
  global count
  if update_count==True:
    count = len(data_list)
    return len(data_list)
  else:
    return len(data_list)


get_count([1, 2, 3, 4])
print(count)


############################################################
# DS109-05-09 - Unnamed, Anonymous Functions

# create lambda function and assign to variable `my_lambda`
my_lambda = lambda x, y : x + y

# print the results of calling the lambda function
print(my_lambda(4, 5))


# another lambda example
a = lambda x: x > 10

print(a(20))



############################################################
# DS109-05-10 - Operations That Can Be Performed on Collections



# 1. the list of numbers
numbers = [1, 2, 3, 4, 5]

# 2. the lambda function to square a number
square = lambda x: x * x

# 3. use `map` to apply the squaring lambda function to
# every item in the list of `numbers`
map_results = map(square, numbers)

# 4. `map` returns a special type of data, but it can be converted
# to a list using the `list` function
results = list(map_results)

# 5. print the results
print(results)





# declare two lists of integers
list_a = [1, 2, 3, 4, 5]
list_b = [11, 12, 13, 14, 15]

# call `map` with a lambda function that sums two numbers
# the first number comes from `list_a`, the second comes from `list_b`
map_results = map(lambda val_a, val_b: val_a + val_b, list_a, list_b)

# print results (converting map result to list within print statement)
print(list(map_results))




# 1. the list of numbers
numbers = [1, 2, 3, 4, 5]

# 2. the lambda function to return True only if the value is even
is_even = lambda x: x % 2 == 0

# 3. call `filter` using the `is_even` lambda function and the list `numbers`
filter_results = filter(is_even, numbers)

# 4. `filter` returns a special type of data like `map`, but it can be converted
# to a list using the `list` function
results = list(filter_results)

# 5. print the results
print(results)





############################################################
# DS109-05-11 - Lambda Activity

numbers = [[1,2,3],[4,5,6]]

fn_average = lambda x: sum(x)/len(x)

averages = list(map(fn_average, numbers))

print(averages)



############################################################
# DS109-05-12 - Product Activity

list_a = [4, 6, 8]
list_b = [3, 3, 1]

products = list(map(lambda x,y: x * y, list_a, list_b))

print(products)