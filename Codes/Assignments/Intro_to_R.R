# 1-2-3- Generate
A = c(rep("patient", 30),rep("controls", 20) )
B = c(1:45,rep(NA, 5) )
C = c(rnorm(50,2))

# 4- Round column C to whole numbers and name the new column as D
D = round(C)

# 5- Create a data frame called ABD containing columns A, B and D
ABD = data.frame(col_A = A,
                 col_B = B,
                 col_D = D)

# 6-7- Remove missing data from file ABD and name it ABDnew
ABDnew = na.omit(ABD)

# 8- Create a matrix with 5 columns containing 20 random numbers
m = matrix(rnorm(20),ncol=5)