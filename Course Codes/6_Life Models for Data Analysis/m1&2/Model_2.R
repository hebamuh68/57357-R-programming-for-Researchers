Model # 2


##############################################################################


# A real clinical trial data on a cardiovascular drug has been adminstrated to
# 1692 patients. Some questions have been raised to validate the drug.
# You was asked to validate the following report
# check an excel file named patient data.

VALIDATE THIS REPORT  

1. The drug shows efficacy on males than females especially at age between 30-60
2. Smoking might impact improvement stage of the drug
3. Increasing drug dose does not impact blood pressure on both males and females
4. Show in a graph if there is a possible link between bmi and blood suger level 
based on sex in each drug dose level. 
5. Is there a significant differences in respiratory rate between employed 
males and females who adminstered dose 1.0 during the study?  
  
  
  
  ###############################################################################


DATA EXPLORATION

summary(patient_data)
# note 1. data have missing values
# note 2. data contains both continious and categorical data

str(patient_data)
class(patient_data)
# note 3. its a dataframe
dim(patient_data)
# note 4. 1692 observations x 14 variables


# well, i will start with separating the data into continuous and categorical subsets

codata<- patient_data[, 7:14] #  continuous data
head(codata)


cadata<- patient_data[, 1:6] # names + categorical data + dose
head(cadata)

Im ready !
  
  ===========================================
  
  testing normality for continuous_vars

# Define the function for Shapiro-Wilk test
shapiro_test <- function(x) {
  x <- na.omit(x) # if u found NA in X, omit it and rename with same name
  shapiro.test(x) # apply shapiro
}

# Apply the function to each continuous variable using lapply()
normality_results <- lapply(codata, shapiro_test) # that might be enough
normality_results

# The GURU add

# Extract p-values using sapply()
p_values <- sapply(normality_results, function(x) x$p.value)

# Create summary data frame
normality_summary <- data.frame(
  Variable = names(p_values),
  P_Value = p_values,
  Normal = p_values >= 0.05 # logical argument
)

normality_summary

# milestone conclusion: data are not normal,, 
# ill continue non-parametric

=================================================
  
  Draw density plot for continuous_vars



# Reshape continuous_data to long format  
melted_codata <- melt(codata)


# Create density plots
ggplot(melted_codata, aes(x= value,fill = variable)) +
  geom_density(alpha = 0.7) +
  stat_overlay_normal_density(color = "red", linetype = "dashed")+
  facet_wrap(~ variable, scales = "free") +
  theme_minimal() +
  labs(title = "Density Plots of Continuous Variables",
       x = "Value",
       y = "Density")


# the code looks nice but i used here the ggpubr package 
# to calculate theoritical density and over plot it on ggplot 
# by adding stat_overlay_normal_density .

# use the export button in the R studio

dev.off()

###########################################################

lets QQ the data


qqnorm(codata, main = "QQ Plot of Continuous Data",
       xlab = "Theoretical Quantiles", 
       ylab = "Sample Quantiles")
qqline(codata)

# Oops, something looks wrong,, NA, i forgot it...


# i need to take decision about these NA.... lets see them carefully

summary(codata) # 10 values only ...good

ill extract them in a separate datasets


rows_with_na <- apply(codata, 1, function(x) any(is.na(x))) 
# apply function returns logical values
codata_with_na <- codata[rows_with_na, ]
codata_with_na

# difficult to guide is it MCAR? or MAR. i can take the decision to remove 
# them (MCAR) or impute them (MAR)
# these values wont impact the analysis if i omitted them from the analysis.

Generating a dataset without NA 


rows_with_na <- apply(codata, 1, function(x) any(is.na(x))) # apply function returns logical values
codata_withno_na <- codata[!rows_with_na, ]
codata_withno_na

dim(codata_with_na)    # make sure my data is correct 10 x 8
dim(codata_withno_na)  # here 1682 x 8


back to QQ plot )))


ggplot(melted_codata, aes(sample = value, color= variable)) +
  stat_qq() +
  stat_qq_line(color="black") +
  facet_wrap(~ variable, scales = "free") +
  theme_minimal() +
  labs(title = "Q-Q Plots for Continuous Variables")

dev.off()

################################################################

Lets check the box plots to navigate outliers



ggplot(melted_codata, aes(x = "", y = value, fill= variable, alpha=0.5)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(aes(group = variable), fill = "white", width = 0.2) +
  facet_wrap(~ variable, scales = "free_y") +
  theme_minimal() +
  labs(title = "Violin and Box Plots of Continuous Variables") +
  theme(axis.text.x = element_blank(), 
        axis.ticks.x = element_blank(),
        legend.position = "none" # just removed the legend
  )

dev.off() 


##########################################################################
1. The drug shows efficacy on males than females at age between 30-60


subset_age3060 <- patient_data %>% filter(between(age, 30, 60))
subset_age3060
summary(subset_age3060) # just to check age range
table1 <- table(patient_data$improvement_stage,patient_data$gender ) 
#ill tabulate the data based on response and response
fisher.test(table1)

>> Milestone observation: Fisher test is significant.
#Ill extract the proportional table to see

prop.table(table1, margin = NULL) * 100  # based on total
# 15.8% improvement in females compared to  12.4% in males from total


prop.table(table1, margin = 1) * 100  # improvement
# 56.1% improvement in females compared to  43.8% in males from overall
# improved individuals (M&F) within the study

>> Milestone conclusion: Wrong reporting of point1, reverve is TRUE
# Drug is shows more efficacy on males rather than females.

# additional point to consider: association is weak

assocstats(table1) 

#Note: note that in this example its 2x3, thats why Phi-coefficient is NA 
# (works for 2 x 2). even other 2 parameters shows weak association. 

#bonus point
mosaicplot(table1, color = TRUE)


########################################################################

2. Smoking might impact improvement stage of the drug


table2<- table(cadata$smoking,cadata$improvement_stage)
table2


fisher.test(table2) # no impact apparantly!

prop.table(table2, margin = 1) * 100
assocstats(table2)
mosaicplot(table2, color = TRUE, main = "Mosaic Plot of Smoking vs Improvement Stage")

>> milestone conclusion: no impact of smoking of patient improvement stage. 

###########################################################################

3. Increasing drug dose does not impact blood pressure or even cholesterol
on both males and females


lets view the data required to be tested

head(patient_data)

melted_data2 <- melt(patient_data, 
                     id.vars = setdiff(names(patient_data), "dose"),  # Variables to keep as identifiers
                     measure.vars = c("dose"))# to melt


g1 <- ggplot(melted_data2, aes(x = as.factor(value), y = blood_pressure, fill = gender)) +
  geom_boxplot(alpha = 0.3) +
  labs(title = "Impact of dose on blood pressure",
       x = "Dose",
       y = "Blood pressure",
       fill = "gender") +
  guides(fill = "none", color = "none", shape = "none") + 
  theme_minimal()


For cholesterol


g2 <- ggplot(melted_data2, aes(x = as.factor(value), y = cholesterol, 
                               fill = gender)) +geom_boxplot(alpha = 0.3) +
  labs(title = "Impact of dose on cholesterol levels",
       x = "Dose",
       y = "Cholesterol",
       fill = "gender")+
  theme_minimal()



combined_plot <- plot_grid(g1, g2, ncol = 2)


Lets do the test (we know its non parametric, 3 doses). -> Kruskal-Wallis

dose_bb_gen <- patient_data %>% select(dose, blood_pressure, gender)


kruskal.test(blood_pressure~dose,dose_bb_gen)

#mmmm seems non significant


>> milestone conclusion: no impact of increased dose on blood pressure (true)


lets see cholesterol (same approach)

dose_chol_gen <- patient_data %>% select(dose, cholesterol, gender)


kruskal.test(cholesterol~dose,dose_chol_gen)

>> milestone conclusion: no impact of increased dose on cholesterol level as well
(true)

################################################################################

4. Show in a graph if there is a possible link between bmi and blood suger level 
based on sex in each drug dose level. 

# here i need a dataframe that contains all these info. i can add the gender and 
# dose variables to the continious data (u have different approaches as well) 


data5 <- cbind(codata, cadata$gender,cadata$dose)


head(data5)

# need to rename them again

colnames(data5)[colnames(data5) == "cadata$gender"] <- "gender"
colnames(data5)[colnames(data5) == "cadata$dose"] <- "dose"



lets draw the scatter plot using ggplot

ggplot(data5, aes(x =bmi, y =blood_sugar, color = blood_sugar)) +
  geom_point(alpha = 0.6) +
  facet_wrap(gender~dose) +
  scale_color_gradient(low = "blue", high = "red")+
  theme_minimal() +
  labs(title = "Scatter Plot between bmi and blood suger level",
       x = "bmi",
       y = "blood sugar level",
       color = "gender",
       facet = "dose") +
  theme_minimal()

dev.off()


###########################################################################


##################################################################


5. Is there any significant differences in respiratory rate between employed 
males and females who adminstered dose 1.0 during the study?  
  
  
  I need to subset these information as a dataframe first !
  
  data6 <- patient_data %>% select(dose, gender, respiratory_rate, employment)

summary(data6)

need to select patients who adminstered 1.0 and employed


subset_data6 <- data6 %>%
  filter(dose == 1.0 & employment == "Yes")

dim(subset_data6)

Now i can do the comparision between males and females
Lets see first how is my data looks like

with(subset_data6,table(gender))


checking data normality (respiratory rate)

shapiro.test(subset_data6$respiratory_rate) # non parametric

Outliers?
  
  boxplot.stats(subset_data6$respiratory_rate) # but ill keep them


Ill do the U test here

wilcox.test(respiratory_rate~gender,subset_data6) # non significant

# milestone conclusion: No differences in respiratory rate between employed 
males and females who adminstered dose 1.0 in respiratory rate. 


Good luck

###############################################################################




















