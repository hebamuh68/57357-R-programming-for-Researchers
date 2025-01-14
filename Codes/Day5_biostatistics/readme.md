## **Introduction to Graphics in R**

### **Topics Covered**

-   **Base Graphics**
    -   Line Chart
    -   Bar Chart
    -   Histogram
    -   Box and Whisker Plot
    -   Combining Plots
    -   Scatterplot Matrix
-   **Advanced Graphics with ggplot2**
    -   Box Plot and Whiskers
    -   Box Plot Overlaid with Dot Plot
    -   Violin Plot
    -   Scatter Plot
    -   Error bars
    -   Stacked Bar Plot
-   **Heat Map Analysis**
    -   Basic Heat Map
    -   Advanced Heat Map

------------------------------------------------------------------------

### **1. Base Graphics Examples**

#### **Line Chart**

```{r}
x <- stats::rnorm(50)
plot(x, type = "l", col = "blue", main = "Line Chart", xlab = "Index", ylab = "Value")
```
![image](https://github.com/user-attachments/assets/1334c17a-bfbe-415f-a28e-f694b545bd03)


#### **Bar Chart**

The graphical representation of categorical data.

```{r}
bar_data <- table(mtcars$cyl)
barplot(bar_data, col = "cyan", main = "Bar Chart of Cylinders", xlab = "Cylinders", ylab = "Frequency")
```
![image](https://github.com/user-attachments/assets/6742a125-96b6-4402-b511-e373a88ebf9e)


#### **Histogram**

The graphical representation of quantitative data.

```{r}
hist(mtcars$mpg, col = "purple", main = "Histogram of MPG", xlab = "MPG", breaks = 10)
```
![image](https://github.com/user-attachments/assets/9d7b1e5d-c097-41dc-bb0d-5af732d47003)


#### **Box and Whisker Plot**

```{r}
boxplot(mtcars$mpg ~ mtcars$cyl, col = "lightblue", main = "MPG by Cylinder Count", xlab = "Cylinders", ylab = "MPG")
```
![image](https://github.com/user-attachments/assets/b868d61a-3bb3-44cd-aa60-3c4ca04b410d)


#### **Combining Plots**

```{r}
par(mfrow = c(2, 2))
plot(mtcars$wt, mtcars$mpg, main = "Scatterplot")
hist(mtcars$mpg, main = "Histogram")
boxplot(mtcars$mpg, main = "Boxplot")
barplot(table(mtcars$cyl), main = "Bar Chart")
```
![image](https://github.com/user-attachments/assets/ec9725ac-e723-4048-8c4d-9f1752d5ab6e)


#### **Scatterplot Matrix**

```{r}
par(mfrow = c(1, 1))  # Reset
pairs(mtcars[, c("mpg", "wt", "hp", "disp")], main = "Scatterplot Matrix", col = "blue")
```
![image](https://github.com/user-attachments/assets/37176285-33ea-4b9a-8a8c-b9757e6bd0dd)


------------------------------------------------------------------------

### **2. Advanced Graphics with ggplot2**

#### Box Plot and Whiskers

Transform dataset and plot:

```{r}
library(ggplot2)
library(reshape2)
iris1 <- iris[, 1:4]
iris2 <- melt(iris1)
ggplot(iris2, aes(x=variable, y=value)) +
  geom_boxplot(notch=FALSE, width=0.5) +
  theme_bw()
```
![image](https://github.com/user-attachments/assets/454b3de6-5892-4e63-9791-7df1d30722b2)


#### **Box Plot Overlaid with Dot Plot**

```{r}
iris3 <- read.csv("iris3.csv", header=TRUE)
ggplot(iris3, aes(x=variable, y=value, fill=as.factor(new))) +
  geom_boxplot(outlier.colour=NA, width=.7, notch=TRUE, fill="gray90") +
  geom_dotplot(binaxis="y", binwidth=0.04, stackdir="center") +
  theme_bw() +
  xlab("Flower Parts") +
  ylab("Values")
```
![image](https://github.com/user-attachments/assets/0064ba58-0bc6-42c8-b717-38e1bce019a0)


#### **Violin Plot**

```{r}
ggplot(iris2, aes(x=variable, y=value, fill=variable)) +
  geom_violin(trim=FALSE) +
  theme_minimal()
```
![image](https://github.com/user-attachments/assets/b23be3e0-f15b-4a5f-85c3-064cdf00e9c5)


#### **Scatter Plot**

```{r}
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, color=Species)) +
  geom_point(size=3) +
  theme_classic()
```
![image](https://github.com/user-attachments/assets/da08f63c-263e-4253-a817-fb94da66ddac)


#### **Error bars**

We need to summarize the data to include the means , standard deviation and standard error. I will use dplyr package to get this info then i will use it for the plot.

```{r}
library(plyr)
barsummary_septal <- ddply(iris, "Species", summarise,
                           mvalue = mean(Sepal.Length, na.rm = TRUE),
                           sd = sd(Sepal.Length, na.rm = TRUE),
                           n = sum(!is.na(Sepal.Length)),
                           se = sd / sqrt(n))
barsummary_septal
```

```{r}
library(ggplot2)
ggplot(barsummary_septal, aes(x = Species, y = mvalue, fill = Species)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_errorbar(aes(ymin = mvalue - se, ymax = mvalue + se), width = 0.2) +
  theme_minimal() +
  labs(title = "Mean Sepal Length by Species", y = "Mean Sepal Length")
```
![image](https://github.com/user-attachments/assets/43b4f992-16b8-4541-ab9b-5ad1d7d11195)


#### **Stacked Bar Plot**

```{r}
stacked_data <- data.frame(
  Species = rep(levels(iris$Species), each = 3),
  Measure = rep(c("A", "B", "C"), times = 3),
  Value = c(10, 20, 30, 15, 25, 35, 20, 30, 40)
)

ggplot(stacked_data, aes(x = Species, y = Value, fill = Measure)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Stacked Bar Plot", y = "Value")
```
![image](https://github.com/user-attachments/assets/1c556085-b368-4d13-a273-58aea60f7ba9)


------------------------------------------------------------------------

### **3. Heat Map Analysis**

#### **Basic Heat Map**

```{r}
library(reshape2)
library(RColorBrewer)
data <- iris[, -5]
data_matrix <- as.matrix(data)
heatmap(data_matrix, Rowv = NA, Colv = NA, col = heat.colors(256), scale = "column", margins = c(5, 10))
```
![image](https://github.com/user-attachments/assets/99ae3c6d-ecf9-4203-b824-4c93b5772b88)


#### **Advanced Heat Map**

```{r}
library(gplots)
heatmap.2(data_matrix, col = redgreen(75), scale = "row", key = TRUE, keysize = 1.5, 
          density.info = "none", trace = "none", cexCol = 0.9, labRow = NA)
```
![image](https://github.com/user-attachments/assets/facd43a5-e3fd-4c18-9d06-39936539b0b6)


