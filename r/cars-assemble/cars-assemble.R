success_rate <- function(speed) {
  if (speed == 0) {
    0
  } else if (speed >= 1 && speed <= 4) {
    1
  } else if (speed >= 5 && speed <= 8) {
    .9
  } else if (speed == 9) {
    .8
  } else if (speed == 10) {
    .77
  }
}

production_rate_per_hour <- function(speed) {
  success_rate(speed) * speed * 221
}

working_items_per_minute <- function(speed) {
  (production_rate_per_hour(speed) %/% 60)
}
