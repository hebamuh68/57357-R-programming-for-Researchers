# Loading the dplyr package
suppressMessages(library(dplyr))

# Create a dummy dataset for Parkinson's Disease
gp <- c("early", "early", "early", "advanced", "advanced", "advanced", "control", "control", "control", "control", "control")
age <- c(55, 60, 65, 70, 75, 80, 25, 30, 35, 40, 45)
tremor_severity <- c(3, 4, 2, 6, 7, 8, 0, 0, 1, 1, 2)  # 0: no tremors, 10: severe tremors
medication_use <- c("yes", "yes", "no", "yes", "yes", "no", "no", "no", "yes", "yes", "no")

# Create the data frame
pd_data <- data.frame(gp = gp, age = age, tremor_severity = tremor_severity, medication_use = medication_use)


#=====================  1. Filter: Keep Rows Matching Criteria =====================
# Filter for advanced stage patients who are using medication
advanced_medicated <- pd_data %>%
  filter(gp == "advanced" & medication_use == "yes")


#=====================  2. Select: Pick Columns by Name =====================
# Select columns age and tremor_severity
age_tremor_data <- pd_data %>%
  select(age, tremor_severity)



#=====================  3. Arrange: Reorder Rows =====================
# Arrange the data by tremor_severity in ascending order
arranged_data <- pd_data %>%
  arrange(tremor_severity)


#=====================  4. Mutate: Add New Variables =====================
# Add a new column indicating tremor severity as a percentage
pd_data_with_percentage <- pd_data %>%
  mutate(tremor_percentage = tremor_severity / 10 * 100)


#=====================  5. Summarize: Reduce Variables to Values =====================
# Calculate mean age and tremor severity by group
summary_stats <- pd_data %>%
  group_by(gp) %>%
  summarise(mean_age = mean(age, na.rm = TRUE), mean_tremor_severity = mean(tremor_severity, na.rm = TRUE))


#=====================  6. Using across for Multiple Columns =====================
# Apply mean and standard deviation to age and tremor_severity
summary_stats <- pd_data %>%
  group_by(gp) %>%
  summarise(across(c(age, tremor_severity), list(mean = mean, sd = sd), na.rm = TRUE))







