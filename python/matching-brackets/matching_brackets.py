"""
Bracket pairing validator module.

This module provides functionality to validate that brackets and parentheses
are properly paired and balanced within a string. It supports three types of
bracket pairs: (), {}, and [].
"""

def is_paired(input_string):
    """
    Check if all brackets in a string are properly paired and balanced.
    
    Validates that opening and closing brackets are correctly matched and
    nested. Supports three bracket types: parentheses (), curly braces {},
    and square brackets []. Non-bracket characters are ignored.
    
    Args:
        input_string (str): The string to validate for bracket pairing.
    
    Returns:
        bool: True if all brackets are properly paired and balanced,
              False otherwise. Returns True for empty strings or strings
              with no brackets.
    """
    brackets = "({[)}]"
    symbols = ""
    for char in input_string:
        if char in brackets[:3]:
            symbols += char
        if char in brackets[3:]:
            if len(symbols) == 0:
                return False
            if brackets.index(char) == brackets.index(symbols[-1])+3:
                symbols = symbols[:-1]
            else:
                return False
    if symbols == "":
        return True
    return False