#Robust functions 

#-------------

# Three main problems 
# - Type-unstable functions 
# - Non-standard evaluation
# - Hidden agruments 


#Throwing errors 
#Ex.1:
if (condition) { 
 stop("Error", call. = FALSE) 
}

#Ex.2:

if (!is.character(x)) {
  stop("'x' should be a character vector", call. = FALSE)
}

#----------------

#stopifnot() 

"""
Using stopifnot() is a quick way to have your function stop, if a condition isn't meant. 
stopifnot() takes logical expressions as arguments and if any are FALSE an error will occur.

"""

# Define troublesome x and y
x <- c(NA, NA, NA)
y <- c( 1, NA, NA, NA)

both_na <- function(x, y) {
  # Add stopifnot() to check length of x and y
  stopifnot(length(x) == length(y))
  
  sum(is.na(x) & is.na(y))
}

# Call both_na() on x and y
both_na(x, y)

#---------
# stop()

# Define troublesome x and y
x <- c(NA, NA, NA)
y <- c( 1, NA, NA, NA)

both_na <- function(x, y) {
  # Replace condition with logical
  if (!(length(x) == length(y))) {
    # Replace "Error" with better message
    stop("x and y must have the same length", call. = FALSE)
  }  
  
  sum(is.na(x) & is.na(y))
}

# Call both_na() 
both_na(x, y)


#-----------

#Surprises due to unstable types 

# - Type inconsistent: the type of the return object depends on the input
#       Surprises occur when you've used a type-inconsistent function inside your own function
#       Sometimes lead to hard to decipher error messages 

#Ex. 1

last_row <-function(df) {
  df[nrow(df), , drop = FALSE]
}

df <- data.frame(x = 1:3)

str(last_row(df))

#------------

#Using purrr solves the problem -> map()

# sapply calls
A <- sapply(df[1:4], class) 
B <- sapply(df[3:4], class)
C <- sapply(df[1:2], class) 

# Demonstrate type inconsistency
str(A)
str(B)
str(C)

# Use map() to define X, Y and Z
X <- map(df[1:4], class)
Y <- map(df[3:4], class)
Z <- map(df[1:2], class)


# Use str() to check type consistency
str(X)
str(Y)
str(Z)

#--------

#A type consistent solutin --> map_chr()


col_classes <- function(df) {
  # Assign list output to class_list
  class_list <- map(df, class)
  
  # Use map_chr() to extract first element in class_list
  map_chr(class_list, 1)
}

# Check that our new function is type consistent
df %>% col_classes() %>% str()
df[3:4] %>% col_classes() %>% str()
df[1:2] %>% col_classes() %>% str()

#------------

#flatten_chr


"""
flatten_chr() is yet another useful function in purrr. It takes a list and removes its hierarchy. 
The suffix _chr indicates that this is another type consistent function, and will either return
a character string or an error message.)

"""

col_classes <- function(df) {
  class_list <- map(df, class)
  
  # Add a check that no element of class_list has length > 1
  if (any(map_dbl(class_list, length) > 1)) {
    stop("Some columns have more than one class", call. = FALSE)
  }
  
  # Use flatten_chr() to return a character vector
  flatten_chr(class_list)
}

# Check that our new function is type consistent
df %>% col_classes() %>% str()
df[3:4] %>% col_classes() %>% str()
df[1:2] %>% col_classes() %>% str()


#-------------

#Non-stardard evaluation functions 

# - Don't use the usual lookup rules
# - Great for data analysis, because they save typing

#Other NSE functions: ggplot2, dplyr 

# - Using NSE functions inside your own functions can cause surprises, avoid using them inside...

#--------------

#Ex. of NSE functions --> big_x() 


# Use big_x() to find rows in diamonds_sub where x > 7
big_x(diamonds_sub, threshold = 7)

#- attempts to return all rows in df where the x column exceeds a certain threshold


#--------------

#Cont 


# Remove the x column from diamonds
diamonds_sub$x <- NULL

# Create variable x with value 1
x <-1

# Use big_x() to find rows in diamonds_sub where x > 7
big_x(diamonds_sub, x > 7)

# Create a threshold column with value 100
diamonds_sub$threshold <- 100

# Use big_x() to find rows in diamonds_sub where x > 7
big_x(diamonds_sub, x > 7)


#--------------

#Writing a function to fix the to check if a name is in a dataframe or not etc...


big_x <- function(df, threshold) {
  # Write a check for x not being in df
  if( !"x" %in% names(df)) {
    stop("df must contain variable called x", call. = FALSE)
  }
  
  # Write a check for threshold being in df
  if("threshold" %in% names(df)) {
    stop("df must not contain variable called threshold", call. = FALSE)
  }
  
  
  dplyr::filter(df, x > threshold)
}

#-------------

#Pure functions

# - Their output only depends on their inputs
# - They don't affect the outside world except through their return value
#     Hidden agruments are function inputs that may be different for different users or sessions
#     Common example: agrument defaults that depend on global options 

#global options 
#Getting and setting options

#Ex.
getOption("digits")
options(digit = 5)
getOption("digits")


#Relying on options in your code 
# - The return value of a function should never depend on a global option
# - Side effects may be controlled by global options 


#-------------

#Ex.1: options 


# Read in the swimming_pools.csv to pools
pools <- read.csv("swimming_pools.csv")

# Examine the structure of pools
str(pools)

# Change the global stringsAsFactor option to FALSE
options(stringsAsFactor = FALSE)

# Read in the swimming_pools.csv to pools2
pools2 <- read.csv("swimming_pools.csv")

# Examine the structure of pools2
str(pools2)

#-----------

#Ex.2 :

# Fit a regression model
fit <- lm(mpg ~ wt, data = mtcars)

# Look at the summary of the model
summary(fit)

# Set the global digits option to 2
options(digits = 2)

# Take another look at the summary
summary(fit)

#------------





