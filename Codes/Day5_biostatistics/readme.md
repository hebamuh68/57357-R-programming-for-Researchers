## Discriptive statistics

```
library(psych)
data = rnorm(100,12,1)
describe(data)

> vars n   mean   sd   median trimmed   mad  min   max range skew kurtosis se
  X1   1  100   12.04  1.05  12.02  12.02   1.14 9.79  14.98  5.2  0.22  -0.4   0.11

```

> #### **Skewness**
- **Definition**: Measures the asymmetry of a distribution.
- **Interpretation**:
  - A skewness of **0**: Perfectly symmetrical distribution.
  - **-0.5 < skewness < 0.5**: Fairly symmetrical.
  - **Skewness > 1 or < -1**: Highly skewed.
  - **Positive skew**: Right tail is longer; more data points are concentrated on the left.
  - **Negative skew**: Left tail is longer; more data points are concentrated on the right.


> #### **Kurtosis**
- **Definition**: Measures the "tailedness" or how heavy/light the tails of a distribution are compared to a normal distribution.
- **Types**:
  - **Mesokurtic (kurtosis = 0)**: Normal distribution (tails are neither too light nor heavy).
  - **Leptokurtic (kurtosis > 0)**: Heavy tails (more extreme outliers than normal).
  - **Platykurtic (kurtosis < 0)**: Light tails (fewer extreme outliers).

> ### **Rules of Thumb**
- For **skewness**:
  - Close to **0**: Symmetrical distribution.
  - Between **-0.5 and 0.5**: Fairly symmetrical.
  - Beyond **+1 or -1**: Highly skewed distribution.

- For **kurtosis**:
  - Kurtosis near **0** (adjusted for normal distribution): Moderate tails.
  - Positive kurtosis: Heavier tails, more outliers.
  - Negative kurtosis: Lighter tails, fewer outliers.

---
## Confedence interval
> A **confidence interval (CI)** is a statistical tool used to estimate the range in which the true value of a parameter (like a population mean or proportion) is likely to lie, given a certain level of confidence. It provides a measure of uncertainty or precision around an estimate based on sample data.


> ### **Key Components of a Confidence Interval**
1. **Point Estimate**: 
   - The central value or the "best guess" of the true parameter. For example, the sample mean is often used as the point estimate of the population mean.

2. **Margin of Error**:
   - The amount added and subtracted from the point estimate to create the range of the interval. This accounts for variability in the sample and provides a buffer for uncertainty.

3. **Confidence Level**:
   - The percentage of times the calculated confidence interval would contain the true parameter if the same study were repeated multiple times. Common confidence levels are:
     - **95%**: Indicates we are 95% confident that the true value lies within the interval.
     - **99%**: More confident, but the interval is wider.
     - **90%**: Less confident, but the interval is narrower.


> ### **Interpreting a Confidence Interval**
For example, if a study calculates a 95% confidence interval for the mean weight of apples as \( [150g, 160g] \):
- It means we are **95% confident** that the **true mean weight** of apples lies between **150g and 160g**.
- This does **not** mean there is a 95% chance the true value is within the interval (the true value is fixed; our estimate is uncertain).


> ### Rule of Thumb:
- A **narrow confidence interval** indicates a more precise estimate.
- A **wide confidence interval** suggests more uncertainty and variability in the data.

---

## OUTLIERS

> #### **Definition**
- Outliers are **unusual or extreme values** that differ significantly from the majority of the data. 
- They can arise due to variability in the data, measurement errors, or other factors.

In mathematical terms:
- An outlier is often defined as any value that is **more than two standard deviations away from the mean** of its respective column.



> ### **Key Points to Remember**
1. **Think twice before removing outliers**:
   - Outliers may represent valid extreme cases or errors. Removing them without careful consideration can distort the data or lead to biased results.

2. **Impact on Normality**:
   - Including outliers can make your data **non-parametric**, meaning it does not follow a normal distribution. 
   - If the data is not normally distributed, **parametric tests** like T-tests or ANOVA may not be valid.

3. **Consider Non-Parametric Tests**:
   - If outliers make your data non-parametric, use non-parametric tests such as:
     - **Mann-Whitney U Test** (instead of T-test).
     - **Kruskal-Wallis Test** (instead of ANOVA).









