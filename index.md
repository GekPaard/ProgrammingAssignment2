---
title       : Predicting Height of Children from Parents' Heights
subtitle    : Developing Data Products (Coursera)
author      : GekPaard
job         : Department Pensionados
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap]   # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Introduction

- The dating site "Seconds from love" wants to improve the selection of candidates for a new client.    They noticed that some clients wanted to know what the height of the children will be before they choose a certain candidate.  
- Also the "Association of Worried Fathers" wants to have a cheap and fast way to determine if their children are really their offspring.
- The before mentionned parties have asked the firm "GekPaard" to make an App which calculates the expected height of children.

---

## The Solution

- In 1886 a famous statistician, sir Francis Galton, presented an article in which he showed that there is a linear relationship between the parents height and that of their children. (Galton, F.,  1886, Regression Towards Mediocrity in Hereditary Stature, Journal of the Anthropological Institute, 15, 246-263). 
- This dataset is used to calculate the slope an the intercept of the childrens height. On the next slide an example of R code is shown how these were calculated. The length of the parents and children were measured in inches. For the ShinyApp they are recalculated  to the international standard meter. After that the linear model is calculated.

---

## Calculation of the slope and intercept


```r
 GaltonFamilies$childHeight     <- round((GaltonFamilies$childHeight * 2.54)/100,3)
 GaltonFamilies$midparentHeight <- round((GaltonFamilies$midparentHeight * 2.54)/100,3)
 fitSon         <- lm(childHeight ~ midparentHeight, data=GaltonSon)
 round(summary(fitSon)$coef[2,1], 3) ## the slope
```

```
## [1] 0.713
```

```r
 round(summary(fitSon)$coef[1,1], 3) ## the intercept
```

```
## [1] 19.913
```

```r
 round(summary(fitSon)$coef[2,2]*100, 0) ## the standard error in cm
```

```
## [1] 6
```

--- 

## The ShinyApp

- Here you can see how the App works. Just right mouse cick on the link below and open it in a new tab page or double click with the left mouse button. 

- https://dubbelgekpaard.shinyapps.io/testMap/



