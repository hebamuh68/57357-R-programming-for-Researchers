# Reading the CSV file
#========================================
# Data Interpretation:
# - Age: Patients range from middle-aged (58) to elderly (74), a common demographic for Parkinson’s disease.
# - Tremor Severity: Varies from mild to severe, reflecting the progression of the disease.
# - UPDRS Score: A higher Unified Parkinson’s Disease Rating Scale (UPDRS) score indicates greater disability.
# - Dopamine Levels: Lower dopamine levels (e.g., 85 ng/ml) are associated with severe symptoms, as dopamine loss is a hallmark of Parkinson’s disease.
#========================================

# Load the CSV file with column headers
data_csv = read.csv("parkinsons_metrics.csv", header = TRUE)

# Display the loaded data
print(data_csv) 

