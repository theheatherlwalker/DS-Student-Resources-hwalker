---
number headings: auto, first-level 1, max 6, contents ^toc, 1.01.
---

# 1. Contents ^toc

- [[#1. Contents ^toc|1. Contents]]
- [[#2. Requirements|2. Requirements]]
	- [[#2.1. Create 2 vectors:|2.1. Create 2 vectors:]]
	- [[#2.2. Compute a test to see if these 2 vectors have the same mean.|2.2. Compute a test to see if these 2 vectors have the same mean.]]
	- [[#2.3. CODE|2.3. CODE]]
	- [[#2.4. OUTPUT|2.4. OUTPUT]]
- [[#3. Summary and Conclusions|3. Summary and Conclusions]]
	- [[#3.1. What was the problem to be solved?|3.1. What was the problem to be solved?]]
	- [[#3.2. What were the hypotheses?|3.2. What were the hypotheses?]]
	- [[#3.3. What were the results of the hypothesis test and the conclusion?|3.3. What were the results of the hypothesis test and the conclusion?]]
		- [[#3.3.1. Results|3.3.1. Results]]
		- [[#3.3.2. Conclusions|3.3.2. Conclusions]]

# 2. Requirements
Use R's built-in data set `nhtemp` that gives the mean annual temperature in New Haven, CT from 1912-1971.

> You want to test whether the average over the first 25 years of data (1912-1936) is statistically significantly different than the average over the last 25 years of data (1947-1971) .

## 2.1. Create 2 vectors:
```r
first25 <- nhtemp[1:25]
last25 <- nhtemp[36:60]
```

## 2.2. Compute a test to see if these 2 vectors have the same mean.
What type of t-test should you use? 
   __*Dependent t-test__ - the data values have a relationship to one another, being conducted at different times.*
   
## 2.3. CODE
```r
# Compute Dependent t-test on the 2 samples
t_dep <- t.test(first25, last25, paired = TRUE)
t_dep
```

## 2.4. OUTPUT
```text
Paired t-test

data:  first25 and last25
t = -3.924, df = 24, p-value = 0.0006383
alternative hypothesis: true mean difference is not equal to 0
95 percent confidence interval:
 -2.2645321 -0.7034679
sample estimates:
mean difference 
         -1.484 
```

# 3. Summary and Conclusions
## 3.1. What was the problem to be solved?
The problem to solve was to see if there was a significant difference in the *means* between:
- **Population 1** (New Haven, CT temperatures from 1912-1936)
- **Population 2** (New Haven, CT temperatures from 1947-1971).
These populations are *dependent* because the measurements were taken in the *same location* at *different times* -- there is a relationship between the data values.

## 3.2. What were the hypotheses?
The hypotheses for this *dependent t-test*:
- $H_0 : \mu_2 - \mu_1 = 0$
 > (The true difference in means IS equal to 0.)
- $H_a : \mu_2 - \mu_1 \neq 0$
> (The true difference in means is NOT equal to 0.)

## 3.3. What were the results of the hypothesis test and the conclusion?
### 3.3.1. Results
- $t$-value = -3.924
- $p$-value = 0.0006383
- mean difference = -1.484 
### 3.3.2. Conclusions
- We can verify with the below output that the $t$-test was setup properly -- the alternate hypothesis is as we created.
```text
	alternative hypothesis: true mean difference is not equal to 0
```
- We can REJECT the null hypothesis.
	- $p$-value = 0.0006383
	- $alpha$ = 0.05 (default)
	- $p < alpha$ means that the data give strong evidence to REJECT the null hypothesis -- the 2 population means are NOT equal.


