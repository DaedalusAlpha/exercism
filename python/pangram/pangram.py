"""Module for checking if a string is a pangram.

A pangram is a sentence that contains every letter of the alphabet at least once.
"""
from string import ascii_lowercase

def is_pangram(sentence):
    """Check if a sentence is a pangram.
    
    A pangram contains all 26 letters of the English alphabet at least once.
    The check is case-insensitive.
    
    Args:
        sentence (str): The string to check.
    
    Returns:
        bool: True if the sentence is a pangram, False otherwise.
    
    Examples:
        >>> is_pangram("The quick brown fox jumps over the lazy dog")
        True
        >>> is_pangram("Hello world")
        False
    """
    if set(sentence.lower()) & set(ascii_lowercase) == set(ascii_lowercase):
        return True
    return False