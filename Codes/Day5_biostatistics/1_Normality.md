# **Normality Test**

#### **What is a Normality Test?**
A normality test checks if a dataset follows a **normal distribution**. This is important because many statistical methods (e.g., T-tests, ANOVA) assume normality. If your data is not normal, you may need to:
1. Transform your data to make it normal.
2. Use non-parametric tests.

---

### **Key Concepts**
1. **Null Hypothesis (H₀)**:
   - The data is normally distributed.
2. **Alternative Hypothesis (H₁)**:
   - The data is **not** normally distributed.
3. **P-Value Interpretation**:
   - **p > 0.05**: Fail to reject \(H_0\), the data is normal (parametric).
   - **p < 0.05**: Reject \(H_0\), the data is not normal (non-parametric).

---

### **How to Test for Normality**
#### **1. Shapiro-Wilk Test**
- Best for small to medium sample sizes (3–5000).
- Sensitive to deviations from normality.
- **Example**:
  ```R
  x <- c(1, 2, 3, 32, 433, 12, 54, 343, 88, 75)
  shapiro.test(x)
  ```
  - If **p < 0.05**, the data is **not normal**.

#### **2. QQ Plot (Quantile-Quantile Plot)**
- Visual method to check normality.
- Plots sample quantiles against theoretical quantiles of a normal distribution.
- **Close to a straight line**: Data is normal.
- **Example**:
  ```R
  qqnorm(x)
  qqline(x, col = "red")
  ```

#### **3. Kolmogorov-Smirnov Test**
- Suitable for large sample sizes (\(n \geq 1000\)).
- Less sensitive than Shapiro-Wilk for small datasets.
- **Example**:
  ```R
  y <- rnorm(500)
  ks.test(y, "pnorm", mean(y), sd(y))
  ```

#### **4. Anderson-Darling Test**
- Requires the **`nortest`** package.
- More sensitive to the tails of the distribution.
- **Example**:
  ```R
  library(nortest)
  ad.test(y)
  ```

---

### **Choosing the Right Test**
1. **Small Sample Size (n < 30)**:
   - Use the **Shapiro-Wilk test**.
2. **Medium Sample Size (30 ≤ n < 1000)**:
   - Shapiro-Wilk or Anderson-Darling test.
3. **Large Sample Size (n ≥ 1000)**:
   - Use the **Kolmogorov-Smirnov test** (but it may detect even minor deviations).

---

### **What if the Data is Non-Normal?**
1. **Transform the Data**:
   - Apply logarithmic, square root, or other transformations to normalize the data:
     ```R
     x_trans <- log(x)
     shapiro.test(x_trans)
     ```
2. **Use Non-Parametric Tests**:
   - For example:
     - **Mann-Whitney U Test** instead of T-test.
     - **Kruskal-Wallis Test** instead of ANOVA.
