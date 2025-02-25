# cor returns correlation coefficient (r) only
# cor.test gives both (r) and p value.

#============================================================ 
library("MASS")  # this datasets is found in MASS package or u can load it directly
library("ggplot2") # for plotting
library("GGally") # an extention for ggplot2
library("car") # for some graphical and analytical functions
library("PerformanceAnalytics")# we will need this package for correlation later
library("plyr") #data manipulation
library("dplyr") #data manipulation "should be installed after plyr"
library("RColorBrewer") #this is to give a nice coloring for ur figures


#====================== Cat Example ========================== 
# both p-value and r indicates signficant correlation
# cats body weight (kg) versus their heart weight (g)
head(cats)
summary(cats)


# Check the normality of both Bwt and Hwt
shapiro.test(cats$Bwt)
shapiro.test(cats$Hwt)


# both are not normally distributed (Spearman or Kendall)
# rho is 0.7908427 => strong positive correlation 
cor.test(cats$Bwt, cats$Hwt, method = "spearman")


# scatter plot the cat body weight versus their heart weight
ggplot(cats, aes(x=Bwt, y=Hwt)) +geom_point(size=5)+
  # add the correlation line
  geom_smooth(method=lm)


#====================== Players Example ========================== 
player1 = c(1,2,3,4,5,6,7,8,9,10)
player2 = c(3,6,5,4,7,8,9,4,5,6)
players = data_frame(player1, player2)

# Check the normality of both Bwt and Hwt
shapiro.test(player1)
shapiro.test(player2)


# both are normally distributed (Pearson)
# there is no significant linear relationship 
cor.test(player1,player2,  method = "pearson")


# scatter plot the cat body weight versus their heart weight
ggplot(players, aes(x=player1, y=player2)) +geom_point(size=5)+
  # add the correlation line
  geom_smooth(method=lm)


#====================== Correlation Matrix ========================== 
#  dataset used is mtcars from R's datasets package.

# Selecting Relevant Variables
cars = mtcars %>% select(disp, hp, drat, wt, qsec)
shapiro.test(cars$disp)


# Check the normality 
shapiro.test(cars$disp)
shapiro.test(cars$hp)
shapiro.test(cars$drat)
shapiro.test(cars$wt)
shapiro.test(cars$qsec)


# Since some variables are normal and others are not, 
# Spearman safest option as it works for both parametric and non
cor(cars, method = "spearman") # this is r
# If the data contains missing values
cor(cars, method = "spearman", use = "pairwise.complete.obs") # this is r


# Visualization
# 1) A quick visualization of relationships
pairs(cars)
# 2) The GGally package provides a more detailed plot
# ***: Highly significant (p<0.001p < 0.001).
# **: Significant (p<0.01p < 0.01).
# *: Marginally significant (p<0.05p < 0.05).
ggpairs(cars)

























# calculate p for several variables
# to generate correlation probability in a handy table
cor.prob <- function(X) {
  # Compute the correlation matrix
  R <- cor(X, use = "pairwise.complete.obs")
  
  # Create a matrix to store p-values
  P <- matrix(NA, nrow = ncol(X), ncol = ncol(X))
  colnames(P) <- colnames(X)
  rownames(P) <- colnames(X)
  
  # Loop through the upper triangle of the correlation matrix
  for (i in 1:(ncol(X) - 1)) {
    for (j in (i + 1):ncol(X)) {
      # Calculate the number of complete pairs
      complete_pairs <- sum(!is.na(X[, i]) & !is.na(X[, j]))
      dfr <- complete_pairs - 2  # Degrees of freedom
      
      if (dfr > 0) {
        r <- R[i, j]  # Correlation coefficient
        Fstat <- (r^2 * dfr) / (1 - r^2)  # F-statistic
        P[i, j] <- 1 - pf(Fstat, 1, dfr)  # P-value
        P[j, i] <- P[i, j]  # Mirror p-value in symmetric matrix
      }
    }
  }
  
  # Set diagonal elements to NA (no self-correlation p-values)
  diag(P) <- NA
  
  # Return a list containing correlation and p-value matrices
  list(correlation = R, p.value = P)
}

flattenSquareMatrix <- function(cor_matrix, p_matrix) {
  if (!is.matrix(cor_matrix) || !is.matrix(p_matrix)) {
    stop("Both inputs must be square matrices.")
  }
  if (!identical(rownames(cor_matrix), colnames(cor_matrix)) ||
      !identical(rownames(p_matrix), colnames(p_matrix))) {
    stop("Row and column names must match for both matrices.")
  }
  if (!identical(dim(cor_matrix), dim(p_matrix))) {
    stop("Correlation and p-value matrices must have the same dimensions.")
  }
  
  ut <- upper.tri(cor_matrix)
  data.frame(
    i = rownames(cor_matrix)[row(cor_matrix)[ut]],
    j = colnames(cor_matrix)[col(cor_matrix)[ut]],
    cor = cor_matrix[ut],
    p = p_matrix[ut]
  )
}

results = cor.prob(cars)
readable_table = flattenSquareMatrix(results$correlation, results$p.value)
