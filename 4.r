# Inventory Management System

# Initialize inventory vectors
items <- c()
quantities <- c()

# Function to add a new item
add_item <- function(item, quantity) {
  if (item %in% items) {
    cat("Item already exists. Use update function to change quantity.\n")
  } else {
    items <<- c(items, item)
    quantities <<- c(quantities, quantity)
    cat("Item added successfully.\n")
  }
}

# Function to update quantity of an existing item
update_quantity <- function(item, new_quantity) {
  if (item %in% items) {
    index <- which(items == item)
    quantities[index] <<- new_quantity
    cat("Quantity updated successfully.\n")
  } else {
    cat("Item not found in inventory.\n")
  }
}

# Function to display inventory
display_inventory <- function() {
  if (length(items) == 0) {
    cat("Inventory is empty.\n")
  } else {
    cat("\nCurrent Inventory:\n")
    cat("------------------\n")
    for (i in 1:length(items)) {
      cat(sprintf("%-20s : %d\n", items[i], quantities[i]))
    }
  }
}

# Function to handle user interactions
manage_inventory <- function() {
  while (TRUE) {
    cat("\nInventory Management System\n")
    cat("1. Add new item\n")
    cat("2. Update quantity\n")
    cat("3. Display inventory\n")
    cat("4. Exit\n")
    choice <- as.integer(readline("Enter your choice (1-4): "))
    
    switch(choice,
           "1" = {
             item <- readline("Enter item name: ")
             quantity <- as.integer(readline("Enter quantity: "))
             add_item(item, quantity)
           },
           "2" = {
             item <- readline("Enter item name: ")
             new_quantity <- as.integer(readline("Enter new quantity: "))
             update_quantity(item, new_quantity)
           },
           "3" = {
             display_inventory()
           },
           "4" = {
             cat("Exiting program.\n")
             break
           },
           {
             cat("Invalid choice. Please try again.\n")
           }
    )
  }
}

# Run the inventory management system
manage_inventory()
