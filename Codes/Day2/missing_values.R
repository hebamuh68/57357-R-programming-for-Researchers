#===================== Identifying Missing Values =====================

missing = c(3, 4, 6, 76, NA, 54, NA)
summary(missing)
is.na(missing)


#===================== Handling Missing Data =====================
a1 = c(1, 2, 3, 4, 5)
a2 = c(23, NA, 52, 1, NA)
data3 = data.frame(a1, a2)
md = na.omit(data3)


#===================== Working with NA in Calculations =====================
mean(a1)

# To calculate the mean of a vector while ignoring missing values
mean(a2, na.rm = TRUE)


#==========================================================================
# Types of missing data—MCAR, MAR, and MNAR
#==========================================================================


#===================== MCAR (Missing Completely at Random) =====================
#Definition: Data is MCAR when the missing values are completely random and do 
# not depend on the observed or unobserved data.

#Example in Parkinson’s Disease Data: Imagine a dataset where the age or motor 
#scores for some Parkinson's patients are missing randomly due to technical issues 
# (e.g., sensor failure).

age <- c(65, 70, NA, 75, 80, NA, 85, 90)
motor_score <- c(10, 12, 9, 13, 11, 14, NA, 10)

# Check missingness using is.na
is.na(age)  
is.na(motor_score)

# Summary of the dataset
summary(age)
summary(motor_score)

# If missing values are random (MCAR), we can simply omit them
clean_data <- na.omit(data.frame(age, motor_score))
clean_data


#===================== MAR (Missing at Random) =====================
# Definition: Data is MAR when the missingness is related to the observed data 
# but not the missing values themselves.

# Example in Parkinson’s Disease Data: Suppose the data for the "motor_score" 
# is missing more frequently for younger patients. The missingness is related to 
# the observed "age" but not to the motor score itself.

age <- c(65, 70, 55, 75, 80, 60, 85, 90)
motor_score <- c(10, 12, NA, 13, 11, 14, NA, 10)

# Check for missingness in motor_score based on age
is.na(motor_score)  

# Handle MAR by imputing missing motor scores based on age
data <- data.frame(age, motor_score)
imputed_data <- mice(data, method = 'pmm', m = 5)
completed_data <- complete(imputed_data)

# Show completed data
completed_data


#===================== MNAR (Missing Not at Random) =====================
# Definition: Data is MNAR when the missingness is related to the unobserved data 
# itself. This is the hardest type of missing data to handle.

# Example in Parkinson’s Disease Data: Suppose the motor score is missing more 
# often for patients with severe symptoms because they are less likely to complete 
# the survey. Here, the missingness depends on the severity of the motor score itself, 
# which is unobserved.

age <- c(65, 70, 75, 80, 85)
motor_score <- c(10, NA, 8, NA, 6)

# Check missingness
is.na(motor_score) 

# For MNAR, we cannot easily impute or omit without bias
# Instead, more sophisticated methods like modeling selection bias can be used
# Example approach - use a selection model (not directly implemented in base R)















