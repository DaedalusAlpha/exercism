"""Simple atbash cipher"""

PLAIN = 'abcdefghijklmnopqrstuvwxyz1234567890'
CIPHER = 'zyxwvutsrqponmlkjihgfedcba1234567890'

def encode(plain_text):
    """
    Function that takes plain text and uses atbash cipher to encode it.
    """
    encoded, counter = '', 0
    for char in plain_text.lower():
        if char in PLAIN:
            counter += 1
            encoded += CIPHER[PLAIN.index(char)]
            if counter == 5:
                encoded += ' '
                counter = 0
    return encoded.strip()


def decode(ciphered_text):
    """
    Function that takes encrypted text and uses atbash cipher to decode it.
    """
    decoded = ''
    for char in ciphered_text.lower():
        if char in PLAIN:
            decoded += PLAIN[CIPHER.index(char)]
    return decoded