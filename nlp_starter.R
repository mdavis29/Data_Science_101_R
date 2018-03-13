## BASIC NLP WITH R
# download link
#https://www.springboard.com/blog/text-mining-in-r/
  
setwd("C:/Users/Davis/Documents/kaggle/movie_review")
data = read.csv('train.csv')

n = 1000
docs = head(data$comment_text, n)

## NLP BAG OF WORDS WITH TOXIC COMMENTS


docs = c('This is a bunch to   123123 https:// text information that I want cleaned, go stingray', 
         'this is some more prof Davis is intersted in 312123!!???, also go Stingrays')
## Basic NLP Process
# Transform and clean the text
library("tm")
docs <- Corpus(VectorSource(docs))
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)

# Text stemming (reduces words to their root form)
library("SnowballC")
docs <- tm_map(docs, stemDocument)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

mm = t(m)
colnames(mm) = rownames(m)

toxic_comments = cbind(mm, toxic= head(data$threat,n))
library(h2o)
h2o.init()
as.h2o(toxic_comments )