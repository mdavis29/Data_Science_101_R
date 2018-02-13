library(fivethirtyeight)
# load data set
data("college_recent_grads")

d = college_recent_grads

# show the power of wieghts
# do woman make more than men? Acutal does the % of women in the major predict the median wage
fit<-glm(median~sharewomen, d, family = 'gaussian')
fit<-glm(median~sharewomen, d, weights = d$sample_size, family = 'gaussian')

# what is the most value able major
head(d[order(d$median),])
tail(d[order(d$median),])


fit<-glm(median~ major_category , d, weights = d$sample_size, family = 'gaussian')
#  relever
d$major_category = as.factor(d$major_category)
d$major_category = relevel(d$major_category, ref  = 'Computers & Mathematics')


fit<-glm(median~ major_category , d, weights = d$sample_size, family = 'gaussian')
