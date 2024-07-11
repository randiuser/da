# Task 1: Load the Dataset
library(readr)
library(dplyr)
library(ggplot2)

# Assuming the file is in the working directory. Adjust the path if necessary.
purchase_data <- read_csv("customer_purchases.csv")

# Task 2: Data Summary
total_records <- nrow(purchase_data)
unique_customers <- n_distinct(purchase_data$`Customer ID`)

cat("Total number of records:", total_records, "\n")
cat("Total number of unique customers:", unique_customers, "\n")

# Task 3: Calculate Statistical Measures
mean_purchase <- mean(purchase_data$`Purchase Amount`)
median_purchase <- median(purchase_data$`Purchase Amount`)
sd_purchase <- sd(purchase_data$`Purchase Amount`)

cat("Mean purchase amount: $", round(mean_purchase, 2), "\n")
cat("Median purchase amount: $", round(median_purchase, 2), "\n")
cat("Standard deviation of purchase amounts: $", round(sd_purchase, 2), "\n")

# Task 4: Customer Segmentation
purchase_data <- purchase_data %>%
  mutate(Segment = ifelse(`Purchase Amount` < median_purchase, 
                          "Low Spender", "High Spender"))

# Task 5: Visualize Data
ggplot(purchase_data, aes(x = `Purchase Amount`)) +
  geom_histogram(binwidth = 50, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Purchase Amounts",
       x = "Purchase Amount ($)",
       y = "Frequency") 

# Display the plot
ggsave("purchase_distribution.png", width = 10, height = 6)
