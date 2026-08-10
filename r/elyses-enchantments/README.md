# Elyse's Enchantments

Welcome to Elyse's Enchantments on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A `vector` in R is a collection of values of the same `mode`: `numeric`, `character`, etc. If given mixed inputs, R will quietly coerce them all to a common type, usually character, which can lead to unexpected results.

## Creating vectors

If you already have all the values, use `c()` (short for "concatenate" or "combine"):

```R
x <- 10
v <- c(4, 7, x)
```

The `c()` function is very flexible, and inputs can include other vectors and ranges.
`c()` will take any number and variety of inputs, and flatten them into a single vector.

## Ranges

For a range of consecutive values (increasing or decreasing) you can use `:` notation

```R
v <- 1:5 # equivalent to c(1, 2, 3, 4, 5)
w <- 10:7 # c(10, 9, 8, 7)
```

## Accessing vector elements

As in many languages, we can use the index in brackets:

```R
> v <- 4:7
> v[2]
[1] 5
> v[2:4]
[1] 5 6 7
```

But beware: ***R uses 1-based indexing by default***. 

This is common for scientific languages (Fortran, Matlab, Julia) but differs from the zero-based indexing of C and its many successors.

Ranges can be used, as in the example above but also in the highly flexible `c()` function:

```R
v <- c(4, 7, 10)
w <- c(2, v[2:3], 11) # c(2, 7, 10, 11)
```

`vectors` (like most things in R) can be treated as mutable, using similar flexible syntax to write to single or multiple elements:

```R
> v <- 1:10
> v[2] <- 42
> v[4:6] <- c(11, 12, 13)
> v
 [1]  1 42  3 11 12 13  7  8  9 10
```

## Negative indices

Programmers familiar with other languages might guess that `v[-1]` is a way to access the last element in a vector.
Wrong!

Negative indices are actually a way to ***remove*** en element, returning a shorter vector:

```R
> v <- c(2, 4, 6)
> v[-2]
[1] 2 6  # second element gone
```

## Instructions

As a magician-to-be, Elyse needs to practice some basics. She has
a stack of cards that she wants to manipulate.

To make things a bit easier she only uses the cards 1 to 10 so her stack of cards can be represented by a vector of numbers. 
The position of a certain card corresponds to the index in the vector. 

## 1. Retrieve a card from a stack

To pick a card, return the card at index `position` from the given stack.

```R
stack <- c(1, 2, 4, 1)
position <- 3
get_item(stack, position)
# => 4
```

## 2. Exchange a card in the stack

Perform some sleight of hand and exchange the card at index `position` with the replacement card provided.
Return the adjusted stack.

```R
stack <- c(1, 2, 4, 1)
position <- 3
replacement_card <- 6
set_item(stack, position, replacement_card)
# => c(1, 2, 6, 1)
```

## 3. Insert a card at the top of the stack

Make a card appear by inserting a new card at the top of the stack.
Return the adjusted stack.

```R
stack <- c(5, 9, 7, 1)
new_card <- 8
insert_item_at_top(stack, new_card)
# => c(5, 9, 7, 1, 8)
```

## 4. Remove a card from the stack

Make a card disappear by removing the card at the given `position` from the stack.
Return the adjusted stack.

```R
stack <- c(3, 2, 6, 4, 8)
position <- 3
remove_item(stack, position)
# => c(3, 2, 4, 8)
```

## 5. Check the size of the stack

Check whether the size of the stack is equal to `stack_size` or not.

```R
stack <- c(3, 2, 6, 4, 8)
stack_size <- 4
check_size_of_stack(stack, stack_size)
# => FALSE
```

## 6. Remove the top card from the stack

Make a card disappear by removing the card at the top of the stack.
Return the adjusted stack.

```R
stack <- c(3, 2, 6, 4, 8)
remove_item_from_top(stack)
# => c(3, 2, 6, 4)
```

## 7. Insert a card at the bottom of the stack

Make a card appear by inserting a new card at the bottom of the stack.
Return the adjusted stack.

```R
stack <- c(5, 9, 7, 1)
new_card <- 8
insert_item_at_bottom(stack, new_card)
# => c(8, 5, 9, 7, 1)
```

## 8. Remove a card from the bottom of the stack

Make a card disappear by removing the card at the bottom of the stack.
Return the adjusted stack.

```R
stack <- c(8, 5, 9, 7, 1)
remove_item_at_bottom(stack)
# => c(5, 9, 7, 1)
```

## Source

### Created by

- @colinleach