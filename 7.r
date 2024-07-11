# Load necessary libraries
library(dplyr)
library(ggplot2)

# Create the data frame
purchase_data <- data.frame(
  CustomerID = c(101, 102, 103, 104, 105),
  PurchaseAmount = c(150, 200, 120, 300, 80)
)

# Calculate statistical measures
mean_purchase <- mean(purchase_data$PurchaseAmount)
median_purchase <- median(purchase_data$PurchaseAmount)
sd_purchase <- sd(purchase_data$PurchaseAmount)
q1_purchase <- quantile(purchase_data$PurchaseAmount, 0.25)
q3_purchase <- quantile(purchase_data$PurchaseAmount, 0.75)

# Display statistical measures
cat("Statistical Measures:\n")
cat("1. Mean purchase amount:", mean_purchase, "\n")
cat("2. Median purchase amount:", median_purchase, "\n")
cat("3. Standard deviation of purchase amounts:", sd_purchase, "\n")
cat("4. 1st quartile (25th percentile) of purchase amounts:", q1_purchase, "\n")
cat("5. 3rd quartile (75th percentile) of purchase amounts:", q3_purchase, "\n\n")

# Create histogram
ggplot(purchase_data, aes(x = PurchaseAmount)) +
  geom_histogram(binwidth = 50, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Purchase Amounts",
       x = "Purchase Amount",
       y = "Frequency") 
