# DS106-02-08 - Lesson 2 Hands-On - Minerals

## Report Summary: 
> Current data indicates that we can predict the presence of Gold from the mineral Antimony being present; however, this predictive model is unreliable due to too small of a sample size. We would need more data to create a more trusted predictive model.



---


## 1.  The data does not meet the minimum sample size for binary logistic regression.

> This casts doubt on the subsequent findings below.
> 
> Found with: `Confusion Matrix` — there is one cell (Ref: 0, Pred: 1) that is below 5.

```R
Confusion Matrix and Statistics

          Reference
Prediction  0  1
         0 34  8
         1  2 20
                                          
               Accuracy : 0.8438          
                 95% CI : (0.7314, 0.9224)
    No Information Rate : 0.5625          
    P-Value [Acc > NIR] : 1.615e-06       
                                          
                  Kappa : 0.6748          
                                          
 Mcnemar's Test P-Value : 0.1138          
                                          
            Sensitivity : 0.9444          
            Specificity : 0.7143          
         Pos Pred Value : 0.8095          
         Neg Pred Value : 0.9091          
             Prevalence : 0.5625          
         Detection Rate : 0.5312          
   Detection Prevalence : 0.6562          
      Balanced Accuracy : 0.8294          
                                          
       'Positive' Class : 0
```



---

## 2.  The predictive model is 84% accurate.
> With a .8438 accuracy rate, this means that roughly 84% of the time, your predictions are correct.
> Found with:  `Confusion Matrix, Accuracy : 0.8438`



---


## 3.  There is a linear relationship between presence of Antimony and presence of Gold.
> There is a linear relationship between the predictors (x) and the outcome (y).
> 
> 
> **Confirmed by graphing:** 
> ![](assets/DS106-02-08%20-%20test%20for%20linearity.png)




---


## 4.  We have independent errors.
> Residual Errors are independent from each other and predictors (x).
> There is an even distribution of points across your x axis, thus the data meets the assumption of independent errors.
> 
> **Confirmed by plotting:**
> ![](assets/DS106-02-08%20-%20plot%20for%20independent%20errors.png)
> 



> **Also confirmed with Durbin-Watson test:**
> The p-value is not statistically significant (> .05)
> and DW score is over 1.

```OUTPUT
Durbin-Watson test

data:  mylogit
DW = 1.7616, p-value = 0.3316
alternative hypothesis: true autocorrelation is not 0
```
