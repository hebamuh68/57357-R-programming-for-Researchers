# Loading Data
fox = read.csv("../../datasets/FoxInsight/Genetics/Genetic.csv")

# Replace empty cells with "NA"
fox[fox == ""] <- NA 

# Remove rows with any NA values
fox_clean = na.omit(fox)


#===================== Barplot of SexChromosomes Distribution
library(ggplot2)

ggplot(fox_clean, aes(x = SexChromosomes)) +
  geom_bar(fill = "skyblue", color = "black") +
  labs(title = "Sex Chromosome Distribution", x = "Sex Chromosomes", x = "Count") +
  theme_minimal()




#===================== Heatmap of Genotype Data
library(reshape)
library(dplyr)


# Remove non-genotype columns and melt the remaining data
genotype_melt = melt(fox_clean[, 4:7], id.vars = NULL)

# Heatmap of SNP Genotypes
ggplot(genotype_melt, aes(x = variable, y = as.factor(value))) +
  geom_tile(aes(fill = value), color = "white") +
  scale_fill_manual(values = c("AA" = "red", "AG" = "blue", "GG" = "green", 
                               "CT" = "yellow", "TT" = "purple")) +
  theme_minimal() +
  labs(title = "Heatmap of SNP Genotypes", x = "SNPs", y = "Genotype") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




#===================== Boxplot of Genotypes for SNPs Across Different Platforms
ggplot(fox_clean, aes(x = platform_version, y = factor(rs11610045), fill = platform_version)) +
  geom_boxplot() +
  labs(title = "Boxplot of Genotype for SNP rs11610045 by Platform", x = "Platform Version", y = "Genotype") +
  theme_minimal()




#===================== Scatter Plot of SNPs vs APOE

ggplot(fox_clean, aes(x = APOE, y = factor(rs11610045))) +
  geom_point(aes(color = APOE), size = 4) +
  labs(title = "Scatter Plot of APOE vs SNP rs11610045", x = "APOE", y = "Genotype (rs11610045)") +
  theme_minimal()


#===================== Density Plot of SNP Variants
ggplot(fox_clean, aes(x = rs11610045)) +
  geom_density(fill = "blue", alpha = 0.5) +
  labs(title = "Density Plot of SNP rs11610045", x = "Genotype (Numeric)", y = "Density") +
  theme_minimal()















