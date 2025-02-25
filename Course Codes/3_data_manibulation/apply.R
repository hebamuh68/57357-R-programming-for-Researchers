#=====================  apply()  =====================
# Apply a function to the rows or columns of a matrix or an array.

# Create a matrix
mat <- matrix(1:9, nrow = 3, ncol = 3)

# Apply sum() to each row (MARGIN = 1)
row_sums <- apply(mat, 1, sum)
print(row_sums)

# Apply sum() to each column (MARGIN = 2)
col_sums <- apply(mat, 2, sum)
print(col_sums)



#=====================  lapply()  =====================
# Apply a function to each element of a list (or a vector) and returns a list. 

# Create a list
my_list <- list(a = 1:5, b = 6:10, c = 11:15)

# Apply sum() to each element of the list
list_sums <- lapply(my_list, sum)
print(list_sums)



#=====================  sapply()  =====================
# similar to lapply(), but it simplifies the result into a vector or matrix if possible. 

list_sums_simplified <- sapply(my_list, sum)
print(list_sums_simplified)






