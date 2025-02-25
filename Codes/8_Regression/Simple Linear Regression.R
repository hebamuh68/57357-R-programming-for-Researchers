# Neuron Firing Rate vs. Stimulus Intensity
#- Simple linear regression.
#- Global validation of linear model assumptions.
#- Testing outliers and dropping values.


#===================== Sample Data
set.seed(123)
# Stimulus intensity (independent variable)
stimulus_intensity = runif(50, 0, 10) 
# Neuron firing rate (dependent variable)
neuron_firing_rate = 2 * stimulus_intensity + rnorm(50, 0, 2) 
data = data.frame(stimulus_intensity, neuron_firing_rate)


#===================== Simple linear regression
model = lm(neuron_firing_rate ~ stimulus_intensity, data = data)
summary(model)


#===================== Global validation of linear model assumptions
library(gvlma)
gvlma(model)


#=====================  Testing outliers
library(car)
outlierTest(model)


#=====================  Dropping outliers (if necessary)
data_clean = data[-c(which(outlierTest(model)$p < 0.05)), ]
model_clean = lm(neuron_firing_rate ~ stimulus_intensity, data = data_clean)
summary(model_clean)
