getw### Machine Learning with Caret
# get data
library(caret)
library(fivethirtyeight)
setwd("C:/Users/Davis/Documents/kaggle/titanic")

set.seed(1)
train.set <- read.csv("train.csv", stringsAsFactors=TRUE)
test.set  <- read.csv("test.csv",  stringsAsFactors=TRUE)

target = "Survived"
xvars = c('Fare', 'SibSp', 'Parch', 'Age')
# create one hot encoder dummy variables
dmv = dummyVars(~Sex +Embarked +Pclass,train.set )
pp = preProcess(train.set[,xvars], method = 'medianImpute')


# create feature extraction function
create_features = function(x, xvars, dmv, pp){
  x1 = predict(dmv, x)  
  x2 = predict(pp, x[, xvars])
  output = data.frame(x1, x2)
  colnames(output) = make.names(colnames(output))
  return(output)
}

to_train = data.frame(create_features(train.set, xvars, dmv, pp),
                      Class = as.factor(train[, target]))
levels(to_train$Class) = c('d', 's')




# create cntroller
ctr <- trainControl(
                  method = "cv",
                  number = 5,
                  search = 'random',
                  classProbs = TRUE,
                  summaryFunction = twoClassSummary,
                  preProcOptions = list(pcaComp = 10))

fit = train(Class~., 
            data = to_train,
            method = 'rpart',
            trControl = ctr,
            tuneLength = 5
            )

submission <- data.frame(PassengerId = test.set$PassengerId)
test_features = create_features(test.set, xvars,  dmv, pp)
submission$Survived <- predict(fit, test_features)








write.csv(submission, file = "submission.csv", row.names=FALSE)



#### GERMAN CREDIT EXAMPLE


library(caret)
data("GermanCredit")
d =GermanCredit

set.seed(2012)
# create cntroller
ctr <- trainControl(
  method = "cv",
  number = 5,
  search = 'random',
  classProbs = TRUE,
  summaryFunction = twoClassSummary,
  sample = 'smote')

fit = train(Class~., 
            data = d,
            method = 'rpart',
            trControl = ctr,
            tuneLength = 1
)


