# Assigning values correctly to variables
Patient_ID = c("P001", "P002", "P003", "P004", "P005")
Age = c(65, 72, 58, 69, 74)
Tremor_Severity = c("Mild", "Moderate", "Severe", "Moderate", "Severe")
UPDRS_Score = c(25, 45, 60, 50, 70)
Dopamine_Level = c(180, 120, 90, 110, 85)

# Creating the data frame
data_frame = data.frame(Patient_ID, Age, Tremor_Severity, UPDRS_Score, Dopamine_Level)


# Print the data frame
print(data_frame)


# Summary of the data
summary(data_frame)
