library(fivethirtyeight)
# load data set
data("college_recent_grads")

d = college_recent_grads

# show the power of wieghts
# do woman make more than men? Acutal does the % of women in the major predict the median wage
fit<-glm(median~sharewomen, d, family = 'gaussian')
fit<-glm(median~sharewomen, d, weights = d$total, family = 'gaussian')

# what is the most value able major
head(d[order(d$median),])
tail(d[order(d$median),])


c
#  relever
d$major_category = as.factor(d$major_category)
d$major_category = relevel(d$major_category, ref  = 'Computers & Mathematics')

fit<-glm(median~ major_category , d, weights = d$sample_size, family = 'gaussian')

# metrics explained
d = college_recent_grads
fit<-glm(median~sharewomen, d, weights = d$total, family = 'gaussian')


library(MLmetrics)
preds = predict(fit, d)
obs = d$median
MLmetrics::MAE(preds, obs)

## what happend?  NA is in the data, use a median imputer
d$sharewomen[is.na(d$sharewomen)] = median(d$sharewomen, na.rm = TRUE)
preds = predict(fit, d)
MLmetrics::MAE(preds, obs) # mean average error
MLmetrics::MAPE(preds, obs) # mean average percent error
MLmetrics::MSE(preds, obs) # mean squared error penlizes outliers
MLmetrics::R2_Score(preds, obs) # npercent varience explained
cor(preds, obs) # correlation
plot(density(obs))


# create a plot
qplot(d$median, predict(fit, d), label = substr(d$major_category,1,10), geom = 'text', 
      log = c('x','y'))
 
# logist regressiond

data("steak_survey")
d = steak_survey
d$gam01 = ifelse(d$gamble, 1,0)



fit<-glm(gam01~skydiving, d, family = 'binomial')




fit<-glm(gam01~skydiving:cheated, d, family = 'binomial')



exp(coef(fit)[6])


































