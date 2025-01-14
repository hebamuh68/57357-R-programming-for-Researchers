library('readxl')


#=========================== Histogram ====================== 
library(ggplot2)


rcc = read_xlsx('RCC.xlsx')
ggplot(rcc, aes(x=MALAT1, fill=Grade)) +
  geom_histogram(position='dodge',binwidth=3, fill='purple' ,col='white') +
  facet_wrap(~Side) +
  geom_density(alpha=0.7,  aes(y = ..scaled.., fill = Grade)) +
  theme_classic()
       

#=========================== Heat map  ====================== 
library(gplots)


lp = read_xlsx('LP.xlsx')
lp_matrix = as.matrix(lp)
row_variance = apply(lp_matrix, 1, var)
top_var = order(row_variance, decreasing = TRUE)[1:10]
lp_matrix_filtered = lp_matrix[top_var, ]


heatmap.2(lp_matrix_filtered, 
          scale='row', 
          col=bluered(200), 
          trace='none',
          key = TRUE, 
          keysize=2, 
          density.info='none', 
          labRow = NULL,
          cexCol = 1.5,)
