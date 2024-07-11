# Simplified Library Fine Calculator

# Constants
GRACE_PERIOD <- 7
DAILY_FINE <- 1.50
MAX_FINE <- 100

# Calculate fine
calc_fine <- function(days) {
  if (days <= GRACE_PERIOD) 0
  else min((days - GRACE_PERIOD) * DAILY_FINE, MAX_FINE)
}

# Sample data: Student ID, Course 1 days, Course 2 days, ...
students <- list(
  c(1, 0, 10, 15, 5, 30),
  c(2, 8, 0, 20, 3, 12),
  c(3, 30, 35, 0, 40, 5)
)

# Process students
for (student in students) {
  id <- student[1]
  days <- student[-1]
  fines <- sapply(days, calc_fine)
  total_fine <- sum(fines)
  
  cat("\nStudent", id, ":\n")
  cat("Course fines: $", paste(fines, collapse = ", $"), "\n")
  cat("Total fine: $", total_fine, "\n")
  
  if (total_fine == 0) {
    cat("No fines.\n")
  } else if (total_fine < MAX_FINE) {
    cat("Fines within range.\n")
  } else {
    cat("Maximum fine reached.\n")
  }
}
