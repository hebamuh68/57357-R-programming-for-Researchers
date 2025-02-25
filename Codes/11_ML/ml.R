library(e1071) # For SVM
library(caret) # For Confusion Matrix
library(caTools) # For Data Splitting
library(ggplot2)
library(randomForest) 


#======================= Clustering
Data = rbind(matrix(rnorm(100, sd = 0.3), ncol = 2),
              matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2))
colnames(Data) = c("tiredness rate", "headache rate")


#Interpretation:
#Cluster 1: Low symptoms (tiredness and headache rates close to 0).
#Cluster 2: High symptoms (tiredness and headache rates close to 1).
#Between-cluster SS / Total SS = 75.5%**: Indicates strong clustering.
cl = kmeans(Data, 2)

plot(Data, col = cl$cluster)
points(cl$centers, col = 1:2, pch = 8, cex = 2)


#======================= Classification
Control.data = matrix(data = rnorm(50000, mean = 0, sd = 0.7), nrow = 1000, ncol =50) 
colnames(Control.data) = rep("Control", 50)
Cancer.data = matrix(data = rnorm(50000, mean = 4, sd = 3), nrow = 1000, ncol = 50) 
colnames(Cancer.data) = rep("Cancer", 50)
Data.mat = data.frame(cbind(Control.data, Cancer.data))
rownames(Data.mat) = paste0("Gene_", seq(1:1000))
Model.data = data.frame(t(Data.mat))

#Assign the labels
Model.data$Class.Labels = ifelse(grepl("Control", rownames(Model.data)), "Control", "Cancer")
Model.data$Class.Labels = as.factor(Model.data$Class.Labels)


#Split the data into training and testing
set.seed(123)
split = sample.split(Model.data$Class.Labels, SplitRatio = 0.6)
Training.set = Model.data[split, ]
Test.set = Model.data[!split, ]
Test = Test.set[,-c(length(Test.set))]
classifier = svm(formula = Class.Labels ~ .,
                  data = Training.set,
                  type = 'C-classification',
                  kernel = 'linear')

Pred.Labels = predict(classifier, newdata = Test)
# Generate Confusion Matrix
conf_matrix = confusionMatrix(Pred.Labels, Test.set$Class.Labels)
conf_matrix



#======================= Random Forest 
data("iris")
# Calculate the size of each of the data sets:
split = sample.split(iris$Species, SplitRatio = 0.6)
# Assign the data to the correct sets
training = iris[split,]
test = iris[!split,]

# Perform training - OOB Error
rf_classifier = randomForest(Species ~ ., data=training,
                             ntree=15, importance=TRUE)
x = data.frame(rf_classifier[["err.rate"]])
ggplot(x , aes(x = 1:nrow(x), y = OOB)) + geom_line() +
  theme_minimal()+
  xlab("ntree")


rf_classifier2 = randomForest(Species ~ ., data=training, 
                              ntree=200, importance=TRUE)
x = data.frame(rf_classifier2[["err.rate"]])
ggplot(x , aes(x = 1:nrow(x), y = OOB)) + geom_line() +
  theme_minimal()+ xlab("ntree")


prediction_for_table = predict(rf_classifier,test[,-5])
confusion_matrix = confusionMatrix(test[,5],prediction_for_table)













