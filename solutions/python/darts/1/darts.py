"""Calculate dart game scores based on distance from center."""

def score(x, y):
    """Return dart score (0, 1, 5, or 10) based on coordinates.
    
    Args:
        x (float): X coordinate.
        y (float): Y coordinate.
    
    Returns:
        int: Score based on distance from origin.
    """
    radius_squared = x**2 + y**2
    if radius_squared > 100:
        return 0
    if radius_squared > 25:
        return 1
    if radius_squared > 1:
        return 5
    return 10