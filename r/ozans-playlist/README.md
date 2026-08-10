# Ozan's Playlist

Welcome to Ozan's Playlist on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

R has no separate Set datatype, instead using a variety of functions to perform similar operations on vectors.

The `%in%` operator tests for set membership.

```R
2 %in% 1:10 # TRUE
12 %in% 1:10 # FALSE
```

Relevant functions include `unique` (to remove duplicates), plus `union()`, `intersect()`, `setdiff()` and `setequal()` to operate on pairs of sets.

```R
> set_1 <- c("a", "b", "c", "b", "a")
> unique(set_1) # deduplicate
[1] "a" "b" "c"

> set_2 <- c('a', "c", "d")
> union(set_1, set_2) # values in either set
[1] "a" "b" "c" "d"

> intersect(set_1, set_2) # values in both sets
[1] "a" "c"

> setdiff(set_1, set_2) # values in set_1 but not set_2
[1] "b"

> setdiff(set_2, set_1) # values in set_2 but not set_1
[1] "d"

setequal(set_1, c("c", "b", "a", "b")) # are elements the same after deduplication?
[1] TRUE
```

In each case, `set_1` and `set_2` remain unchanged.

## Instructions

Ozan is putting together a playlist for an upcoming roadtrip. He doesn"t want to hear the same track more than once, but the playlist has gotten so long that he"s having trouble remembering which tracks have already been added.

The API for Ozan"s music player only knows how to work with vectors. No explicit loops or if/else logic are possible. He needs your help!

## 1. Remove duplicate tracks

Implement the `remove_duplicates` function, which takes a playlist as a _parameter_ and _returns_ a new playlist where all the tracks are unique.

```R
> playlist <- c(
  "Court and Spark - Joni Mitchell",
  "Big Yellow Taxi - Joni Mitchell",
  "Court and Spark - Joni Mitchell"
)

> remove_duplicates(playlist)
[1] "Court and Spark - Joni Mitchell" "Big Yellow Taxi - Joni Mitchell"
```

## 2. Check whether a track has already been added

Implement the `has_track` function, which takes a playlist and a track as _parameters_ and _returns_ a boolean that indicates whether the playlist contains the track.

```R
> playlist <- c(
  "The Fashion Show - Grace Jones",
  "Dr. Funkenstein - Parliament"
)

> has_track(playlist, "Dr. Funkenstein - Parliament")
[1] TRUE

> has_track(playlist, "Walking in the Rain - Grace Jones")
[1] FALSE
```

## 3. Add tracks

Implement the `add_tracks` function, which takes a playlist and a vector of one or more tracks as _parameters_ and _returns_ a new playlist that includes the tracks.

```R
> playlist <- c("Selma - Bijelo Dugme")

> playlist <- add_tracks(playlist, "Atomic Dog - George Clinton")
> playlist
[1] "Selma - Bijelo Dugme"   "Atomic Dog - George Clinton"

> add_tracks(playlist, "Selma - Bijelo Dugme")
[1] "Selma - Bijelo Dugme"   "Atomic Dog - George Clinton"

> add_tracks(playlist, c("The Chain - Fleetwood Mac", "Selma - Bijelo Dugme"))
[1] "Selma - Bijelo Dugme"   "Atomic Dog - George Clinton" "The Chain - Fleetwood Mac"  

```

## 4. Delete tracks

Implement the `delete_tracks` function, which takes a playlist and one or more tracks as _parameters_ and _returns_ a new playlist that does not include the tracks.

```R
> playlist <- c(
  "The Treasure - Fra Lippo Lippi",
  "After the Fall - Klaus Nomi"
)

> playlist <- delete_tracks(playlist, "The Treasure - Fra Lippo Lippi")
> playlist
[1] "After the Fall - Klaus Nomi"

> delete_tracks(playlist, "I Feel the Magic - Belinda Carlisle")
[1] "After the Fall - Klaus Nomi"
```

## 5. Compare playlists

Ozan meets a new friend and wonders how similar their tastes are. 
Implement the `find_common_tracks` function, which takes two playlists and returns a new playlist containing only tracks present in both.

```R
> playlist_1 <- c("Karma - Taylor Swift", "Tired - Adele")
> playlist_2 <- c("Andromeda - Weyes Blood", "Karma - Taylor Swift")
> find_common_tracks(playlist_1, playlist_2)
[1] "Karma - Taylor Swift"
````

## Source

### Created by

- @colinleach