# Directions
- use R data set `mtcars`
- examine the effect of engine horsepower (`hp`) and vehicle weight (`wt`) have on quarter mile time (`qsec`)

# 1. Create a scatter plot for time and horsepower
## 1.01. Create a scatter plot with trend line.
- x-axis : engine horsepower (`hp`)
- y-axis : quarter mile time (`qsec`)
  
![[Heather Walker - DS102-08-08 - Lesson 8 Practice Hands-On - plot 01.png]]

## 1.02. What is the relationship -- positive correlation, negative correlation, or no correlation?
NEGATIVE CORRELATION.

# 2. Compute the linear regression for time and horsepower
## 2.01. Compute the linear regression
- x-axis : engine horsepower (`hp`)
- y-axis : quarter mile time (`qsec`)
  
## 2.02. What is the equation of the line?
```r
# y = mx + b
y = -27.17x + 631.70
```

## 2.03. What is the R-squared value?
```text
Adjusted R-squared:  0.485 
```

## 2.04. Is this what you would expect?
- The Adjusted R-squared value explains 48.5% of the variability of the data
- The remaining (51.5%) variability of the data is from other variables
- This makes sense -- while the power to get a car from a standing start to racing a quarter mile is based on engine horsepower, the weight of the car is a huge factor in how much power is needed to fight the inertia of a standing start.

# 3. Create a scatter plot of vehicle weight and quarter mile time
## 3.01. Create a scatter plot with trend line.
- x-axis : vehicle weight (`wt`)
- y-axis : quarter mile time (`qsec`)

![[Heather Walker - DS102-08-08 - Lesson 8 Practice Hands-On - plot 02.png]]

## 3.02. What is the relationship -- positive correlation, negative correlation, or no correlation?
NEGATIVE CORRELATION.

## 3.03. What is the equation of the line?
```r
# y = mx + b
y = -0.09567x + 4.92479
```

## 3.04. What is the R-squared value?
```text
Adjusted R-squared:  -0.00179
```

## 3.05. Is this what you would expect?
- The Adjusted R-squared value is -0.00179
- The negative R-squared value threw me -- it was not what I expected.
  But I consulted the archives (~Google~) and there were some explanations:
> $R^2$ compares the fit of the chosen model with that of a horizontal straight line (the null hypothesis). If the chosen model fits worse than a horizontal line, then $R^2$ is negative. Note that $R^2$ is not always the square of anything, so it can have a negative value without violating any rules of math. $R^2$ is negative only when the chosen model does not follow the trend of the data, so fits worse than a horizontal line.
> ...
> **Bottom line:** a negative 𝑅2R2 is not a mathematical impossibility or the sign of a computer bug. It simply means that the chosen model (with its constraints) fits the data really poorly.
  [Source](https://stats.stackexchange.com/questions/12900/when-is-r-squared-negative)
- This then makes sense, as the data points on the scatter plot do NOT follow the line.

