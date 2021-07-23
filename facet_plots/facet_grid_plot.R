
#load packages
library(ggplot2)
library(nycflights13)

#load filtered data from nycflights13 dataset
MCO_flies <- flights[c(flights$dest == "MCO" & 
                         flights$month == 12 & 
                         flights$day == 23), ]

#plot first layers
p <- ggplot(MCO_flies, aes(x = carrier, y = air_time)) + 
      geom_boxplot(aes(fill = carrier), size = 0.6) + 
      facet_grid(distance + origin ~ carrier)

#add customizations to the plot. The strip function modify 
#the facets
p + ggtitle("Multipanel plot for visualizing groups") + 
    labs(x = "Carrier", 
       y = "Air time (min)") + 
    theme_bw() + 
    theme(plot.title = element_text(size = 16, hjust = 0.5),
        axis.title = element_text(size = 14),
        legend.title = element_text(size = 12, hjust = 0.5),
        legend.text = element_text(size = 10),
        legend.background = element_rect(color = "black"),
        legend.key.size = unit(1, "cm"),
        strip.text = element_text(size = 12)) +
  scale_fill_discrete(name = "New York\ncarriers")



