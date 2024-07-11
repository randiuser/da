
library(forecast)

# Create a data frame with Month and Sales data
sales_data <- data.frame(
  Month = seq(as.Date("2023-01-01"), as.Date("2023-06-01"), by = "month"),
  Sales = c(12000, 15000, 18000, 16000, 20000, 22000)
)

# Convert sales data to a time series object
sales_ts <- ts(sales_data$Sales, start = c(2023, 1), frequency = 12)

# Fit ARIMA model
arima_model <- auto.arima(sales_ts)

# Forecast sales for the next three months
forecast_result <- forecast(arima_model, h = 3)

# Display the forecasted sales results
print(forecast_result)

# Plot the forecast
plot(forecast_result, main = "Sales Forecast for Next 3 Months",
     xlab = "Month", ylab = "Sales")
