#### Course Plan Week 2 Day 1

* Quick Review of CRISP DM
* Input, concepts instances and Attributes Slide (Chapter 2 from Data Mining)
* Quick Notes:
  
  + Attributes: column of the data
    Attribute Types:
      + Nominal: a catagoical variable, has limited number of unordered catagories also called a factor in R
      + Ordinal: catagoricies with an implied order: cold < warm < hot
      + numeric: continous variable such as tempurature or stock closing price
      + Binary: ( a nominal variable with only Two Class)
      + String: raw text such as 'this is a sentence', needs to be converted to something else to be used
      + Date: usually this is converted to some sort of numeric varaible
  + Instances: rows of the data, often called observations observations
  + Imputing: filling a missing value with something else, often the median
  
Slides at 
https://elitedatascience.com/data-cleaning
* Chicago SSL Demo 
* Basic Data Cleaning 
  + Check Data Types
  + Delete ID Columns
  + Remove or Impute NAs
  + Remove or combine low dimensions columns
  + Remove or replace outliers if modeling technique is suseptable to outliers
  + run numeric cleaning if noisy numeric data is found
  + Remove zero or near zero variance varibles
  + Transform text columns using NLP 
  + Convert Dates to numeric format
  
 

#### Course Plan Week 2 Day 2
Chapter 4 Data Mining  
  + Review Data Cleaning
  + 1R Rule System 
  https://www.cs.waikato.ac.nz/ml/weka/slides/Chapter4.pptx
  + Example with favorite Subject in HS vs Major is Computer Science
  + Example with height vs Gender 
  + introduction to kaggle
  + get data and setup project
  
* Would you Survive the Titanic Model understanding Project.

#### Homework Week2

Due first class of next week (week 3)

  * Find and read artical to share detailing how data science was used to solve a problem in your particular field of interest
  * Use the titanic data set with weka decision trees or rules to find the pasenger types that would have most likely survived.  Write a paragraph on your method and what you found, as if you were explaining to your supervisor what the signifcant patterns in the data and how you used particular methods to find them. Model must excede the performance of 1r (78% accurcay)





