"""Module that determines if a number is an Armstrong number"""

def is_armstrong_number(number):
    armstrong = 0
    for num in tuple(str(number)):
        armstrong += int(num) ** len(str(number))
    return armstrong == number
