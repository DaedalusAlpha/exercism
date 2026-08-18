COLORS = [
            "black",
            "brown",
            "red",
            "orange",
            "yellow",
            "green",
            "blue",
            "violet",
            "grey",
            "white",
            ]

def label(colors):        
    ohms = (COLORS.index(colors[0]) * 10 + COLORS.index(colors[1])) * (10 ** COLORS.index(colors[2]))
    for divisor, unit in [(1e9, "gigaohms"), (1e6, "megaohms"), (1e3, "kiloohms"), (1, "ohms")]:
        if ohms >= divisor:
            return f"{int(ohms / divisor)} {unit}"
    return f"{ohms} ohms"