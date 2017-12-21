# Consult the documentation on the mean() function
help(mean)
# Inspect the arguments of the mean() function
args(mean)# Consult the documentation on the mean() function

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate average number of views
avg_li <-mean(linkedin)
avg_fb <-mean(facebook)

# Inspect avg_li and avg_fb
print(avg_li)
print(avg_fb)

#calculate avg sum using mean and trim = round?

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
avg_sum <- mean(linkedin + facebook)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(linkedin + facebook, trim = 0.2)

# Inspect both new variables
print(avg_sum)
print(avg_sum_trimmed)

#Remove NA values

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Advanced average of linkedin
mean(linkedin, trim = 0, na.rm = TRUE)

# Calculate the mean absolute deviation
mean(abs(linkedin - facebook),na.rm =TRUE)

#Build your own function

""" 
my_fun <- function(arg1, arg2) {
  body
}
"""

# Create a function pow_two()
pow_two <- function(x) {
  x ^ 2
}

# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(x, y) {
  abs(x) + abs(y)
}

# Use the function
sum_abs(-2, 3)


#write your own functions with a default value

# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
  y <- x ^ 2
  if(print_info == TRUE) {
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}
#more examples
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return (num_views)
    
  } else {
    print("Try to be more visible!")
    return (0)
  }
}

# Define the interpret_all() function
# views: vector with data to interpret
# return_sum: return total number of views on popular days?

interpret_all <- function(views, return_sum = TRUE) {
  count <- 0
  
  for (v in views) {
    count <- count + interpret(v)
  }
  
  if (return_sum == TRUE) {
    return (count)
    
  } else {
    return (NULL)
  }
}