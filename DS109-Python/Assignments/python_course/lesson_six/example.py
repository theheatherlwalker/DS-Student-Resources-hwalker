##################################################
# Example from https://www.youtube.com/watch?v=ZDa-Z5JzLYM&list=PL-osiE80TeTsqhIuOqKhwlXsIBIdSeYtc&index=1&t=8s
# Python OOP Tutorial 1: Classes and Instances
# By Corey Schafer


class Employee:
    
    def __init__(self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay
        self.email = first + '.' + last + '@company.com'

    def fullname(self):
        return '{} {}'.format(self.first, self.last)

emp_1 = Employee('Corey', 'Schafer', 50000)
emp_2 = Employee('Test', 'User', 60000)

print(emp_1.email)

print(emp_1.fullname())

# These 2 do the same thing
print(emp_1.fullname())
print(Employee.fullname(emp_1))


##################################################
# Example from https://www.youtube.com/watch?v=BJ-VvGyQxho&list=PL-osiE80TeTsqhIuOqKhwlXsIBIdSeYtc&index=2
# Python OOP Tutorial 2: Class Variable
# By Corey Schafer

class Employee:
    
    num_of_emps = 0
    raise_amount = 1.04 # class variable for raise

    def __init__(self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay
        self.email = first + '.' + last + '@company.com'

        Employee.num_of_emps += 1 # changes for Class value instead of instance value

    def fullname(self):
        return '{} {}'.format(self.first, self.last)

    def apply_raise(self):
        self.pay = int(self.pay * self.raise_amount)


emp_1 = Employee('Corey', 'Schafer', 50000)
emp_2 = Employee('Test', 'User', 60000)


# print(emp_1.__dict__) # returns the emp_1 namespace

# Employee.raise_amount = 1.05 # changes for the whole class
emp_1.raise_amount = 1.05 # changes only for the instance

print(Employee.raise_amount)
print(emp_1.raise_amount)
print(emp_2.raise_amount)

print(Employee.num_of_emps)








##################################################
# Example from https://www.youtube.com/watch?v=rq8cL2XMM5M&list=PL-osiE80TeTsqhIuOqKhwlXsIBIdSeYtc&index=3
# Python OOP Tutorial 3: classmethods and staticmethods
# By Corey Schafer



class Employee:
    
    num_of_emps = 0
    raise_amount = 1.04 # class variable for raise

    def __init__(self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay
        self.email = first + '.' + last + '@company.com'

        Employee.num_of_emps += 1 # changes for Class value instead of instance value

    def fullname(self):
        return '{} {}'.format(self.first, self.last)

    def apply_raise(self):
        self.pay = int(self.pay * self.raise_amount)

    @classmethod # decorator classmethod to recieve class variable instead of instance variable
    def set_raise_amt(cls, amount):
        cls.raise_amount = amount

    @classmethod # alternative constructor
    def from_string(cls, emp_str):
        first, last, pay = emp_str.split('-')
        return cls(first, last, pay)

    @staticmethod # don't pass anything (class or instance); act just like a function
    def is_workday(day): # pass in only the arguments you want to work with
        if day.weekday() == 5 or day.weekday() == 6:
            return False
        return True


    
emp_1 = Employee('Corey', 'Schafer', 50000)
emp_2 = Employee('Test', 'User', 60000)

import datetime
my_date = datetime.date(2016, 7, 11)

print(Employee.is_workday(my_date))


