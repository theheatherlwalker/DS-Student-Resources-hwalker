
# DS109-05-13 - DS109-05-13 - Functions Practice Hands-On

############################################################
# 1.1 Create 3 functions that each accept 3 parameters

# 1.1a sum_function sums all numbers
def sum_function(x, y, z):
    """ Returns the sum of all numbers """
    return x + y + z


# 1.1b product_function multiplies all numbers
def product_function(x, y, z):
    """ Returns the product of all numbers """
    return x * y * z


# 1.1c average_function averages all numbers
def average_function(x, y, z):
    """ Returns the average of all numbers """
    return (x + y + z)/3



# 1.2  Print out the result of each function
print(sum_function(1,2,3))
print(product_function(4,5,6))
print(average_function(7,8,9))



############################################################
# 2.1 Create lambda functions to replace the above
add_numbers = lambda x, y, z: x + y + z
multiply_numbers = lambda x, y, z: x * y * z
average_numbers = lambda x, y, z: (x + y + z)/3

# 2.2  Print and call the above functions
print(add_numbers(1,2,3))
print(multiply_numbers(4,5,6))
print(average_numbers(7,8,9))



############################################################
# 3.1, 3.2 Create 3 lists
list_one = [4,6,88,24] 
list_two = [17,34,9,5]
list_three = [63,20,98,4] 

# 3.3 Create a lambda function to average numbers
average_maker = lambda x, y, z: (x + y + z)/3

# 3.4 Use `map` to compute average of each list
map_results = list(map(average_maker, list_one, list_two, list_three))

# 3.5 Print the results
print(map_results)
