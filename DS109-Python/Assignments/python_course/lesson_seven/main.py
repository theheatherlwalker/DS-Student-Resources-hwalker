###################################################
# DS109-07-03 - Standard Library

pi = 3.14159
pi_string = str(pi)
print("The value of Pi is " + pi_string)

number_list = [33, 19, 25, 7, 18]
min_number = min(number_list)
print("The minimum number in the list is " + str(min_number))



###################################################
# DS109-07-04 - Modules

# icecream.py
def scoop_icecream(size, *toppings):
    """Give a summary of the ice cream cone you are making."""

    print("\nMaking a " + size + " ice cream cone with the following toppings:")
    for topping in toppings:
        print("- " + topping)

# icecream_cone.py
import icecream

icecream.scoop_icecream('small', 'sprinkles', 'chocolate', 'cherries')
icecream.scoop_icecream('large', 'peanuts')



# Example of using `as`
from icecream import scoop_icecream as scoop

scoop('small', 'sprinkles', 'chocolate', 'cherries')



###################################################
# DS109-07-05 - Python Standard Modules

# Access version of Python
import sys
print('Python Version:', sys.version)

# Locate the Python interpreter
import sys
print('Interpreter Location:', sys.executable)


# List out all of Python's reserved keywords
import keyword

print('Keywords: ')
for word in keyword.kwlist:
    print(word)


# See if a word you'd like to use is a reserved keyword
import keyword

print(keyword.iskeyword('def'))



###################################################
# DS109-07-06 - The `math` module

# since the entire module is imported, the module name
# must precede the function names (dot syntax)
import math

# round 8.5 down using `floor`
print("Round the number 8.5 down: ", math.floor(8.5))

# round 8.5 up using `ceil`
print("Round the number 8.5 up: ", math.ceil(8.5))

# compute 5^10 using `pow`
print("5 to the power of 10 = ", math.pow(5, 10))

# compute the square root of 82 using `sqrt`
print("The Square Root of 82 is: ", math.sqrt(82))


# Example of using the `random` module
import random

print("A random float between 0 - 1.0: ", random.random())


# Example of `random.sample()`
import random

numbers = random.sample(range(1, 49), 7) # The first argument given is the range from 1 to 49. The second argument is how many numbers you want to be returned from that range.

print('Your lucky numbers are: ', numbers)




###################################################
# DS109-07-07 - Modules Activity

# Import `math` and `random` modules
import math
import random

# Generate a random number between 0 and 100 
# stored in variable named `my_random`
# multiply result by 100 to get desired number
my_random = (random.random()*100)
print(my_random)

# Find square root of `my_random`
square_root = math.sqrt(my_random)
print(square_root)




###################################################
# DS109-07-08 - pip packages

# Import Numpy with an alias of `np``
import numpy as np

x = np.array([1,2,3])
print(x)

# Using more than one dimension
import numpy as np

x = np.array([[1, 2, 3], [4, 5, 6]])
print(x)


# Empty/initial array, but know how many dimensions are needed
import numpy as np

x = np.array([1, 2, 3, 4, 5], ndmin=2)
print(x)



