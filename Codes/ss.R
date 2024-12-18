demo(graphics)

+

require(datasets)
require(grDevices); require(graphics)

x = stats::rnorm(50)
opar = par(bg = "white")
plot(x, ann = FALSE, type = "n")

#=========================================


abline(h = 0, col = gray(.90))
lines(x, col = "green4", lty = "dotted")
points(x, bg = "limegreen", pch = 21)
title(main = "Simple Use of Color In a Plot",
       xlab = "Just a Whisper of a Label",
       col.main = "blue", col.lab = gray(.8),
       cex.main = 1.2, cex.lab = 1.0, font.main = 4, font.lab = 3)

 
par(bg = "gray")
pie(rep(1,24), col = rainbow(24), radius = 0.9)

#=========================================


title(main = "A Sample Color Wheel", cex.main = 1.4, font.main = 3)

title(xlab = "(Use this as a test of monitor linearity)",
       cex.lab = 0.8, font.lab = 3)

pie.sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)

names(pie.sales) <- c("Blueberry", "Cherry",
              "Apple", "Boston Cream", "Other", "Vanilla Cream")

pie(pie.sales,
     col = c("purple","violetred1","green3","cornsilk","cyan","white"))


#=========================================


title(main = "January Pie Sales", cex.main = 1.8, font.main = 1)

title(xlab = "(Don't try this at home kids)", cex.lab = 0.8, font.lab = 3)

 par(bg="cornsilk")

n <- 10
g <- gl(n, 100, n*100)
x <- rnorm(n*100) + sqrt(as.numeric(g))
boxplot(split(x,g), col="lavender", notch=TRUE)


#=========================================


title(main="Notched Boxplots", xlab="Group", font.main=4, font.lab=1)
par(bg="white")
n <- 100
x <- c(0,cumsum(rnorm(n)))
y <- c(0,cumsum(rnorm(n)))
xx <- c(0:n, n:0)
yy <- c(x, rev(y))
plot(xx, yy, type="n", xlab="Time", ylab="Distance")


#=========================================

polygon(xx, yy, col="gray")

title("Distance Between Brownian Motions")

x <- c(0.00, 0.40, 0.86, 0.85, 0.69, 0.48, 0.54, 1.09, 1.11, 1.73, 2.05, 2.02)
par(bg="lightgray")
plot(x, type="n", axes=FALSE, ann=FALSE)


#=========================================

for_barplot = read.csv("barplot.csv",header=T)
head(for_barplot)


#=========================================



lipid = read_xlsx("CAD.xlsx")
min_LDL = min(lipid$LDL)
max_LDL = max(lipid$LDL)
min_HDL = min(lipid$HDL)
max_HDL = max(lipid$HDL)

minimum = min(min_HDL,min_LDL)
highest = max(max_HDL,max_LDL)


patients = lipid[lipid$Group == "Patients", ]
controls =  lipid[lipid$Group == "Controls", ]

par(mfrow=c(1,2))

plot(patients$LDL,type="o",col="red", ylim = c(minimum, highest))
lines(patients$HDL,type="o",col="blue", ylim = c(minimum, highest))

plot(controls$LDL,type="o",col="yellow", ylim = c(minimum, highest))
lines(controls$HDL,type="o",col="green", ylim = c(minimum, highest))





