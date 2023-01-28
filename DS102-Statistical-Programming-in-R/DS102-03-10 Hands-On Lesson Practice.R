# define the function diam()
# to calculate diameter from argument
diam <- function(w) {
  (2/2.54)*(w/(0.92 * (4/3) * pi))^(1/3)
}

# testing the diam function with a known value
w <- 0.96

# assign diam to variable d
d <- diam(w)

# print d
print(d)