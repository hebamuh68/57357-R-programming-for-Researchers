# Reading the XLSX file
#========================================
# Data Interpretation:
# Region 1 is the source region in the brain.
# Region 2 is the target region where connectivity is being measured.
# The connectivity strength quantifies the interaction between these regions, with lower values potentially indicating disrupted neural communication due to Parkinson’s disease.

#========================================

# Reading the Excel file
data_xlsx = read_xlsx("parkinsons_connectivity.xlsx")
print(data_xlsx)
