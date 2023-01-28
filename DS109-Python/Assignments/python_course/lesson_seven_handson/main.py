###################################################
# DS109-07-12 - Python's Standard Library Practice Hands-On








# Part 1
###################################################

# 1.1  Import `datetime` module
from datetime import datetime

# 1.1 (cont'd) create a variable that is set to today's date
nowDate = datetime.now()

# 1.2 Print out the full date
print(nowDate)

# 1.2 Extra! Print out the full date with Day of Week string
print("Today's Date: ", nowDate.strftime('%A'), nowDate)

# 1.3 Print out the ONLY the time in format: hour and minutes
nowTime = nowDate.strftime('%H:%M')
print("Current Time: ", nowTime)


# Part 2
###################################################

#  2.1  Create new string variable `poem_string`
poem_string = "Tiny little secrets\nGet buried in the dirt,\nAnd if they were dug up,\nSomeone would probably get hurt."

# 2.2  Create and open new file object `poem.txt` in "write" mode
poem_file = open('poem.txt', 'w')
# 2.3  write `poem_string` to `poem.txt`
poem_file.write(poem_string)
# 2.4  close the `poem.txt' file
poem_file.close()

# 2.5  Re-open `poem.txt` in "read" mode
poem_file = open('poem.txt', 'r')
# 2.6  Read and print the contents of the `poem.txt` file
for line in poem_file:
    print(line, end = '') # by specifying end = ' ', you get rid of the default extra `\n`
    
# 2.7  Close the file again
poem_file.close()