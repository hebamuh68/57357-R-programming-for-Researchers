another_vector = c("A","B","C", "D")
another_vector[c(1,4)]
df1 = data.frame(lable = c("protein1",
                            "protein2" ,
                            "protein3"))
df1
another_data_frame <- data.frame(alphabets = c("A", "BBB", "C", "D"),
                                 numbers = c(1, 2, 3, 4),
                                 words = c("AAA", "BBB", "CCC", "DDD"))

alpha = factor(another_data_frame$alphabets)
count = 0

for (val1 in alpha){
  for (val2 in another_data_frame$words){
    if (val1==val2){
      count = count + 1
    }
  }
  cat(val1, count)
  count = 0
  
}





copied = read.table(file ="clipboard", header = TRUE, sep="\t")
copied [-2,-2]
##==##
1==#
v=1
l=2
v==l
v!=l
seq(1:20)
rnorm(10, mean = 2)
rnorm(10, mean = 0)
rnorm(10, mean = 0, sd=1)
myfunction = function(x,y,z) x+2*y+z
myfunction(2,3,4)
missing=(c=rnorm(5))
missing
