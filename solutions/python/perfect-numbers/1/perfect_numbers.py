"""
Determine if a number is perfect, abundant, or deficient based on Nicomachus' 
(60 - 120 CE) classification scheme for positive integers.
"""
def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")
    
    factors = []
    for num in range(1, number):
        if number % num == 0:
            factors.append(num)
    total = sum(factors)
    if total > number:
        return "abundant"
    if total < number:
        return "deficient"
    return "perfect"