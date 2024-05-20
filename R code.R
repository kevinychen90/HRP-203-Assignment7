library(dplyr)
library(ggplot2)

#Load data
data <- read.csv("C:/Users/yoyok/OneDrive/Documents/Stanford/HRP203-Methods for Reproducible Pop Health/HRP-203-Assignment7/raw-data/cohort.csv")
summary(data)


# Create a table describing the variables
variable_summary <- data %>% 
  summarise_all(funs(mean, sd, min, max, n = n()))
print(variable_summary)

# Fit a linear model with cost as dependent variable
model <- lm(cost ~ smoke + cardiac + age + female, data = data)
summary(model)

# Create a plot
plot <- ggplot(data, aes(x = age, y = cost)) +
  geom_point() +
  labs(title = "Scaterplot of Age vs Cost", x = "Age", y = "Cost")
print(plot)
