##################################################
# DS109-06-03 - Classes

# 1. `class` keyword followed by the name of the class and a colon
class ClassName:
    # 2. Classes have a docstring just like functions
    """DocString"""
    # 3. Classes have properties and methods


# 1. Define the class `Dog`
class Dog:
    # 2. The docstring for the `Dog` class
    """The summary docstring for the Dog class. This class represents a Dog."""

    # 3. The initializer of the class, where the class properties are initialized
    def __init__(self, name, age):
        # 4. Class methods, including the initializer, should have a docstring
        """Initialize attributes to describe a Dog."""

        # 5. Below are the properties of the `Dog` class, each with it's own docstring
        self.name = name    #: The `name` property represents the dog's name
        self.age = age      #: The `age` property represents the dog's age

    # 6. Two methods, `stay` and `sit`, are defined for the `Dog` class
    def sit(self):
        """Simulates a dog sitting on command."""
        print(self.name.title() + " is sitting.")

    def stay(self):
        """Simulates a dog that will stay on command."""
        print(self.name.title() + " was told to stay.")




##################################################
# DS109-06-04 - Instances


class Dog:
    """The summary docstring for the Dog class. This class represents a Dog."""

    def __init__(self, name, age):
        """Initialize attributes to describe a Dog."""
        self.name = name    #: The `name` property represents the dog's name
        self.age = age      #: The `age` property represents the dog's age

    def sit(self):
        """Simulates a dog sitting on command."""
        print(self.name.title() + " is sitting.")

    def stay(self):
        """Simulates a dog that will stay on command."""
        print(self.name.title() + " was told to stay.")

# create two separate instances of `Dog`
fido = Dog('Fido', 5)
spot = Dog('Spot', 7)



# `Dog` class defined here
# ...

# create two instances of `Dog`
fido = Dog('Fido', 5)
spot = Dog('Spot', 7)

# print the name and age of each instance
print("The name of the dog is", fido.name, "and the age is", fido.age)
print("The name of the dog is", spot.name, "and the age is", spot.age)

# change fido's age and print both again
fido.age = 9

print("The name of the dog is", fido.name, "and the age is", fido.age)
print("The name of the dog is", spot.name, "and the age is", spot.age)



# `Dog` class defined here
# ...

# create two instances of `Dog`
fido = Dog('Fido', 5)
spot = Dog('Spot', 7)

# tell both to sit and stay
fido.sit()
fido.stay()
spot.sit()
spot.stay()




##################################################
# DS109-06-05 - Class Properties and Methods


class Cat:
    """This class represents a cat."""

    # 1. This is a class variable that is shared by ALL instances of the class
    sound_made = 'Meow'

    # 2. The class initialization method
    def __init__(self, name):
        """Initializer of Cat class"""
        self.name = name    #: The name of the Cat instance

    # 3. this method prints out the class variable `sound_made`
    def say_something(self):
        """Speak!"""
        print(self.name, "says", Cat.sound_made)

# 4. create two Cat instances
mittens = Cat('Mittens')
feather = Cat('Feather')

# 5. call `say_something` method on each
mittens.say_something()
feather.say_something()

# 6. change the value of the class variable
Cat.sound_made = 'Woof'

# 7. call `say_something` again for each instance after the change
mittens.say_something()
feather.say_something()



# Docstrings were omitted to highlight the differences between
# class variable and instance variable
class Cat:
    class_var = "I am a class variable"

    def __init__(self, instance_var):
        self.instance_var = instance_var

    def print_properties(self):
        print("My class property value is", Cat.class_var)
        print("My instance property value is", self.instance_var)

my_cat = Cat('Whiskers')
my_cat.print_properties()

print(Cat.class_var)
print(my_cat.instance_var)




class Duck:
    """This class represents a duck."""

    # 1. Class variable available to all instances
    sound_made = "quack"

    def __init__(self, name):
        """Duck initializer"""
        self.name = name

    # 2. Instance method for saying something ('what')
    def say(self, what):
        """The instance says 'what'"""
        print(self.name, "says", what)

    # 3. Class method for speaking the sound all ducks make
    @staticmethod
    def speak():
        """The class says sound_made"""
        print("Ducks say", Duck.sound_made)

# 4. Calling the class method
Duck.speak()

# 5. Creating an instance and calling the instance method
daffy = Duck('Daffy')
daffy.say('Hello')




##################################################
# DS109-06-06 - Robust Class Example


# 1. Define the `Student` class
class Student:
    """This models a student"""

    # 2. Class variable - array of Student instances
    students = []   #: Class var to hold all students

    # 3. Initializer for two instance properties: name and grade
    def __init__(self, name, grade):
        """Initializer of class"""
        self.name = name    #: Instance var for student name
        self.grade = grade  #: Instance var for student grade

    # 4. Instance method to display information about a student
    def display(self):
        """Instance method to display student info"""
        print("Name:", self.name, ", Grade:", self.grade)

    # 5. Class method to add a student instance to class array `students`
    @staticmethod
    def add_student(student):
        """Class method for adding a student to the class var"""
        Student.students.append(student)

    # 6. Class method to call the `display` method for all students
    @staticmethod
    def display_students():
        """Class method for printing all students"""
        for student in Student.students:
            student.display()

# 7. create an instance of `Student` and print info
bill = Student('Bill', 'Freshman')
bill.display()

# 8. create another instance of `Student` and print info
sally = Student('Sally', 'Junior')
sally.display()

# 9. add both students to student array which is a class var
#    using the class method `add_student`
Student.add_student(bill)
Student.add_student(sally)

# 10. call class method `display_students` to print info
#     for all added students
print('--------')
Student.display_students()




##################################################
# DS109-06-08 - Person Classes Activity

class Person:
    """This is a person"""

    def __init__(self, firstName, lastName):
        """Initializer"""
        self.firstName = firstName
        self.lastName = lastName

bill = Person('Bill', 'Barnes')
sally = Person('Sally', 'Smith')

# list `people` with Person objects
people_list = [bill, sally]

##################################################
class Greeter:
    """ This is the Greeter class """
    
    @staticmethod
    def greet(people):
        """ static method; greet person and add to greetings list """
        greetings = []
        for person in people:
            greeting = "Hello " + person.firstName + " " + person.lastName + "!"
            greetings.append(greeting)
        return greetings
            
print(Greeter.greet(people_list))





##################################################
# DS109-06-09 - Rectangle Classes Activity

class Rectangle:
	""" This is the class Rectangle """
	
	def __init__(self, width, height):
		""" Initialize the properties """
		self.width = width
		self.height = height
		
	def area(self):
		""" method for calculating area of rectangle """
		return (self.width * self.height)

rectangle_1 = Rectangle(3,5) # test with `rectangle_1`

print(rectangle_1.width)
print(rectangle_1.height)

print(rectangle_1.area()) # check `rectangle_1`