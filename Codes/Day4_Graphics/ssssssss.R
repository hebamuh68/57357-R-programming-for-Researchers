for_barplot = read.csv("barplot.csv")
boxplot(for_barplot,col="lightgreen",main="my box plot",xlab="Individuals", ylab="age")


boxplot(mtcars,col="lightgreen",main="my box plot",xlab="Individuals", ylab="age")



plot(mtcars$drat,mtcars$wt,pch=20,cex=2,col="red") # note that shape 20 is used for filling color but not 21


par(fig=c(0,0.8,0,0.8), new=TRUE)# setting main size of the scatter plot
plot(mtcars$drat,mtcars$wt,pch=20,cex=2.5,col="red",font.lab=2)# plottting the main graph # font=2 means bold, 3 means italic

par(fig=c(0,0.6,0.55,1), new=TRUE)#setting the location of the first boxplot for mtcars$drat
boxplot(mtcars$drat, horizontal=TRUE, axes=FALSE,col="gold")# drawing the boxplot of mtcars$drat

par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(mtcars$wt, axes=FALSE,col="gold")# drawing the boxplot ofmtcars$wt




head(iris)
summary(iris)
plot(iris)
plot(iris[,1:4])
pairs(iris[,1:4],panel=panel.smooth, pch=21,
      bg = c("red","green","blue") [unclass(iris$Species)])
