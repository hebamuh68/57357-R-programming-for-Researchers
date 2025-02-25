#===================== Vector =====================
vector_variable = c(1, 2, 3, 4,"5")

# Access by Index
a1 = vector_variable[1]

# Access by Range
b1 = vector_variable[1:2]
c1 = vector_variable[c(1,3,5)]


#===================== List =====================
list_variable = list("1st"=vector_variable, "2sec"=4, "3th"="5","4th"=c("D", "E", "F"))

a2 = list_variable[1]
b2 = list_variable[1:2]
c2 = list_variable[c(1,3)]

# Access by Name
third = list_variable["3th"]
second = list_variable$"2sec"

# Access nested value
fourth = list_variable[[4]][1]


#===================== Matrix =====================
matrix_variable = matrix(data = c(1, 2, 3, 4, 5, 6),
                          ncol = 3,
                          nrow = 2,
                          byrow = T,
                          dimnames = list(c("Row1", "Row2"), c("Column1", "Column2", "Column3")))


#===================== Array =====================
array_variable = array(data = c(1, 2, 3, 4),
                       dim = c(2, 2, 3),
                       dimnames = list(c("Row1", "Row2"), 
                                       c("Column1", "Column2"),
                                       c("Slice1", "Slice2", "Slice3")))


#===================== Factor =====================
simple_vector = c(1, 2, 3, 3, 2, 5, 6, 1, 1, 1, 7)

factor_variable = factor(simple_vector)
levels(factor_variable)
nlevels(factor_variable)



