#When and how you should write a function 

#------------


#snippet code 

# Define example vector x
x <- c(1:10)


# Rewrite this snippet to refer to x
(x - min(x, na.rm = TRUE)) /
  (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))

#Different approach using range()

# Define example vector x
x <- 1:10 

# Define rng
rng <- range(x, na.rm = TRUE)

# Rewrite this snippet to refer to the elements of rng
(x - rng[1]) / 
  (rng[2] - rng[1]) #rng[2] = max, rng[1] = min


#Now actually write a function

# Test your function, call rescale01 using the vector x as the argument
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE) 
  
  (x - rng[1]) / (rng[2] - rng[1])
}

rescale01(x)


#-----------------


#How should you write a function 

#Start with a simple problem
#Get a working snippet of code
#Rewrite to use temporary variables
#Rewrite for clarity 


#Ex:

# Define example vectors x and y
x <- c( 1, 2, NA, 3, NA)
y <- c(NA, 3, NA, 3,  4)

# Count how many elements are missing in both x and y
sum(is.na(x) & is.na(y))

# Turn this snippet into a function: both_na()

both_na <- function(x,y) {
  sum(is.na(x) & is.na(y))
}

x <-  c(NA, NA, NA)
y1 <- c( 1, NA, NA)
y2 <- c( 1, NA, NA, NA)


# Call both_na on x, y1
both_na(x,y1)

# Call both_na on x, y2
both_na(x,y2)


#-------------


#How can you write a good function 

#Correct, understandable


#return statements

mean_ci <- function(x, level = 0.95) {
  if (length(x) == 0) {
    warning("`x` was empty", call. = FALSE)
    return(c(-Inf, Inf))
  }
  se <- sd(x) / sqrt(length(x))
  alpha <- 1 - level
  mean(x) + se * qnorm(c(alpha / 2, 1 - alpha / 2))
}



#Another example of a good function

replace_missings <- function(x, replacement) {
  is_miss <- is.na(x)
  x[is_miss] <- replacement
  
  # Rewrite to use message()
  message(sum(is_miss), " missings replaced by the value ", replacement)
  x
}

# Check your new function by running on df$z
replace_missings(df$z, replacement = 0)

#------------

