data = read.csv("day_1.csv", header = T)
copied = read.table(file="clipboard",header=TRUE,sep="\t")

A <- c(2,4,5,6,4,5,6,42,2)
B <- c(34,5,6,4,3,5,98,5,3)
C <- c(43,23,32,23,52,23,54,23,54)
copied <- data.frame(A,B,C)
copied