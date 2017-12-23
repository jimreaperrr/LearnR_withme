#R functional programming 


"""

You already know how to use a for loop. The goal of this chapter is to teach you how to use 
the map functions in the purrr package which remove the code that's duplicated across multiple for loops. 
After completing this chapter 
you'll be able to solve new iteration problems with greater ease (faster and with fewer bugs).

"""

#---------
#Using a for loop to remove duplication 

# Initialize output vector
output <- vector("double", ncol(df))  

# Fill in the body of the for loop
for (i in seq_along(df)) {            
  output[[i]] <- median(df[[i]])
}

# View the result
output

#------------

#Turning the for loop into a function 


# Turn this code into col_median()
col_median <- function(df) {
  output <- vector("double", ncol(df))
  for (i in seq_along(df)) {
    output[[i]] <- median(df[[i]])
  }
  output
}

#-----------

#functions can be agrumenets too 

# Find the column medians using col_median() and col_summary()
col_median(df)
col_summary(df, median)

# Find the column means using col_mean() and col_summary()
col_mean(df)
col_summary(df, mean)

# Find the column IQRs using col_summary()
col_summary(df, IQR)

#-------------


library(purrr)

#every map function works the same way 
# map_dbl(.x, .f, ...)
#1. Loop over a vector .x 
#2. Do something to each element .f
#3 Return the results 

#The map functions differ in their return type
#1. map() returns a list
#2. map_dbl() returns a double vector 
#3. map_lgl() returns a logical vector 
#4. map_int() returns a integer vector 
#5. map_chr() returns a character vector 

#Ex: data frames, iterate over columns 

df <- data.frame(a = 1.10, b = 11:20)
map(df, mean)

#Ex: atomtic vector, iterates over elements 

vec <- c(a =1, b =2)
map(vec, mean)


#advtanges of the map functions in purrr 
#handy shortcuts for specifying functions
# More consistent than sapply(), lapply() 
#Takes much less time to solve iteration problem 

#--------------

#Important to know 


"""
map() returns a list or data frame
map_lgl() returns a logical vector
map_int() returns a integer vector
map_dbl() returns a double vector
map_chr() returns a character vector

"""

#Ex: 
# Load the purrr package
library(purrr)

# Use map_dbl() to find column means
map_dbl(df, mean)

# Use map_dbl() to column medians
map_dbl(df, median)

# Use map_dbl() to find column standard deviations
map_dbl(df, sd)

#----------------


#More Example with map functions


# Find the columns that are numeric
map_lgl(df3, is.numeric)

# Find the type of each column
map_chr(df3, typeof)

# Find a summary of each column
map(df3,summary)

#---------

#Agruments in map functions

#Ex:

# Find the mean of each column
map_dbl(planes, mean)

# Find the mean of each column, excluding missing values
map_dbl(planes, mean, na.rm = TRUE)

# Find the 5th percentile of each column, excluding missing values
map_dbl(planes, quantile, probs = c(0.05), na.rm = TRUE)

#----------------

#Shortcuts for specifying functions 

#map(df, summary) --> An existing function
#map(df, rescale01) --> An existing function you defined
#map(df, function(x) sum(is.na(x))) --> An anonymous function defined on the fly
#map(df, ~ sum(is.na(.))) --> An anonymous function defined using a formula shortcut 


#--------------

#Ex:

# Examine the structure of cyl
str(cyl)

# Extract the first element into four_cyls
four_cyls <- cyl[[1]]

# Fit a linear regression of mpg on wt using four_cyls
lm(mpg ~ wt, data = four_cyls)

# Rewrite to call an anonymous function
map(cyl, function(df) lm(mpg ~ wt, data = df))

# Rewrite to use the formula shortcut instead
map(cyl, ~ lm(mpg ~ wt, data = .))

# Save the result from the previous exercise to the variable models
models <- map(cyl, ~ lm(mpg ~ wt, data = .))

# Use map and coef to get the coefficients for each model: coefs
coefs <- map(models,coef)

# Use string shortcut to extract the wt coefficient 
map(models, "wt")

# use map_dbl with the numeric shortcut to pull out the second element
map_dbl(coefs, 2)

#-----

#pipes

"""
purrr also includes a pipe operator: %>%. 
The pipe operator is another shortcut that saves typing, but also increases readability. 
The explanation of the pipe operator is quite simple: x %>% f(y) is another way of writing f(x, y).
That is, the left hand side of the pipe, x, becomes the first argument to the function, f(), 
on the right hand side of the pipe.

"""

# Define models (don't change)
models <- mtcars %>% 
  split(mtcars$cyl) %>%
  map(~ lm(mpg ~ wt, data = .))

# Rewrite to be a single command using pipes 
models %>% 
  map(summary) %>%
  map_dbl("r.squared")

#---------



