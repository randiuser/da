# Simplified Student Performance Analysis

# Sample student data
students <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Math = c(85, 92, 78, 95, 88),
  Science = c(90, 88, 75, 92, 95),
  History = c(88, 90, 82, 89, 91),
  Attendance = c(95, 98, 80, 92, 85)
)

# Analyze and report function
analyze_students <- function(data, attend_threshold = 85) {
  data$Average <- rowMeans(data[, c("Math", "Science", "History")])
  data$AttendStatus <- ifelse(data$Attendance < attend_threshold, "Low", "Good")
  
  for(i in 1:nrow(data)) {
    with(data[i,], cat(sprintf(
      "%s: Avg Score = %.1f, Attendance = %d%% (%s)\n",
      Name, Average, Attendance, AttendStatus
    )))
  }
  
  return(data)
}

# Run analysis
result <- analyze_students(students)
print(result)
