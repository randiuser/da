

# Generate two matrices
matrix_A <- matrix(sample(1:10, 9, replace = TRUE), nrow = 3, ncol = 3)
matrix_B <- matrix(sample(1:10, 9, replace = TRUE), nrow = 3, ncol = 3)

# Display the original matrices
cat("Matrix A:\n")
print(matrix_A)
cat("\nMatrix B:\n")
print(matrix_B)

# Element-wise addition
addition_result <- matrix_A + matrix_B
cat("\n Addition (A + B):\n")
print(addition_result)

# Scalar multiplication (multiplying matrix A by 2)
scalar_mult_result <- 2 * matrix_A
cat("\nScalar Multiplication (2 * A):\n")
print(scalar_mult_result)

# Matrix transpose
transpose_A <- t(matrix_A)
cat("\nTranspose of Matrix A:\n")
print(transpose_A)

# Matrix multiplication
multiplication_result <- matrix_A %*% matrix_B
cat("\nMatrix Multiplication (A * B):\n")
print(multiplication_result)
