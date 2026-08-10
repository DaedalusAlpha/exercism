"""
Given a positive integer, return the number of steps it takes to reach 1 
according to the rules of the Collatz Conjecture.
The rules were deceptively simple. Pick any positive integer.
- If it's even, divide it by 2.
- If it's odd, multiply it by 3 and add 1.
"""

def steps(number):
    """Return total steps in Collatz Conjecture for a number"""
    if number < 1: 
        raise ValueError("Only positive integers are allowed")
    count, output = 0, number
    while True:
        if output == 1:
            return count
        if output % 2 == 0:
            output /= 2
        else: 
            output = (output * 3) + 1
        count+=1
