# **Part 2: Frequency and Contingency Tabulation**  
In this section, we will cover:  
1. **Frequency and Contingency Tables** (Cross Tabulation).  
2. **Tests of Independence** (Chi-square, Fisher Exact, Cochran-Mantel-Haenszel).  
3. **Measuring Association** for two-way contingency tables.

---

### **Frequency and Contingency Tables (Cross Tabulation)**  
Cross-tabulation is a method used for categorical variables (e.g., `Male`, `Female`). Here, we will extract and summarize subsets of data using the **`vcd`** package.

---

#### **Setup**  
Install and load the necessary libraries:  
```R
# Load libraries
library(grid)
library(vcd)

# Attach dataset from vcd
attach(Arthritis)
```

#### **Preview the Dataset**  
To view the top and bottom rows of the dataset:  
```R
head(Arthritis)  # Display the first 6 rows
tail(Arthritis)  # Display the last 6 rows
```

**Sample Output:**  
```
  ID Treatment    Sex  Age Improved
1 57   Treated    Male  27    Some
2 46   Treated    Male  29    None
...
```

---

### **1. One-Way Frequency Table**  
Calculate the frequency of one variable:  
```R
# Frequency of Sex
a1 <- with(Arthritis, table(Sex))
a1

# Frequency of Treatment
a2 <- with(Arthritis, table(Treatment))
a2

# Proportions
prop.table(a1)  # Relative frequency
```

**Example Output:**  
```
Sex
Female   Male 
59       25
```

---

### **2. Two-Way Contingency Table**  
To tabulate two variables:  
```R
# Contingency Table: Sex vs. Improvement
a4 <- table(Arthritis$Sex, Arthritis$Improved)
a4

# Proportions
prop.table(a4) * 100  # Percentage relative to total
prop.table(a4, 1)     # Row-wise proportions
prop.table(a4, 2)     # Column-wise proportions
```

---

### **3. Adding Margins**  
To include totals (row/column sums):  
```R
# Add margins to contingency table
addmargins(a4)       # Add both row and column margins
addmargins(a4, 1)    # Add row margins only
addmargins(a4, 2)    # Add column margins only
```

**Example Output:**  
```
         None Some Marked Sum
Female    25   12    22   59
Male      17    2     6   25
Sum       42   14    28   84
```

---

### **4. Multi-Dimensional Tables**  
For deeper analysis of three variables:  
```R
# Multidimensional table
multi <- table(Arthritis$Sex, Arthritis$Improved, Arthritis$Treatment)
multi

# Marginal totals
margin.table(multi)        # Total count
margin.table(multi, 1)     # By Sex
margin.table(multi, 2)     # By Improved
margin.table(multi, 3)     # By Treatment
```

To format the output:  
```R
# Flatten table with ftable()
ftable(multi, c(1, 2), 3)  # Arrange variables
```

---

### **5. Proportions in Multi-Dimensional Tables**  
Calculate proportions based on specific variables:  
```R
# Proportions by Sex and Treatment
ftable(prop.table(multi, c(1, 2)), 3)

# Add margins for clarity
ftable(addmargins(prop.table(multi, c(1, 3)), 2))
```

To display percentages:  
```R
ftable(addmargins(prop.table(multi, c(1, 3)), 2)) * 100
```

---

### **Key Notes on Contingency Tables**  
1. **Contingency tables** provide frequencies, proportions, and percentages for combinations of variables.  
2. However, they **do not determine relationships or independence** between variables.

---

### **Next: Tests of Independence**  
To evaluate relationships among categorical data, we use:  
1. **Chi-Square Test**.  
2. **Fisher's Exact Test**.  
3. **Cochran-Mantel-Haenszel Test**.

---

Let me know if you’d like to continue with the next topic or adjust this structure further!
