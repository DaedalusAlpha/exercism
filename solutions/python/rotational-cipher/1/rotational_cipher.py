"""
Implementation of the rotational cipher.
"""
def rotate(text, key):
    """Rotate letters in text by key positions (Caesar cipher).
    
    Preserves case and non-alphabetic characters.
    
    Args:
        text (str): The text to rotate.
        key (int): Number of positions to shift each letter.
    
    Returns:
        str: The rotated text.
    """
    alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    cipher = alpha[key:26]+alpha[:key]+alpha[key+26:]+alpha[26:key+26]
    output = ""
    for char in text:
        if char in alpha:
            output += cipher[alpha.index(char)]
        else:
            output += char
    return output