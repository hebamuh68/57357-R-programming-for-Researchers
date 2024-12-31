#=====================  If Statement =====================
a = 33
b = 33
if (b != a) {
  print("a and b are not equal")
} else if (a > b) {
  print("b is greater than a")
} else {
  print("a and b are equal")
}


#===================== Loops =====================
num = c(1, 2, 3, 4, 5, 6)
cat("The length of the vector is", length(num), "\n")
for (i in num) {
  cat("The i variable contains", i, "\n")
}


#===================== Functions =====================
myfunction = function(x, y = 3) {
  c(x + 1, y + 4)
}
myfunction(1, 3)






