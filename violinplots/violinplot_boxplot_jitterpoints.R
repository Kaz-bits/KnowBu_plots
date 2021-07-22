
#-----violin plot with jitter points----

#load ggplot2 package
library(ggplot)

#load data. For this example: iris dataset
View(iris)

#add first layers, jitter points and a boxplot
p <- ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) + 
      geom_violin(trim = FALSE) +
      geom_boxplot(width = 0.1, color = "white", size = 0.6) + 
      geom_jitter(aes(fill = Species), shape = 21, width = 0.1) 

#customize plot using theme() layer
p + theme_classic() + 
  ggtitle("Violin plot with jitter points and a boxplot") + 
  labs(x = "Species (from iris)",
       y = "Petal length (cm)") + 
  theme(plot.title = element_text(hjus = 0.5, size = 14, face ="bold"),
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 12),
        legend.title = element_text(size = 12),
        legend.position = c(0.1, 0.8), 
        legend.key.size = unit(0.75, "cm"),
        legend.text = element_text(size = 11),
        legend.background = element_rect(color = "black", size = 1)) + 
  scale_y_continuous(breaks = seq(0, 8, by = 0.6)) + 
  scale_fill_discrete(name = "Specie (iris)", 
                      labels = c("Setosa", "Versicolor", "Virginica"))


