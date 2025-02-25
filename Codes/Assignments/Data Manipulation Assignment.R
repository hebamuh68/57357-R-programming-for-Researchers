library(dplyr)

#=============================== Question 1 =============================== 
# LOad the data
data = iris

pipline = data %>% 
  filter(Sepal.Length > 5, Species == "setosa") %>% # Q1
  select(contains("Sepal")) %>% # Q2
  mutate(Sepal.Ratio = Sepal.Length / Sepal.Width) %>% # Q3
  arrange(desc(Sepal.Ratio)) # Q4

#=============================== Question 2 =============================== 
patients = data.frame(
  PatientID = c(1, 2, 3, 4, 5),
  Name = c("Aliya", "Bassem", "Karim", "Dina", "Iman"),
  DepartmentID = c(101, 102, 101, 103, 102)
)

departments = data.frame(
  PatientID = c(2, 3, 4),
  DepartmentName = c("Cardiology", "Neurology", "Oncology")
)


no_dep = patients %>%
  left_join(departments, by = "PatientID") %>% 
  filter(is.na(DepartmentName))