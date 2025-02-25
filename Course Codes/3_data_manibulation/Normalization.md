# Data Normalization  

## Why Normalize?  
Normalization adjusts your data to a uniform scale, ensuring fair comparisons and reliable analysis. When working with data from different sources—like **brain scans** or **symptom scores** in a Parkinson’s study—values can exist on very different scales, which can skew interpretations.  


## How to Choose the Right Normalization Method  

Choosing the appropriate normalization technique depends on your **data characteristics** and **analysis goals**:  

### 1. **Min-Max Normalization (n10)**  
- **Use when**: You need to scale data to a specific range, typically \([0, 1]\).  
- **Best for**: Algorithms sensitive to the range of data, such as neural networks or support vector machines (SVMs).  
- **Key Benefit**: Preserves relative distances between data points.  

### 2. **Z-Score Normalization (n4)**  
- **Use when**: Data follows a *Gaussian-like distribution*.  
- **Best for**: PCA, linear regression, and clustering algorithms like k-means.  
- **Key Benefit**: Centers data around 0 with a standard deviation of 1.  

### 3. **Log Transformation (n7)**  
- **Use when**: Data is *skewed* or follows an *exponential distribution*.  
- **Best for**: Datasets with extreme outliers or wide value ranges, like biomarker data.  
- **Formula**: \( x_{\text{normalized}} = \log(x + 1) \).  

### 4. **Range Normalization (n1)**  
- **Use when**: Similar to min-max normalization but scales the data between \([-1, 1]\).  
- **Best for**: Algorithms expecting both negative and positive values.  

### 5. **Median and MAD Normalization (n6)**  
- **Use when**: Data contains extreme outliers or has a *non-Gaussian distribution*.  
- **Key Benefit**: Robust against outliers due to median-based scaling.  

### 6. **Unit Vector Normalization (n5)**  
- **Use when**: Treating data as vectors and normalizing to unit length.  
- **Key Benefit**: Ensures all feature vectors have a consistent magnitude.  



## Example Use Cases  

- **Machine Learning**:  
  Use **Min-Max Normalization (n10)** to handle features with varying ranges, such as voice features in a Parkinson’s disease classification model.  

- **Statistical Analysis**:  
  Use **Z-Score Normalization (n4)** to standardize features with different variances for methods like PCA.  

- **Handling Outliers**:  
  Use **Log Transformation (n7)** or **Median/MAD Normalization (n6)** for skewed datasets or extreme outliers.  
