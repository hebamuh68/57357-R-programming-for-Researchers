# Loading Data
pd = read.csv("../../datasets/parkinson/pd.csv")


#===============================================================================
# Normalization
#===============================================================================
#===================== Data Normalization =====================
library(clusterSim)
library(dplyr)

normalised_pd = pd  %>% 
  mutate(across(-c(name,status), ~ data.Normalization(., type = "n10", normalization = "column")))



#===================== Scaling =====================
scaled_pd = normalised_pd  %>% 
  mutate(across(-c(name,status), ~ scale(.)))



#===============================================================================
# dplyr
#===============================================================================
#===================== Data Filtering and Summarizing =====================
# Filter for Parkinson's disease (status == 1) and summarize
scaled_pd %>%
  filter(status == 1) %>%
  summarise(
    avg_MDP_Fo = mean(MDVP.Fo.Hz., na.rm = TRUE),
    avg_MDP_Fhi = mean(MDVP.Fhi.Hz., na.rm = TRUE),
    avg_MDP_Jitter = mean(MDVP.Jitter..., na.rm = TRUE)
  )



#===================== Data Transformation with mutate =====================
# 1. Add a new column MDVP.Difference that is the difference between MDVP.Fhi.Hz. and MDVP.Flo.Hz..
# 2. Transform the MDVP.Fo.Hz. column to its logarithmic value for normalization purposes.
pd_transformed <- scaled_pd %>%
  mutate(
    MDVP.Difference = MDVP.Fhi.Hz. - MDVP.Flo.Hz.,
    log_MDVP_Fo = log(abs(MDVP.Fo.Hz.) + 1)
  )
head(pd_transformed)



#===================== Grouping and Aggregating Data =====================
# 1. Group the dataset by status (Parkinson’s disease vs. control group) and calculate the mean of various columns
# 2. Compare the averages between the two groups to see if there is a noticeable difference in the features
scaled_pd %>%
  group_by(status) %>%
  summarise(
    mean_MDP_Fo = mean(MDVP.Fo.Hz., na.rm = TRUE),
    mean_MDP_Jitter = mean(MDVP.Jitter..., na.rm = TRUE)
  )



#===================== Sorting and Arranging Data =====================
# Arrange the dataset by MDVP.Fo.Hz. in descending order.
scaled_pd %>%
  arrange(desc(MDVP.Fo.Hz.)) %>%
  head(5)



#===================== Combining Multiple Operations =====================
scaled_pd %>%
  select(name, MDVP.Fo.Hz., MDVP.Fhi.Hz., status) %>%
  filter(status == 1) %>%
  mutate(MDVP.Difference = MDVP.Fhi.Hz. - MDVP.Flo.Hz.) %>%
  arrange(desc(MDVP.Difference))


#===================== Visualize Data =====================

scaled_pd %>%
  ggplot(aes(x = MDVP.Fo.Hz., y = MDVP.Fhi.Hz., color = factor(status))) +
  geom_point() +
  labs(title = "Comparison of MDVP.Fo.Hz. and MDVP.Fhi.Hz.", x = "MDVP.Fo.Hz.", y = "MDVP.Fhi.Hz.") +
  scale_color_manual(values = c("red", "blue"), labels = c("Parkinson's", "Control"))








