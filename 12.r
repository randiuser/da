library(dplyr)
library(ggplot2)

# Task 1: Data Overview and Structure
ipl <- read.csv("ipl_data.csv")
str(ipl)
summary(ipl)

# Task 2: Basic Data Insights
cat("Total matches:", nrow(ipl), "\n")
unique_teams <- unique(c(ipl$Team1, ipl$Team2))
cat("Unique teams:", length(unique_teams), "\n", unique_teams, "\n")

# Task 3: Team Performance Analysis
wins <- table(ipl$Winner)
print(wins)
cat("Avg runs:", mean(ipl$Total.Runs, na.rm=TRUE), "\n")
cat("Avg wickets:", mean(ipl$Total.Wickets, na.rm=TRUE), "\n")

# Task 4: Venue Insights
cat("Most frequent venue:", names(which.max(table(ipl$Venue))), "\n")

# Task 5: Visualization
ggplot(data.frame(team=names(wins), wins=as.numeric(wins)), 
       aes(x=reorder(team, -wins), y=wins)) +
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle=45, hjust=1)) +
  labs(title="Matches Won by Each Team", x="Team", y="Wins")
