"""Module for validating ISBN-10 numbers."""
import re

def is_valid(isbn):
    """
    Validate an ISBN-10 number using the check digit algorithm.
    
    Checks if the given string is a valid ISBN-10 by:
    1. Verifying the format (digits and optional hyphens, ending with digit or X)
    2. Calculating the check digit sum using the ISBN-10 algorithm
    3. Confirming the sum is divisible by 11
    
    The ISBN-10 check digit is calculated by multiplying each digit (1-9) by
    weights 10 down to 2, and the check digit by 1, then summing all products.
    
    Args:
        isbn (str): The ISBN-10 string to validate. Can include hyphens or be
                    continuous digits. The last character may be 'X' (representing 10).
    
    Returns:
        bool: True if the ISBN-10 is valid, False otherwise.
    """
    pattern = r'^\d-?\d{3}-?\d{5}-?[\dX]$'
    if re.match(pattern, isbn):
        regex = re.compile('[^0-9X]')
        clean_isbn = regex.sub('',isbn)
        sum = 0
        for index, num in enumerate(range(10,0,-1)):
            temp = clean_isbn[index]
            if  temp == 'X':
                temp = 10
            sum = sum + (int(temp) * num)
        if sum % 11 == 0:
            return True
    return False