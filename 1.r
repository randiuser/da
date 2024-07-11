# List of products 
products <- list( 
  list(name = "Apple", price = 0.5), 
  list(name = "Banana", price = 0.3),
  list(name = "Milk", price = 2), 
  list(name = "Bread", price = 1.5),
  list(name = "Eggs", price = 2.5) 
) 

# Initialize shopping cart as an empty list 
shopping_cart <- list() 

# Define items to be added to the cart 
cart_items_to_add <- list( 
  list(name = "Apple", quantity = 3),
  list(name = "Milk", quantity = 2)
)

# Add items to the shopping cart 
for (item in cart_items_to_add) { 
  product_name <- item$name 
  quantity <- item$quantity 
  # Find the product in the list 
  product <- NULL 
  for (p in products) { 
    if (p$name == product_name) { 
      product <- p 
      break 
    } 
  } 
  if (!is.null(product)) { 
    cart_item <- list(name = product$name, price = product$price, quantity = quantity)
    shopping_cart <- c(shopping_cart, list(cart_item)) 
    cat("Item added to cart.\n") 
  } else { 
    cat("Product not found.\n") 
  } 
} 

# Calculate and display receipt 
subtotal <- 0 
cat("\nReceipt:\n") 
for (item in shopping_cart) { 
  item_subtotal <- item$price * item$quantity 
  cat(sprintf("%s (%d units) - Price: $%.2f - Subtotal: $%.2f \n", item$name, item$quantity, item$price, item_subtotal)) 
  subtotal <- subtotal + item_subtotal
} 

tax_rate <- 0.08
tax_amount <- subtotal * tax_rate 
total_cost_before_tax <- subtotal 
total_cost <- total_cost_before_tax + tax_amount 

cat("\nSubtotal: ", subtotal) 
cat("\nTax Amount  ", tax_amount) 
cat("\nTotal Cost: ", total_cost)
