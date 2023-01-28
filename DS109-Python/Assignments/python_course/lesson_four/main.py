###############################################################
#DS109-04-03 - Dictionary basics

# Empty dictionary
empty_dictionary = {}

# Dictionary example: employee
employee = {'name': 'Andrew', 'age': 29, 'position': 'Engineer'}

# Dictionary example: address
address = {'city': 'Scottsdale', 'state': 'AZ', 'zip': '85258'}

# dict() Function
new_dict = dict(name='john', age=19, hometown='Phoenix')
print(new_dict)

dictionary = dict([(1, 'John'), (2, 'Andrew')])
print(dictionary)


# Write 3 of your own dictionaries
# 1. "normal" dictionary
dogDictionary = {'name': 'Slim Jim', 'breed': 'Toy Poodle Mix'}

# 2. using dict() function
dogDictionary = dict(name='Little Debbie', breed='Toy Poodle Mix')
print(dogDictionary)

# 3. alternate dict() function
dogDictionary = dict([('name', 'Cinder'), ('breed', 'Standard Poodle')])
print(dogDictionary)


# formatting best practice example
contact = {
    'first_name': 'Henry',
    'last_name': 'Poldark',
    'phone_number': '(123)-456-7890',
    'street': 'N 90th St',
    'city': 'Scottsdale',
    'state': 'Arizona',
    'zip_code': '85258'
}


###############################################################
#DS109-04-04 - Creating a Dictionary Activity
student = {
	'name': "Ace Ventura",
	'age': 22,
	'status': 'junior'
}


###############################################################
#DS109-04-05 - Accessing Dictionary Data

person = {'name': 'Andrew', 'age': 29, 'city': 'Scottsdale', 'state': 'AZ'}
print(person['name'])
print(person['age'])


# `.keys()` returns only the keys of dictionary
student = {'name': 'Andrew', 'program': 'Software Development', 'id': 110272}
the_keys = student.keys()
print(the_keys)

# `.values()` command
student = {'name': 'Andrew', 'program': 'Software Development', 'id': 110272}
values = student.values()
print(values)

# `.items()`
student = {'name': 'Andrew', 'program': 'Software Development', 'id': 110272}
print(student.items())


# `.get()` example
contact = {'name': 'Andrew', 'occupation': 'Software Engineer'}

print("Name : ", contact.get('name'))
print("Occupation : ", contact.get('occupation'))
print("Salary : ", contact.get('salary'))
print("Address : ", contact.get('address', "I live in a box"))



###############################################################
#DS109-04-06 - Modifying a Dictionary


# Add a new key-value pair
address = {'state': 'AZ', 'city': 'Scottsdale'}

address['street'] = 'N 90th St'


# Modify an existing key-value pair
address = {'state': 'AZ', 'city': 'Scottsdale', 'street': 'N 90th St'}

address['state'] = 'Arizona'


# Deleting a value
# the contact dictionary
contact = {
    'first_name': 'Andrew',
    'last_name': 'Stefanik',
    'phone_number': '(123)-456-7890',
    'street': 'N 90th St',
    'city': 'Scottsdale',
    'state': 'Arizona',
    'zip_code': '85258'
}

# remove the `phone_number` from `contact`
del contact['phone_number']

print(contact)


###############################################################
# DS109-04-07 - Key-Value Pairs Dictionary Activity

person = {
    'name': 'Donetta Jones',
    'age': 25,
    'city': 'Phoenix'
}

person['city'] = 'Scottsdale'
person['state'] = 'AZ'



###############################################################
# DS109-04-08 - Iterating over a dictionary

user = {'name': 'Andrew', 'email': 'andrew@email.com', 'username': 'andrewUser'}

for key, value in user.items():
    print("Key =", key, "\tValue =", value)



###############################################################
# DS109-04-09 - Iterating the keys


user = {'name': 'Andrew', 'email': 'andrew@email.com', 'username': 'andrewUser'}

for key in user.keys():
    print("Key =", key, "\tValue =", user[key])

# trying out eliminating `.keys()` portion
for key in user:
    print("Key =", key, "\tValue =", user[key])



###############################################################
# DS109-04-10 - Iterating the values

user = {'name': 'Andrew', 'email': 'andrew@email.com', 'username': 'andrewUser'}

for value in user.values():
    print("Value =", value)



###############################################################
# DS109-04-11 - Nested Dictionaries

# 3 dictionaries, each a given contact
contact_0 = {'name': 'Andrew', 'phone': '(123)-222-2325'}
contact_1 = {'name': 'Mike', 'phone': '(113)-452-9825'}
contact_2 = {'name': 'David', 'phone': '(323)-933-2054'}

# combine into a list
address_book = [contact_0, contact_1, contact_2]

# Iterate the list to print the ind. contact dictionaries
for contact in address_book:
    print(contact)


# A dictionary with Dictionaries
# Dictionary of contact
contact = {'name': 'Andrew', 'phone': '(123)-222-2325'}

# Contact is missing address information, add it:
address = {'street': '123 Tuple St', 'city': 'Scottsdale', 'state': 'AZ'}

# add `address` dictionary to `contact` dictionary
# with key 'address'
contact['address'] = address

# Print the contact directory
print(contact)



###############################################################
# DS109-04-12 - Greetings Dictionary Acvitity

people = {
    'person1': {
        'name': 'Sally Sue',
        'city': 'Phoenix'
    },
    'person2': {
        'name': 'Billy Bob',
        'city': 'Scottsdale'
    },
    'person3': {
        'name': 'Rover',
        'city': 'Zappa'
    }
}

# Empty `greetings` list
greetings = []

# iterate all the nested dictionary values
for person in people:
    greetings.append("Hello " + people[person]['name'] + " from " + people[person]['city'])

# print(greetings)



