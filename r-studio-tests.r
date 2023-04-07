# Print "Hello, world!" to the console
cat("Hello, world!\n")

# Generate a sequence of numbers from 1 to 10
seq(1, 10)

# Create a vector of numbers
my_vector <- c(1, 2, 3, 4, 5)

# Sum the elements in the vector
sum(my_vector)

# Generate a plot of a sine wave
x <- seq(0, 2*pi, length.out=50)
y <- sin(x)
plot(x, y)

# Load a built-in dataset and print the first few rows
data(mtcars)
head(mtcars)

# Install and load a package
install.packages("ggplot2")
library(ggplot2)

# Generate a scatter plot using ggplot2
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()

# Create a data frame
my_df <- data.frame(x = c(1, 2, 3), y = c(4, 5, 6))
my_df

# Compute the mean of a vector
mean(my_vector)

# Create a matrix
my_matrix <- matrix(1:9, nrow = 3, ncol = 3)
my_matrix

# Subset a data frame
subset(mtcars, mpg > 20)

# Generate a histogram of a variable in mtcars
hist(mtcars$mpg)

# Write a data frame to a CSV file
write.csv(mtcars, "mtcars.csv")
