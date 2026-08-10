"""Raindrops is a slightly more complex version of the FizzBuzz challenge, 
a classic interview question."""

def convert(number):
    """If a given number:
    is divisible by 3, add "Pling" to the result.
    is divisible by 5, add "Plang" to the result.
    is divisible by 7, add "Plong" to the result.
    is not divisible by 3, 5, or 7, the result should be the number as a string.
    """
    output = ''
    if number % 3 == 0:
        output += 'Pling'
    if number % 5 == 0:
        output += 'Plang'
    if number % 7 == 0:
        output += 'Plong'
    if output != '':
        return output
    return str(number)