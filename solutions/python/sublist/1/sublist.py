"""
This exercise stub and the test suite contain several enumerated constants.

Enumerated constants can be done with a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

# Possible sublist categories.
# Change the values as you see fit.
SUBLIST = "SUBLIST"
SUPERLIST = "SUPERLIST"
EQUAL = "EQUAL"
UNEQUAL = "UNEQUAL"


def sublist(list_one, list_two):
    """
    Function to classify a list with reference to another lists.
    It's either a sublist, superlist, equal, or unequal.
    """
    if list_one == list_two:
        return EQUAL
    list_one_len = len(list_one)
    list_two_len = len(list_two)
    if list_one_len < list_two_len: # Determine if 1 can be sublist of 2
        for step in range(0,list_two_len - list_one_len + 1):
            if list_one == list_two[step:step+list_one_len]:
                return SUBLIST
    if list_one_len > list_two_len: # Determine if 1 can be superlist of 2
        for step in range(0,list_one_len - list_two_len + 1):
            if list_two == list_one[step:step+list_two_len]:
                return SUPERLIST
    return UNEQUAL