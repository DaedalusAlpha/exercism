"""Module with a function that determines how Bob will respond"""

def response(hey_bob):
    """Take hey_bob as string and determine how Bob will response"""
    phrase = hey_bob.strip()
    if phrase == "":
        return "Fine. Be that way!"
    question = phrase[-1] ==  "?"
    yelling = phrase.isupper()
    if question and yelling:
        return "Calm down, I know what I'm doing!"
    if question:
        return "Sure."
    if yelling:
        return "Whoa, chill out!"
    return "Whatever."