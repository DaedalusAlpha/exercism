"""Convert numbers between different bases."""

def rebase(input_base, digits, output_base):
    """Convert digits from one base to another.
    
    Args:
        input_base (int): Source base (must be >= 2).
        digits (list): List of digit values in input_base.
        output_base (int): Target base (must be >= 2).
    
    Returns:
        list: Digits in output_base.
    
    Raises:
        ValueError: If bases < 2 or digits invalid for input_base.
    """
    if input_base < 2:
        raise ValueError("input base must be >= 2")
    if output_base < 2:
        raise ValueError("output base must be >= 2")
    coverted = 0
    for index, digit in enumerate(reversed(digits)):
        if digit < 0 or digit >= input_base:
            raise ValueError("all digits must satisfy 0 <= d < input base")
        coverted += digit * (input_base ** index)
    output_list = []
    while True:
        multiple = int(coverted / output_base)
        rem = coverted % output_base
        output_list.append(rem)
        if multiple == 0:
            return output_list[::-1]
        coverted = multiple
    