library(MASS)
library(ade4)
library(rgl)
library(e1071)
library(R2HTML)
library(cluster) # last 3 should be loaded before cluster
library(clusterSim) # all above should be loaded before clusterSim
library(reshape)
library(ggplot2)


a <- c(1,2,3,4,5)
b <- c(1,2,3,4,10)
data <- data.frame(a=a,b=b)
melted <- melt(data)
melted$x <- c(1,2,3,4,5,1,2,3,4,5)
ggplot(melted, aes(x, value, fill=variable)) + geom_bar(stat="identity", position="dodge")


norm1 <- data.Normalization(data,type="n10",normalization="column")
norm1
melted1 <- melt(norm1)
melted1$x <- c(1,2,3,4,5,1,2,3,4,5)
ggplot(melted1, aes(x, value, fill=variable)) + geom_bar(stat="identity", position="dodge")


scale(data)
sd(data$a)# calling SD of column a
mean(data$a) # calling mean of column a



c <- c(100,200,300,400,500)
d <- c(11,12,13,14,15)
paste(c,d, sep="/")

data1 <- data # just make a copy of data to work on
data1$newcol <- c # should be same length
data1
cbind(data1, d)

data2 <- data.frame(a=c(23,53,45),b=c(11,12,13),newcol=c(992,993,995))
data2


mergedDB <- rbind(data1, data2)
mergedDB



group1 <- data.frame(name=c("ali","amr","soha"), age=c(15,20,27), height=c(140,122,162),
                     gender=c("m","m","f"))
group2 <- data.frame(name=c("ali","amr","soha"), birthday=c("Nov","Jan","Dec"), weight=c(43,40,62))
group3 <- data.frame(name=c("ali","amr","soha"), day=c("Nov","Jan","Dec"))
merge(merge(group1, group2, group3)


apply(data, 1, sum)
se <- function(x) sd(x) / sqrt(length(x))

apply(data, 2, se)
sapply(data, FUN=se)

data$f <- c("M", "M", "M", "F", "F")
tapply(data$b, data$f, FUN=mean)


added <-data.frame(a=c(2,3,5), b=c(11,12,13), f=c("M", "F", "F"))
ddata <- rbind(data, added)
duplicated(ddata$a)

unique <- ddata[!duplicated(ddata$a), ]
unique

