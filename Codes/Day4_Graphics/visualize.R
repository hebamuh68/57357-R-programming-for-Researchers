# Loading Data
pd = read.csv("../../datasets/parkinson/pd.csv")


#=====================  1. Bar Plot: Comparison Across Features =====================
library(reshape)
library(ggplot2)

# Melting the data
melted <- pd %>%
  select('MDVP.Fo.Hz.', 'MDVP.Fhi.Hz.', 'MDVP.Flo.Hz.') %>%
  melt()

# plot for visualization
ggplot(melted, aes(x = variable, y = value, fill = variable)) + 
  geom_bar(stat="identity", position="dodge") + 
  labs(title = "Comparison of Acoustic Features", x = "Acoustic Features", y = "Value")
