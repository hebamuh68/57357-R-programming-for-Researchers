# Read the data
clinical_data = read.csv("clinical_data.csv")

# Extract the T5 column from the data
T5 = clinical_data$T5
summary(T5)

# The number of missing values in the T5
# NA's count = 91
na_count = sum(is.na(T5))

# Remove missing values
T5_no_NA = na.omit(T5)
summary(T5_no_NA)

