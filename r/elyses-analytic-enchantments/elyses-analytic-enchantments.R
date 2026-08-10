does_stack_include_card <- function(stack, card) {
  any(stack == card)
}

get_card_position <- function(stack, card) {
  if (any(stack == card)) {
    return(which(stack == card))
  }
  -1
}

is_each_card_even <- function(stack) {
  all(stack %% 2 == 0)
}

does_stack_include_odd_card <- function(stack) {
  any(stack %% 2 == 1)
}

get_first_odd_card <- function(stack) {
  if (does_stack_include_odd_card(stack)) {
    return(stack[which(stack %% 2 == 1)][1])
  }
  -1
}

get_first_even_card_position <- function(stack) {
  if (any(stack %% 2 == 0)) {
    return(which(stack %% 2 == 0)[1])
  }
  -1
}
