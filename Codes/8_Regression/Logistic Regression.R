# Predicting Depression Diagnosis
#- Logistic regression.
#- Cross-validation.


#===================== Sample Data
set.seed(123)
# Brain connectivity metric
brain_connectivity = rnorm(100, 0.5, 0.1)  
# Physical activity level (scale 0-10)
physical_activity <- runif(100, 0, 10)  
# Binary outcome (0 = no, 1 = yes)
depression_diagnosis = rbinom(100, 1, plogis(-2 + 3 * brain_connectivity - 0.5 * physical_activity))  
data = data.frame(brain_connectivity, physical_activity, depression_diagnosis)


#===================== Logistic regression
model = glm(depression_diagnosis ~ brain_connectivity + physical_activity,
             data = data, family = binomial)
summary(model)

#===================== Cross-validation
library(caret)
set.seed(123)

train_control = trainControl(method = "cv", number = 10)
model_cv = train(factor(depression_diagnosis) ~ brain_connectivity + physical_activity,
                  data = data, method = "glm", family = "binomial", trControl = train_control)
print(model_cv)
