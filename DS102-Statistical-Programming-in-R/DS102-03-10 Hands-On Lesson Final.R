# define the function diam()
# to calculate diameter from argument
diam <- function(w) {
  (2/2.54)*(w/(0.92 * (4/3) * pi))^(1/3)
}

# create vector of ice weights
ice_weights <- c(0.96, 1.51, 2.17, 3.85, 4.45, 6.02)

# start for loop
for (w in ice_weights) {
  d <- diam(w)
  cat(w, "grams = diameter", d, "inches \n")
}
