library(ggplot2)# the main player
library(reshape)# reshaping and melting your data from wide to long
library(RColorBrewer)# color your graph in artistic way like leonardo da vinci :)
library(scales)# rescaling your axis
library(plyr)# data manipulation
library(dplyr)# data manipulation


iris1 <- iris[,1:4]
iris2 <- melt(iris1)


ggplot(iris2, aes(x=variable, y=value)) + 
  geom_boxplot(notch=FALSE, width=0.5) +
  theme_bw() +
  theme(text = element_text(size=20, face="bold", colour="black"),
        axis.text.x = element_text(vjust=2))





ggplot(iris2, aes(x=variable, y=value, fill=variable)) + 
  geom_boxplot(notch=TRUE, width=0.5) +
  theme_bw() +
  theme(text = element_text(size=20, face="bold", colour="black"),axis.text.x = element_text(vjust=2)) +
  xlab("Flower species") +
  ylab("measured value")


#=======================================================
iris3 = read.csv("iris3.csv", header = TRUE)
unique(iris3$new)


ggplot(iris3, aes(x=variable, y=value,fill=as.factor(new))) +
  geom_boxplot(outlier.colour=NA, width=.7,notch=T,fill="gray90") +
  theme_bw() +
  geom_dotplot(binaxis="y", binwidth=0.04, stackdir="center") + 
  theme(text = element_text(size=20, face="bold", colour="black"), axis.text.x=element_text(vjust=2)) + 
  xlab("Flower part") + 
  ylab("Values") + 
  theme(legend.position='inside', 
        legend.position.inside = c(1, 1), 
        legend.justification=c(1,0.5),
        legend.background = element_blank()) + 
  guides(fill=guide_legend(title="Rank of value"))



ggplot(iris3, aes(x=variable, y=value)) + 
  geom_violin(fill="gray") +
  geom_boxplot(width=0.2, fill="black", outlier.colour=NA) +
  stat_summary(fun.y=median, geom="point", fill="white", shape=21, size=4) +
  theme_bw() +
  theme(text = element_text(size=20, face="bold", colour="black"),
        axis.text.x = element_text(vjust=2))



ggplot(diamonds, aes(x=carat,y=price)) +
  geom_point(size=5,alpha=0.5) +
  theme_bw() +
  theme(text = element_text(size=15, face="bold", colour="black"),axis.text.x = element_text(vjust=2))

ggplot(diamonds, aes(x=carat,y=price,fill=color)) +
  geom_point(shape=21,size=5,alpha=0.5) +
  theme_bw() +
  theme(text = element_text(size=15, face="bold", colour="black"),axis.text.x = element_text(vjust=2))



ggplot(diamonds, aes(x=carat,y=price,fill=table)) +
  geom_point(shape=21,size=5,alpha=0.5,color="pink") +
  geom_rug(position="jitter", size=.01,,color="pink") +
  theme_bw() +
  theme(text = element_text(size=15, face="bold", colour="black"),axis.text.x = element_text(vjust=2))


#========================================
rcc = read_xlsx("RCC.xlsx")
rcc_spec1 = rcc[c(10:12)]
rcc_spec2 = rcc[c(2:4)]

genes = merge(rcc_spec1, rcc_spec2)
melted_genes = melt(genes, id.vars = c("gender", "Side", "Grade"))

ggplot(melted_genes, aes(x=variable, y=log(value))) +
  geom_boxplot( outlier.colour = NA, fill="pink", width=0.5, position =position_dodge(0.6)) + 
  theme(axis.text.x = element_text(vjust=2),
        text = element_text(size=20, face="bold", colour="black")) +
  ylab("Fold change (log transformed)")




