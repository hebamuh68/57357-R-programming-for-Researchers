#===================== Relational Operators =====================
# == : Checks equality.
# != : Checks inequality.
# > : Checks if the left value is greater than the right.
# >= : Checks if the left value is greater than or equal to the right.
# < : Checks if the left value is less than the right.
# <= : Checks if the left value is less than or equal to the right.

var_1 = c(1, 2, 3, 10, 11)
var_2 = 10
var_1 == var_2
var_1[var_1 == var_2]


#===================== Logical Operators =====================
# & : Logical AND.
# | : Logical OR.
# ! : Logical NOT.

var_3 <- 10
var_3 == var_2 & var_3 >= var_2 
var_3 == var_2 & var_3 > var_2 


#===================== Membership Operators =====================
# %in% : Checks if an element exists in a vector.

vector_1 <- c(1:5)
value_a <- 4
value_b <- 6
value_a %in% vector_1 
value_b %in% vector_1 
