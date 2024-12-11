# Types of Missing Data

In the context of missing data, it's important to understand different types of missingness mechanisms. These mechanisms help to describe how and why data may be missing in a dataset. Here are three common types of missing data:

## 1. **MCAR (Missing Completely at Random)**

- **Definition**: Data is MCAR when the missing values are completely random and do not depend on the observed or unobserved data.
  
- **Example**:  Imagine a dataset where the age or motor scores for some Parkinson's patients are missing randomly due to technical issues (e.g., sensor failure).
  
- **Implication**: If data is MCAR, you can generally handle missing data by ignoring or omitting the missing values (e.g., using the `na.omit()` function in R). The missingness does not introduce bias into the analysis.
  
- **How to Check for MCAR**: You would typically perform statistical tests, such as Little’s MCAR test, to check if the missingness is random.

## 2. **MAR (Missing at Random)**

- **Definition**: Data is MAR when the missingness is related to the observed data but not the missing values themselves.
  
- **Example**: Suppose the data for the "motor_score" is missing more frequently for younger patients. The missingness is related to the observed "age" but not to the motor score itself.
  
- **Implication**: If data is MAR, more advanced techniques like imputation (e.g., replacing missing values based on other observed data) are used. You could use methods such as multiple imputation or maximum likelihood estimation to handle the missing data appropriately.
  
- **How to Check for MAR**: It’s more difficult to test directly for MAR because it requires understanding the relationship between missingness and observed data. Researchers often rely on domain knowledge and statistical modeling to determine if data is MAR.

## 3. **MNAR (Missing Not at Random)**

- **Definition**: Data is MNAR when the missingness is related to the unobserved data itself. This is the hardest type of missing data to handle.
  
- **Example**: Suppose the motor score is missing more often for patients with severe symptoms because they are less likely to complete the survey. Here, the missingness depends on the severity of the motor score itself, which is unobserved.
  
- **Implication**: MNAR is the most difficult type of missingness to handle because you need to account for the missing values based on what they might have been. Traditional imputation techniques do not work well here. Specialized modeling techniques, such as selection models or pattern-mixture models, are often used to handle MNAR data.
  
- **How to Check for MNAR**: It is often very difficult to detect MNAR because the missingness depends on the unknown values themselves. Statistical tests and advanced modeling can sometimes be used to infer MNAR, but it usually requires strong assumptions about the data.

---

## Summary of the Missing Data Types:

| Type   | Description                                                               | Example                                                          | Handling                                                     |
|--------|---------------------------------------------------------------------------|------------------------------------------------------------------|-------------------------------------------------------------|
| **MCAR** | Missingness is completely unrelated to both observed and unobserved data. | Missing survey responses due to technical issues.               | Omit missing values or perform analyses with missing data.   |
| **MAR**  | Missingness is related to observed data but not to the unobserved data.   | Missing income data based on other observable characteristics.   | Use imputation or modeling techniques that account for MAR.  |
| **MNAR** | Missingness is related to the unobserved data itself.                    | Missing income data because high-income individuals are less likely to report their income. | Use advanced modeling techniques like selection models.      |

Each type of missing data has different implications for your analysis, and the methods used to handle the missingness depend on the type you are dealing with. Identifying the type of missingness is crucial for choosing the right technique to handle missing data.
