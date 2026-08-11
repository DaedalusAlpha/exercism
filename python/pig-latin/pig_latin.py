def translate(text):
    vowels = "aeiou"
    
 
    
    
    v_index = -1
    output = text
    for i, letter in enumerate(text):
        if letter in vowels:
            v_index = i
            break
    y_index = -1
    for i, letter in enumerate(text):
        if letter == "y":
            y_index = i
            break
    # Rule 1, vowel at start or special cases
    if v_index == 0 or text[0:2] in ("xr","yt","ay"):
        output = text + "ay"
    elif v_index >= 1 or y_index > v_index: #There is a vowel, and y is not first
        # Rule 3, QU after 0+ consonants
        if text[v_index-1:v_index+1] == "qu":
            output = text[v_index+1:] + text[0:v_index+1] + "ay"
        # Rule 2, vowel after 1+ consonants
        elif "y" not in text[0:v_index]:
            output = text[v_index:] + text[0:v_index] + "ay"   
        # Rule 4, Y after 1+ consonants    
        elif "y" in text:
            output = text[y_index:] + text[0:y_index] + "ay" 
    return output        