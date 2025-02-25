# Synaptic Plasticity Curve
#- Nonlinear regression.
#- Quality check of the fitted model.


#===================== Sample Data
set.seed(123)
# Stimulation frequency (Hz)
stimulation_frequency <- seq(1, 50, length.out = 50)  
# Synaptic strength
synaptic_strength = 100 / (1 + exp(-0.2 * (stimulation_frequency - 25))) + rnorm(50, 0, 5) 
data = data.frame(stimulation_frequency, synaptic_strength)


#===================== Nonlinear regression
model = nls(synaptic_strength ~ a / (1 + exp(-b * (stimulation_frequency - c))),
                        data = data, start = list(a = 100, b = 0.2, c = 25))
summary(model)

#===================== Quality check of the fitted model
plot(data$stimulation_frequency, data$synaptic_strength, main = "Nonlinear Regression Fit")
lines(data$stimulation_frequency, predict(model), col = "red")

