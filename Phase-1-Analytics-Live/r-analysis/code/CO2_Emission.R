library(readxl)
setwd("C:/Users/enitt/OneDrive/Desktop/Presentation - 02/CONTENT/ANOVA/ANOVA - Data")

install.packages("readxl")
install.packages("ggplot2")
install.packages("dplyr")

library(readxl)
library(ggplot2)
library(dplyr)

data <- read_excel("C:/Users/enitt/OneDrive/Desktop/Presentation - 02/CONTENT/ANOVA/ANOVA - Data/CO2_emissions.xlsx")
data$Emission_Type <- as.factor(data$Emission_Type)
head(data)

anova_result <- aov(CO2_Emissions ~ Emission_Type, data = data)
summary(anova_result)

ggplot(data, aes(x = Emission_Type, y = CO2_Emissions)) +
  geom_boxplot(fill = "darkgreen") +
  labs(title = "CO2 Emissions by Emission Source",
       x = "Emission Type", y = "CO2 Emissions (kg)") +
  theme_minimal()
