# DS105-09-11 - Lesson 9 Hands-On - Power Analysis

**Directions**

> For this Hands On, you will be performing power analyses in `G*Power` for a variety of different tests.

---

**Requirements**

> For each scenario, please complete the following:
>
> - Determine what analysis you would run
> - Conduct an a priori power analysis to determine the sample size for that analysis
> - Report your chosen test and the required sample size in a text document or presentation.
>

<p><mark style="background: #ABF7F7A6;"> Additional Info! </mark> You may want to watch <a href="[https://vimeo.com/447003939](https://vimeo.com/447003939)">this recorded live workshop</a> before beginning the hands-on, which goes over a similar example.</p>


---


#### Highlighting Key

<mark style="background: #ADCCFFA6;">  DV  </mark>  = Dependent Variable, what are you trying to predict / determine
<mark style="background: #FFB86CA6;">  IV  </mark> = Independent Variable, or levels of Independent Variable
<mark style="background: #FFF3A3A6;">  indicating information  </mark> = hints as to what kind of analysis is needed



___



## Scenario 1

> A company is hoping to collect data about the different marketing strategies they have undertake via social media. They want to measure the <mark style="background: #ADCCFFA6;"> number of people who follow their posts </mark> on <mark style="background: #FFB86CA6;"> Facebook </mark>, <mark style="background: #FFB86CA6;"> Twitter </mark>, and <mark style="background: #FFB86CA6;"> LinkedIn </mark> to determine if one site works better than the others.



*Analysis to use:*

#### 1-way ANOVA
- Could be *t*-test or ANOVA, but *t*-tests only allow for 2 levels, so that’s ruled out.
- 1 x Independent Variable with 3 levels

<p><mark style="background: gold;"> Required total sample size: <b>159</b> </mark></p>



![](assets/DS105-09-11%20-%20screenshot%20-%201-way%20ANOVA.png)


---



## Scenario 2

> You have been hired to <mark style="background: #FFF3A3A6;"> predict </mark> <mark style="background: #ADCCFFA6;"> how roofing companies will fare in the upcoming years </mark>. There are <mark style="background: #FFB86CA6;"> several predictors: yearly hurricanes, winter storms, shingle prices, and GDP. </mark>



*Analysis to use:*

#### Linear Regression
- `predict` = keyword for regression
- continuous Dependent Variable
- continuous 4 x Independent Variable

<p><mark style="background: gold;"> Required total sample size: <b>85</b> </mark></p>

![](assets/DS105-09-11%20-%20screenshot%20-%20Linear%20Regression.png)


---



## Scenario 3

> A hospital has contracted with you to determine how to improve patient care, as measured continuously by both <mark style="background: #ADCCFFA6;"> pain level </mark> and <mark style="background: #ADCCFFA6;"> disability level </mark>. They are examining these metrics <mark style="background: #FFB86CA6;"> upon admission to the hospital and at discharge from the hospital, </mark> and they are <mark style="background: #FFF3A3A6;"> comparing their current standard of care to one where they check on the patients every hour. </mark>

 

*Analysis to use*: 

#### MANOVA repeated measures, within-between interaction
- related continuous Dependent Variables
- change-over-time component
- 2 categories, between-subjects design

<p><mark style="background: gold;"> Required total sample size: <b>128</b> </mark></p>

![](assets/DS105-09-11%20-%20screenshot%20-%20MANOVA.png)


___
`### END`