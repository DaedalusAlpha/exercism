"""Functions to translate phrases/words into pig latin"""

def translate(text):
    """Translate a phrase into pig latin"""
    phrase = text.split(" ")
    for index, word in enumerate(phrase):
        phrase[index] = translate_word(word)
    return " ".join(phrase)

def translate_word(text):
    """Translate a word into pig latin"""
    vowels = "aeiouy"
    vowel, vowel_index = "", -1
    for index, letter in enumerate(text):
        if letter in vowels:
            vowel, vowel_index = letter, index
            break
    output = ""
    if text[0:2] in {"xr","yt"}:
        output = text + "ay"
    elif vowel_index == 0:
        if vowel == "y":
            output = text[vowel_index+1:] + text[0:vowel_index+1] + "ay" 
        else:
            output = text + "ay"
    elif vowel_index >= 1:
        if text[vowel_index-1:vowel_index+1] == "qu":
            output = text[vowel_index+1:] + text[0:vowel_index+1] + "ay"
        else:
            output = text[vowel_index:] + text[0:vowel_index] + "ay" 
    return output