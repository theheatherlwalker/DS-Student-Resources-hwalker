# Requirements
Use `mtcars` data frame to:
1. create a box plot of `mpg` (miles per gallon) grouped by `cyl` (number of engine cylinders)
2. use the `summarize()` and `group_by()` functions to compute:
	- how many cars have `4 cylinders`?
	- how many cars have `6 cylinders`?
	- how many cars have `8 cylinders`?
3. Prepare a report (PPT or similar) with all these elements and code used.
# 1. create box plot of `mpg` grouped by `cyl`.
   ```r
   # create box plot of `mpg` grouped by `cyl`.
ggplot(mtcars, aes(x = cyl, y = mpg)) + 
  geom_boxplot(aes(group=cyl)) +
  # make the plot look better
  ggtitle("Select 1973-74 Cars from U.S.") + xlab("Number of Engine Cylinders") + ylab("Miles per Gallon (mpg)")
```

   ![[Heather Walker - DS102-06-13 - Lesson 6 Hands-On - box plot.png]]

## 1.02. Do these box plots make sense?
Yes -- with more cylinders, a car usually uses more gas.

# 2. use the `summarize()` and `group_by()` functions to compute and answer questions.
*CODE:*
```r
# summarize count of cars by group: 4 cyl, 6 cyl, and 8 cyl.
mtcars %>% group_by(cyl) %>% summarize(count = n())
```

*RESULT:*
```text
# A tibble: 3 × 2
    cyl count
  <dbl> <int>
1     4    11
2     6     7
3     8    14
```

## 2.01. How many cars have `4 cylinders`?
11 cars (see line 1)
## 2.02. How many cars have `6 cylinders`?
7 cars (see line 2
## 2.03. How many cars have `8 cylinders`?
14 cars (see line 3)

