# Elyse's Analytic Enchantments

Welcome to Elyse's Analytic Enchantments on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

We saw in the `Vectors` concept that a vector can be used in a conditional expression, giving a logical vector. 
This in turn can be used in functions such as `all()` and `any()`.

```R
v <- c(4, 7, 10)
v >= 6
#> [1] FALSE  TRUE  TRUE
all(v > 6)
#> [1] FALSE    # not all elements match this condition
any(v > 6)
#> [1] TRUE     # at least one element matches
```

The technique is much more powerful than this.

## Vector subsets

Selected elements of a vector can be pulled out with an index number or a vector of indices:

```R
v <- 5:10
v
#> [1]  5  6  7  8  9 10
v[3] 
#> [1] 7
v[c(2, 4)]
#> [1] 6 8
```

Alternatively, use a logical vector to filter the original vector, returning a subset of entries matched to a `TRUE` value:

```R
v <- 1:3
bools <- c(FALSE, TRUE, TRUE)
v[bools]
#> [1] 2 3
```

It is a small step from there to generating the boolean vector with a conditional expression:

```R
bools <- v >= 2
bools
#> [1] FALSE  TRUE  TRUE

v[bools]
#> [1] 2 3

# simpler form
v[v >= 2]
#> [1] 2 3
```

## Finding indices

The `which()` function takes a boolean argument and returns a vector of indices that yield `TRUE`.

```R
v
#> [1] 2 7 9

v[v > 5]  # returns values
#> [1]  7  9

which(v > 5) # returns indices
#> [1] 2 3
```

## Checking if an entry exists

Previous sections were about finding entries matching some criterion.

If you merely need to know if the vector contains a specific element, the `%in%` operator is used.

```R
3 %in% 1:5
#> [1] TRUE
7 %in% 1:5
#> [1] FALSE
```

This is functionally equivalent to the following code, but much more convenient:

```R
v <- 1:5
length(v[v == 3]) > 0
#> [1] TRUE
```

## Instructions

Elyse, magician-to-be, continues her training. She will be given several stacks of cards that she needs to perform her tricks.
To make things a bit easier, she only uses the cards 1 to 10.

In this exercise, use built-in methods to analyse the contents of a vector.

## 1. Determine if a card is present

Elyse wants to determine if a card is present in the stack -- in other words, if the stack contains a specific number.

```R
card = 3;
does_stack_include_card(c(2, 3, 4, 5), card);
# => TRUE
```

## 2. Find the position of a card

Elyse wants to know the position (index) of a card in the stack. 
If the card is not in the stack, return `-1`.

```R
card = 2;
get_card_position(c(9, 7, 3, 2), card);
# => 4
```

## 3. Determine if each card is even

Elyse wants to know if every card is even -- in other words, if each number in the stack is an even number.

```R
is_each_card_even(c(2, 4, 6, 7));
# => FALSE
```

## 4. Check if the stack contains an odd-value card

Elyse wants to know if there is an odd number in the stack.

```R
does_stack_include_odd_card(c(3, 2, 6, 4, 8));
# => TRUE
```

## 5. Get the first odd card from the stack

Elyse wants to know the value of the first card that is odd.  
If there is no odd card in the stack, return `-1`.

```R
get_first_odd_card(c(4, 2, 8, 7, 9));
# => 7
```

## 6. Determine the position of the first card that is even

Elyse wants to know the position of the first card that is even.
If there is no even card in the stack, return `-1`.

```R
get_first_even_card_position(c(5, 2, 3, 1));
# => 2
```

## Source

### Created by

- @colinleach