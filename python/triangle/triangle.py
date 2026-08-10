"""Module with functions to determine triangle type"""

def equilateral(sides):
    """Take list of sides and determine if triangle equilateral"""
    if is_triangle(sides) and sides[0] == sides[1] == sides[2]:
        return True
    return False


def isosceles(sides):
    """Take list of sides and determine if triangle equilateral"""
    if (is_triangle(sides) and
        (sides[0] == sides[1] or
         sides[1] == sides[2] or
         sides[2] == sides[0])):
        return True
    return False    


def scalene(sides):
    """Take list of sides and determine if triangle equilateral"""
    if (is_triangle(sides) and 
        sides[0] != sides[1] and
        sides[1] != sides[2] and
        sides[2] != sides[0]):
        return True
    return False

def is_triangle(sides):
    """Check if shape is a triangle"""
    for side in sides:
        if side <= 0:
            return False
    if (sides[0] + sides[1] >= sides[2] and
        sides[1] + sides[2] >= sides[0] and
        sides[2] + sides[0] >= sides[1]):
        return True
    return False