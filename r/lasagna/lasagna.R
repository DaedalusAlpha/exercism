expected_minutes_in_oven <- function() {
    60
}

remaining_time_in_minutes <- function(actual) {
    expected_minutes_in_oven() - actual
}

prep_time_in_minutes <- function(layers) {
    2 * layers
}

elapsed_time_in_minutes <- function(layers, minutes) {
    prep_time_in_minutes(layers) + minutes
}