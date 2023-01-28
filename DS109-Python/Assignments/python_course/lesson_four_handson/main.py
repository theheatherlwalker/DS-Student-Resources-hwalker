############################################################
# DS109-04-14 - Python Dictionaries Hands-On

# Part 1 ###################################################

# 1.1  Create dictionaries for 2 pets
SlimJim = {
    'Type': 'dog',
    'Color': 'grey',
    'Nickname': 'Slim',
    'Owner': 'Jarrod'
}

LittleDebbie = {
    'Type': 'dog',
    'Color': 'black',
    'Nickname': 'Debber',
    'Owner': 'Heather'
}

# 1.2  Print each key-value for pet dictionaries
# Create list of dictionaries
pets = [SlimJim, LittleDebbie]

# Print SlimJim dictionary
for key,value in SlimJim.items():
    print(key,": ",value)
# Print LittleDebbie dictionary
for key,value in LittleDebbie.items():
    print(key,": ",value)



# Part 2 ###################################################

# 2.1 Create dictionaries for 3 cities
# EXTRA Add `PLACE` for prettier printout
London = {'PLACE': 'LONDON', 'Country': 'England'}
Paris = {'PLACE': 'PARIS', 'Country': 'France'}
Brussels = {'PLACE': 'BRUSSELS', 'Country': 'Belgium'}

# 2.2  Add these dictionaries for 3 countries
# EXTRA Add `PLACE` for prettier printout
england = {'PLACE': 'ENGLAND', 'Capital': 'London'}
france = {'PLACE': 'FRANCE', 'Capital': 'Paris'}
belgium = {'PLACE': 'BELGIUM', 'Capital': 'Brussels'}

# 2.3a Add `Population` to dictionaries
London['Population'] = '8.982 million'
Paris['Population'] = '2.161 million'
Brussels['Population'] = '2.110 million'
england['Population'] = '53.01 million'
france['Population'] = '66.9 million'
belgium['Population'] = '11.35 million'

# 2.3b Add `Interesting Fact` to dictionaries
London['Interesting Fact'] = 'London Has 170 Museums.'
Paris['Interesting Fact'] = 'The first photo of a person ever taken was in Paris.'
Brussels['Interesting Fact'] = 'Brussels has 138 restaurants per square mile.'
england['Interesting Fact'] = 'England fought the shortest war in history.'
france['Interesting Fact'] = 'France Is the Most-Visited Country in the World.'
belgium['Interesting Fact'] = 'Belgium holds the world record for the longest period without a government.'

# 2.3c Add `Top Local Language` to dictionaries
London['Top Local Language'] = 'English'
Paris['Top Local Language'] = 'French'
Brussels['Top Local Language'] = 'French'
england['Top Local Language'] = 'English'
france['Top Local Language'] = 'French'
belgium['Top Local Language'] = 'French'

# Make a list for iterating a loop
Places = [London, Paris, Brussels, england, france, belgium]

# Use list index to move through loop with Places list
print("\nLIST OF PLACES\n")
current_index = 0
while current_index < len(Places):
    for key,value in Places[current_index].items():
        print(key, ": ", value)
    print("\n")
    current_index += 1



# Part 3 ###################################################

# 3.1  Add a pizza order dictionary
pizza_order = {
    'customer_name': 'Andrew',
    'pizza_size': 'small',
    'crust_type': 'thin-crust',
    'toppings': ['extra cheese', 'sausage', 'bacon']
}

# 3.2 Print out the `pizza_order` dictionary
print("Thank you for your order, ", pizza_order.get('customer_name'))
print("You have ordered a ", 
    pizza_order.get('pizza_size'), ",", 
    pizza_order.get('crust_type'), 
    " pizza with the following toppings: ")
print(pizza_order['toppings'][0], ", ", 
    pizza_order['toppings'][1], ", ", 
    pizza_order['toppings'][2], ".")