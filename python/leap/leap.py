"""Module providing a function that determines if a given year is a leap year"""

def leap_year(year):
    """Determine if year is a leap year"""
    if year % 400 == 0:
        return True
    if year % 4 == 0 and year % 100 != 0:
        return True
    return False