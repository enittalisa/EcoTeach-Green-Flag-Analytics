setwd("C:/Users/enitt/OneDrive/Desktop/Presentation - 02/CONTENT/ANOVA/ANOVA - Data")

#Install packages 
install.packages("readxl")
install.packages("ggplot2")
install.packages("dplyr")

#Load the libraries
library(readxl)
library(dplyr)
library(ggplot2)

# Reading the Excel
data <- read.csv("C:/Users/enitt/OneDrive/Desktop/Presentation - 02/CONTENT/ANOVA/ANOVA - Data/insulation_level.csv")

#Ensuring Insulation_Level is a factor (grouping variable)
data$Insulation_Level <- as.factor(data$Insulation_Level)

#Run the ANOVA test
anova_result <- aov(Energy_Demand_kWh ~ Insulation_Level, data = data)
summary(anova_result)  # View p-value and significance

#Visualize the results with a boxplot
p <- ggplot(data, aes(x = Insulation_Level, y = Energy_Demand_kWh)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Energy Demand by Insulation Level",
       x = "Insulation Level", y = "Energy Demand (kWh)") +
  theme_minimal()
ggsave("C:/Users/enitt/OneDrive/Desktop/insulation_boxplot.png", p, width = 8, height = 6)

