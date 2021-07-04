
#Load data from your computer

cinetica <- read_excel("C:/Users/Windows/Desktop/Datos_cinética_enzimática.xlsx", 
                       sheet = 4, skip = 1, col_names = TRUE)

#Personalize your dataframe

names(cinetica)[1] = "glucosa"
names(cinetica)[2] = "C"
names(cinetica)[3] = "Control"

#Calculate reciprocal data

cinetica <- cbind(cinetica, "reciproco_glu" = 1/cinetica$glucosa, 
                  "reciproco_C" = 1/cinetica$C, 
                  "reciproco_control" = 1/cinetica$Control)

#Regression for control data

summary(lm(formula = reciproco_control ~ reciproco_glu, data = cinetica))

#Regression for C compound data

summary(lm(formula = reciproco_C ~ reciproco_glu, data = cinetica))


#Plotting the data using ggplot2 package


library(ggplot2)

p <- ggplot(cinetica, aes(x = 1/glucosa)) + 
  theme_bw() +
  labs(x = "Glucose (mM)",
       y = "Enzimatic activity (U/mg)") + 
  ggtitle("Effects of a compound in the enzymatic activity") +
  theme(plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12, face = "bold")) + 
  geom_line(aes(y = 1/Control),size = 0.8, color = "darkblue") +
  geom_line(aes(y = 1/C), size = 0.8, color= "red") + 
  scale_x_continuous(breaks = seq(0, 1, by = 0.05)) + 
  scale_y_continuous(breaks = seq(0, 0.25, by = 0.01)) 


#Add tex to the plot

p + geom_text(aes(label = "", y = 1/C)) +
  annotate("text", label = "Compuesto C\ny = 0.1903x + 0.0084\nR² = 0.9985", 
           x = 0.25, y = 0.12, size = 5, 
           colour = "red") + 
  annotate("text", label = "Control\ny = 0.0666x + 0.0084\nR² = 0.9998", 
           x = 0.85, y = 0.11, size = 5, 
           colour = "darkblue")

#Save plot with ggsave function

ggsave(filename = "Enzymatic activity.png", units = "in", width = 7, 
       height = 4, device = "png", dpi = 350)
  
})