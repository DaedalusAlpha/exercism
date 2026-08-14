OPERANDS = { "plus": "+", "minus": "-", "multiplied by": "*", "divided by": "/" }

def answer(question):
    result = question[8:-1]
    for key, val in OPERANDS.items():
        result = result.replace(key, val)
    result = result.split()
    if (len(result) > 1 and 
        result[1] not in OPERANDS.values() and 
        not result[1].lstrip("-").isdigit()):
            raise ValueError("unknown operation")
    try:
        while len(result) > 1:
            result = [str(int(eval(" ".join(result[:3]))))] + result[3:]
        return int(result[0])
    except:
        raise ValueError("syntax error")
