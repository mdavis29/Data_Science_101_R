---
title: "week_8_CDC_Data_Activity"
author: "Matthew Davis"
date: "October 16, 2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

### Directions
* Download the US Cause of Death Data from the CDC.

https://data.cdc.gov/NCHS/NCHS-Leading-Causes-of-Death-United-States/bi63-dtpu/data

* Create and R Markdown file using the CDC Data
* Deliveriable are an HTML or PDF markdown answering the following questions:
* Give text descriptions at each step. 

#### Directions Build and compare 3 models

* Split data into training and testing sets using the year column (year >=2016 in test)

Model 1:
* build a model using 'state', and 'year'  'Cause.Name' to predict the 'Age.adjusted.Death.Rate'
* encode the factor variables using dummyVars
* build a tuned rpart caret model using tunelength > 10 and random search
* build with 4 fold cv
print Model


Model 2:
* build a model using 'state', and 'year'  'Cause.Name' to predict the 'Age.adjusted.Death.Rate'
* encode the factor variables using dummyVars
* build a tuned svm linear caret model 
* build with 4 fold cv
print Model


Model 3:
* build a model using 'state', and 'year'  'Cause.Name' to predict the 'Age.adjusted.Death.Rate'
* encode the factor variables using dummyVars
* build a GLM with PCA pre processing caret mode 
* build with 4 fold cv
print Model

#### Select the Best Model
Evaluate all three models using MLmetrics::R2_Score() on the test set and and chooes the best model.
print results

#### Estimate the Future
Estimate what the most likely cause of death would be for person in 2018 in South Carolina
print()





