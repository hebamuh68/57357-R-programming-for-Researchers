# Sample Parkinson's data
parkinson_data <- data.frame(
  name = c("Patient_1", "Patient_2", "Patient_3", "Patient_4", "Patient_5"),
  MDVP_Fo = c(119.992, 122.400, 116.682, 113.740, 123.000),  # Fundamental frequency
  MDVP_Fhi = c(157.302, 148.650, 131.111, 130.210, 153.820), # Highest frequency
  MDVP_Flo = c(74.997, 113.819, 111.555, 104.315, 67.654),  # Lowest frequency
  HNR = c(21.033, 19.085, 21.225, 23.787, 22.037),          # Harmonic-to-noise ratio
  status = c(1, 1, 1, 0, 1)                                  # Parkinson's diagnosis (1 = Parkinson's, 0 = Healthy)
)

#=====================  1. Data Normalization =====================
# Normalizing the data using 'data.Normalization' function
library(clusterSim)

# Normalizing the data using n10 method
norm_data <- data.Normalization(parkinson_data[, -1], type = "n10", normalization = "column")

# View normalized data
print("Normalized Data:")
print(norm_data)



#=====================  2. Z-Score Normalization (Scaling) =====================
# Z-score normalization (scaling)
z_score_data <- scale(parkinson_data[, -1])  # Excluding 'name' and 'status'

# View Z-score normalized data
print("Z-Score Normalized Data:")
print(z_score_data)

# Checking the mean and standard deviation of each column after Z-score normalization
col_means <- apply(parkinson_data[, -c(1, 5)], 2, mean)
col_sds <- apply(parkinson_data[, -c(1, 5)], 2, sd)

print("Column Means:")
print(col_means)

print("Column Standard Deviations:")
print(col_sds)



#=====================  3. Log and Square-Root Transformation =====================
# Log transformation (add 1 to avoid log(0))
log_data <- log(parkinson_data[, -c(1, 5)] + 1)

# Square-root transformation
sqrt_data <- sqrt(parkinson_data[, -c(1, 5)])

# View transformed data
print("Log Transformed Data:")
print(log_data)

print("Square-Root Transformed Data:")
print(sqrt_data)



#=====================  4. Data Preparation and Cleaning =====================
# Simulated additional patient data (demographic info)
demographic_data <- data.frame(
  name = c("Patient_1", "Patient_2", "Patient_3", "Patient_4", "Patient_5"),
  age = c(65, 70, 55, 60, 75),
  gender = c("M", "F", "M", "F", "M")
)

# Merging demographic data with clinical measurements
merged_data <- merge(demographic_data, parkinson_data, by = "name")

# View merged data
print("Merged Data:")
print(merged_data)

# Checking for duplicates
duplicates <- duplicated(merged_data)
print("Duplicates:")
print(duplicates)


#=====================  5. Data Visualization =====================
library(ggplot2)
library(reshape)

# Adding status for visualization (0 = Healthy, 1 = Parkinson's)
parkinson_data$status <- c(1, 1, 1, 0, 1)

# Melting the data for visualization
melted_data <- melt(parkinson_data, id.vars = "status")

# Visualizing the normalized data
ggplot(melted_data, aes(x = variable, y = value, fill = as.factor(status))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Feature", y = "Value", fill = "Parkinson's Status") +
  theme_minimal()

