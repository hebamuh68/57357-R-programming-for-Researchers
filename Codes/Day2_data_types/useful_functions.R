#===================== rep , ordered =====================
cases = c(rep("b",3),rep("a",7),rep("c",5))
cases_levels = factor(cases) 
cases_rating = ordered(cases1)


#===================== rnorm =====================
# rnorm(30, 5, 0.5) generates 30 random numbers from a normal distribution 
# with a mean of 5 and a standard deviation of 0.5.
z = matrix(rnorm(30, 5, 0.5), nrow=5, ncol=5) 
y = rnorm(10, mean = 2)


#===================== seq =====================
# generate a sequence of numbers.
#This generates a sequence from 1 to 12 with a step size of 2
seq(1, 12, 2)



#===================== str =====================
# provides a compact structure of any object to understand its components.
str(cases)  
str(cases_levels)
str(z) 


#===================== Retrieving Data =====================
# First/Last 6 rows of the mtcars dataset
head(mtcars)
tail(mtcars) 
