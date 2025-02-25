# **Scaling vs. Normalization**  



<br></br>
## **1. Scaling**  
**Scaling** adjusts the range or spread of your data to standardize it.  

- **Key Feature**:  
   Scaling doesn't necessarily "squish" data into a fixed range; it focuses on the **spread**.  

- **Common Type: Z-Score Scaling (Standardization)**  
   - Result: Data has **mean = 0** and **standard deviation = 1**.  

- **When to Use**:  
   - When your data contains **different units or scales** (e.g., kilometers vs. meters).  
   - For machine learning models like **PCA, linear regression, or clustering**, which are sensitive to data spread.  



<br></br>
## **2. Normalization**  
**Normalization** squeezes the data into a **specific range**, usually between 0 and 1.  

- **Key Feature**:  
   Normalization focuses on **changing the range** of the data.  

- **Common Type: Min-Max Normalization**  
   - Result: All values are scaled between **0 and 1**.  

- **When to Use**:  
   - When you need all data to be on the same scale (0 to 1).  
   - Works well for algorithms like **neural networks** or **image processing**, where pixel values range between 0–255.  


<br></br>
## **Example to Compare Scaling and Normalization**  

Imagine a column of data:  
\[ 10, 20, 30, 40, 50 \]

1. **Z-Score Scaling**:  
   - Adjusts the data so the mean = 0 and standard deviation = 1.  
   - Result: \(-1.26, -0.63, 0, 0.63, 1.26\)  

2. **Min-Max Normalization**:  
   - Squeezes the data into the range 0–1.  
   - Result: \( 0, 0.25, 0.5, 0.75, 1 \)  



