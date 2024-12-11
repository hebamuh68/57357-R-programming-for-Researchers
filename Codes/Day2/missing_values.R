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

