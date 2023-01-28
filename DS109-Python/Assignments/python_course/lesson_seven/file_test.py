###################################################
# DS109-07-09 - Accessing and Modifying Files

# Open `example.txt` in "write" mode
file = open('example.txt', 'w')

print('File Name:', file.name) # print the name of the file
print('File Open Mode:', file.mode) # print the mode in which the file was opened

# define a funciton that allows you to determine if a file is "open" or "closed"
def status(file):
    if(file.closed != False):
        return 'Closed'
    else:
        return 'Open'

# Print the status of the file
print('File Status:', status(file))


# Close the file
file.close()
print('File Status: ', status(file))



###################################################
# DS109-07-10 - Reading and Writing Files

# Variable with short story line
story = "Once upon a time there was\n"

# Add more lines to your story
story += "a dog who loved to play ball.\n"
story += "This dog could run as fast as the wind.\n"

print(story)

# Create a new file object and add the story to the file

# New file `story.txt` is created and opened in "write" mode
file = open('story.txt', 'w')
# writes what is stored in `story` to the `story.txt` file
file.write(story)


# Open the file, but this time in "read" mode
file = open('story.txt', 'w')
file.write(story)
file.close()

file = open('story.txt', 'r')

# Display the contents of file
for line in file:
    print(line, end = '')
# Close the file
file.close()



# use `read()` function instead
file = open('story.txt', 'w')
file.write(story)
file.close()

file = open('story.txt', 'r')

# for line in file:
#    print(line, end = '')
contents = file.read()
print(contents)

file.close()



# To append more text to the file
file = open('story.txt', 'a')
file.write(story)
file.close()

file = open('story.txt', 'r')

# for line in file:
#    print(line, end = '')
contents = file.read()
print(contents)

file.close()



###################################################
# DS109-07-11 - Updating File Strings

# Create a string variable
new_text = 'Python was conceived in the late 1990s by Guido van Rossum'

# Add the statements to write the string to a file
# and display the file's current status using `with` block
with open('updating.txt', 'w') as file:
    file.write(new_text)
    print('\nFile Now Closed?:', file.closed)

# Add print statement to check file's new status
print('File Now Closed?:', file.closed)

# Open the file once again
# and display its contents to cofirm it contains
# the entire `new_text` string
with open('updating.txt', 'r+') as file:
    new_text = file.read()
    print('\nString:', new_text)
    # print the file's current position
    print('\nPosition In File Now:', file.tell())
    # moves the file's current position 33 characters toward the end of the file
    position = file.seek(33)
    # print the file's current position to show that it moved
    print('Position In File Now:', file.tell())
    # write `1980s` to the file, overwrites what was there previously
    file.write('1980s')
    # return to the start of the file and display entire updated contents
    file.seek(0)
    new_text = file.read()
    print('\nString:', new_text)


# All the new code combined:
new_text = 'Python was conceived in the late 1990s by Guido van Rossum.'
with open('updating.txt', 'w') as file:
    file.write(new_text)
    print('\nFile Now Closed?:', file.closed)
print('File Now Closed?:', file.closed)

with open('updating.txt', 'r+') as file:
    new_text = file.read()
    print('\nString:', new_text)
    print('\nPosition In File Now:', file.tell())
    position = file.seek(33)
    print('Position In File Now:', file.tell())
    file.write('1980s')
    file.seek(0)
    new_text = file.read()
    print('\nString:', new_text)