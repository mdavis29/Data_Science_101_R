## German Credit Data Cheat sheat
library(caret)
library(ROCR)
data(GermanCredit)
d = GermanCredit


# create cntroller
ctr <- trainControl(
  method = "cv",
  number = 5,
  search = 'random',
  classProbs = TRUE,
  summaryFunction = twoClassSummary)

fit = train(Class~., 
            data = d,
            method = 'rpart',
            trControl = ctr,
            tuneLength = 1
            #num_trees = 10
)
labels = ifelse(d$Class %in% 'Bad',1,0)
preds = predict(fit, d, type = 'prob')[, 'Bad']
p = prediction(preds, labels)
perf = performance(p,  measure = "tpr", x.measure = "fpr")
plot(perf, col=rainbow(10))
abline(0,1)

fit = train(Class~., 
            data = d,
            method = 'rf',
            trControl = ctr,
            tuneLength = 1,
            num_trees = 5
)
labels = ifelse(d$Class %in% 'Bad',1,0)
preds = predict(fit, d, type = 'prob')[, 'Bad']
p = prediction(preds, labels)
perf = performance(p,  measure = "tpr", x.measure = "fpr")
lines(perf@x.values[[1]], perf@y.values[[1]], col='blue')


legend('bottomright', fill = 'blue', legend=paste('RF Performance',round(fit$results['ROC'],3) ))


