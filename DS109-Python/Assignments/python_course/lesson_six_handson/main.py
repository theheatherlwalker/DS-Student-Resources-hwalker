##################################################
# DS109-06-10 - Classes Hands-On


# Part 1
##################################################

# Create a class called `Stadium`
class Stadium:
    """ This is the Stadium class """

    # Initialize the properties/attribures
    def __init__(self, name, city_state, capacity):
        """ Initialize the properties/attributes """
        self.name = name
        self.city_state = city_state
        self.capacity = capacity

    # Method to describe stadium, uses all properties
    def describe_stadium(self):
        """ Method to describe stadium, uses all properties """
        print("The " + self.name + " is located in " + self.city_state + " and holds " + self.capacity + " fans.")

# Create a new instance of `Stadium` names `stadium1`
stadium1 = Stadium('Nissan Stadium', 'Nashville, TN', '69,143')

# call `describe_stadium` method with `stadium1`
stadium1.describe_stadium()



# Part 2
##################################################

# Add 2 more methods to the `Stadium` class
class Stadium:
    """ This is the Stadium class """

    # Initialize the properties/attribures
    def __init__(self, name, city_state, capacity):
        """ Initialize the properties/attributes """
        self.name = name
        self.city_state = city_state
        self.capacity = capacity

    # Method to describe stadium, uses all properties
    def describe_stadium(self):
        """ Method to describe stadium, uses all properties """
        print("The " + self.name + " is located in " + self.city_state + " and holds " + self.capacity + " fans.")

    def sport_played(self, sport):
        """ Method accepts the sport played """
        print("The following sport is mainly played in this stadium: " + sport)

    def seats_available(self, seats):
        """ Method accepts the number of seats available """
        print("There are " + seats + " still available for tonight's game.")


stadium1 = Stadium('Nissan Stadium', 'Nashville, TN', '69,143')

stadium1.describe_stadium()

# Call the 2 new methods using `stadium1`
stadium1.sport_played('American Football')
stadium1.seats_available('4,356')

