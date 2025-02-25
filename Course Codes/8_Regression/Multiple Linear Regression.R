# Brain Activity Prediction
#- Multiple linear regression.
#- Quality check of the fitted model.
#- Testing multicollinearity.


#===================== Sample Data
set.seed(123)
# Age in years
age = rnorm(50, 30, 5)  
# Stress level (scale 0-10)
stress_level = runif(50, 0, 10)  
# Sleep quality (scale 0-10)
sleep_quality = runif(50, 0, 10)  
# fMRI signal
brain_activity <- 3 * age - 2 * stress_level + 1.5 * sleep_quality + rnorm(50, 0, 5) 
data = data.frame(age, stress_level, sleep_quality, brain_activity)


#===================== Multiple linear regression
model = lm(brain_activity ~ age + stress_level + sleep_quality, data = data)
summary(model)


#===================== Quality check of the fitted model
plot(model)


#===================== Testing multicollinearity
library(car)
# Variance Inflation Factor
vif(model) 

