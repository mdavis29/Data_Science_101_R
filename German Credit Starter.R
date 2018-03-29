## German Credit Data Cheat sheat
library(caret)
library(ROCR)
data(GermanCredit)
d = GermanCredit

set.seed(2012)
train_index = createDataPartition(d$Class, p =.2, list = FALSE)
train_set = d[train_index,] 
test_set = d[-train_index,]

# create cntroller
ctr <- trainControl(
  method = "cv",
  number = 4,
  classProbs = TRUE,
  summaryFunction = twoClassSummary)

fit = train(Class~., 
            data = train_set,
            method = 'rf',
            trControl = ctr,
            metric = 'ROC',
            num_trees = 2
)
labels = ifelse(test_set$Class %in% 'Bad',1,0)
preds = predict(fit, test_set, type = 'prob')[, 'Bad']
p = prediction(preds, labels)

perf = performance(p,  measure = "tpr", x.measure = "fpr")
plot(perf, col='blue')
lines(perf@x.values[[1]], perf@y.values[[1]], col='blue')

abline(0,1, col = 'red')
auc = round(MLmetrics::AUC(preds, labels), 3)



legend('bottomright', fill = 'blue', legend=c(paste('RF Performance',auc ))


