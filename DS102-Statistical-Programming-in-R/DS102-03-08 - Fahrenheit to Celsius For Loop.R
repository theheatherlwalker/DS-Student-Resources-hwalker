# defining the function f.to.c()
f.to.c <- function(TF) {
  (TF - 32) * 5 / 9
}

# create vector of temperatures in degrees F and
# assign it to variable f.temps
f.temps <- c(-40, 0, 32, 100, 212, 400)

# start the for loop
for (f in f.temps) {
  # body of for loop
  c <-f.to.c(f)
  cat(f, " ", c, "\n")
}