# Load necessary libraries
library(ggplot2)
library(gridExtra)

# Prepare example data
set.seed(123)  # For reproducibility
student_data <- data.frame(
  Name = paste("Student", 1:20),
  Score = round(runif(20, 60, 100), 1),
  Attendance = round(runif(20, 70, 100), 1),
  Time = 1:20  # Assuming scores were collected at different time intervals
)

# 1. Scatter plot: Scores vs Attendance
scatter_plot <- ggplot(student_data, aes(x = Attendance, y = Score)) +
  geom_point(color = "blue", size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Relationship between Scores and Attendance",
       x = "Attendance Percentage", y = "Score") +
  theme_minimal()

# 2. Bar plot: Distribution of scores among students
bar_plot <- ggplot(student_data, aes(x = reorder(Name, -Score), y = Score)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Distribution of Scores Among Students",
       x = "Student", y = "Score") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# 3. Line plot: Trend of scores over time
line_plot <- ggplot(student_data, aes(x = Time, y = Score)) +
  geom_line(color = "green", size = 1) +
  geom_point(color = "darkgreen", size = 3) +
  labs(title = "Trend of Scores Over Time",
       x = "Time Interval", y = "Score") +
  theme_minimal()

# 4. Histogram: Distribution of scores
histogram_plot <- ggplot(student_data, aes(x = Score)) +
  geom_histogram(binwidth = 5, fill = "orange", color = "black") +
  labs(title = "Distribution of Scores",
       x = "Score", y = "Frequency") +
  theme_minimal()

# Arrange plots in a 2x2 grid
grid.arrange(scatter_plot, bar_plot, line_plot, histogram_plot, 
             ncol = 2, nrow = 2,
             top = "Student Performance Analysis")

