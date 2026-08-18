ALPHA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

def rows(letter):
    if letter == 'A':
        return [letter]
    letter_index = ALPHA.index(letter) + 1
    output = []
    for index, char in enumerate(reversed(ALPHA[:letter_index])):
        end_space = ' ' * index
        mid_space = ' ' * (((letter_index-index-1) * 2) - 1)
        line = end_space + char + mid_space + char + end_space
        if index == 0:
            output = [line] # Middle line
        else:
            if index == letter_index-1:
                line = end_space + char + end_space # Top/Bottom
            output = [line] + output + [line] # Other lines
    return output