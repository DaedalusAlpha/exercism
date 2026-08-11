"""Module for checking if strings are isograms.

An isogram is a word, phrase, or name where each letter appears only once.
Non-alphabetic characters (numbers, spaces, punctuation) are ignored.
"""

from string import ascii_lowercase

def is_isogram(phrase):
    """Check if a phrase is an isogram.
    
    An isogram is a word or phrase where each letter appears at most once.
    The check is case-insensitive and ignores non-alphabetic characters.
    
    Args:
        phrase (str): The string to check.
    
    Returns:
        bool: True if the phrase is an isogram, False otherwise.
    """
    sub_phrase = ""
    for char in phrase.lower():
        if char in set(ascii_lowercase):
            sub_phrase += char
    if len(set(sub_phrase)) == len(sub_phrase):
        return True
    return False
