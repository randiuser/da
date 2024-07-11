library(dplyr)

# Sample data
employees <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Dept = c("Sales", "IT", "HR", "Sales", "IT"),
  Salary = c(50000, 60000, 55000, 52000, 62000),
  Years = c(5, 7, 3, 6, 8)
)

performance <- data.frame(
  ID = 1:5,
  Rating = c(4.5, 4.2, 3.8, 4.0, 4.7)
)

# i. Filter and Select
sales_employees <- employees %>%
  filter(Dept == "Sales") %>%
  select(Name, Salary)

# ii. Mutate
employees <- employees %>%
  mutate(Bonus = Salary * 0.1 * (Years / 10))

# iii. Group and Summarize
dept_avg_salary <- employees %>%
  group_by(Dept) %>%
  summarize(AvgSalary = mean(Salary))

# iv. Arrange
sorted_employees <- employees %>%
  arrange(desc(Salary))

# v. Join
employee_performance <- employees %>%
  left_join(performance, by = "ID")

# Display results
print(sales_employees)
print(dept_avg_salary)
print(head(sorted_employees))
print(head(employee_performance))
