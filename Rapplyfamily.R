#Use lapply with a built-in R function
"""
To put it generally, lapply takes a vector or list X, and applies the function FUN to each of its members. 
If FUN requires additional arguments, you pass them after you've specified X and FUN (...). 
The output of lapply() is a list, the same length as X, where each element is the result of 
applying FUN on the corresponding element of X.

"""

# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)

#Use lapply with your own function 
"""
you can use lapply() on your own functions as well. You just need to code a new 
function and make sure it is available in the workspace. After that, you can use 
the function inside lapply() just as you did with base R functions. """ 

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

#lapply and anonymous functions 
"""
# Named function
triple <- function(x) { 3 * x }

# Anonymous function with same implementation
function(x) { 3 * x }

# Use anonymous function inside lapply()
lapply(list(1,2,3), function(x) { 3 * x })

"""

#example
# Transform: use anonymous function inside lapply
names <- lapply(split_low, function (x) {x[1]})

# Transform: use anonymous function inside lapply
years <- lapply(split_low, function(x) {x[2]})

# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years

names<- lapply(split_low,select_el, index =1)
years <- lapply(split_low, select_el, index =2)

#Apply functions that return NULL

lapply(split_low, function(x) {
  if (nchar(x[1]) > 5) {
    return(NULL)
  } else {
    return(x[2])
  }
})

"""
In all of the previous exercises, it was assumed that the 
functions that were applied over vectors and lists actually returned 
a meaningful result. For example, the tolower() function simply returns
the strings with the characters in lowercase. This won't always be the case. 
Suppose you want to display the structure 
of every element of a list. You could use the str() function for this, which returns NULL:

lapply(list(1, "a", TRUE), str)


"""

#sapply

"""
You can use sapply() similar to how you used lapply(). The first argument 
of sapply() is the list or vector X over which you want to apply a function, FUN. 
Potential additional arguments to this function are specified afterwards (...):

sapply(X, FUN, ...) """

temp <- list(1:10,-10:1,-11:20)
# Use lapply() to find each day's minimum temperature
lapply(temp,min)

# Use sapply() to find each day's minimum temperature
sapply(temp, min)

# Use lapply() to find each day's maximum temperature
lapply(temp, max)

# Use sapply() to find each day's maximum temperature
sapply(temp, max)

# Finish function definition of extremes_avg
extremes_avg <- function(x) {
  ( min(x) + max(x)) / 2
}
#sapply with your own function

# Apply extremes_avg() over temp using sapply()
sapply(temp, extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp, extremes_avg)

# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp, extremes)

# Apply extremes() over temp with lapply()
lapply(temp, extremes)

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp, below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply(temp, below_zero)

# Are freezing_s and freezing_l identical?
identical(freezing_s, freezing_l)

# Definition of print_info()
print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using sapply()
sapply(temp, print_info)

# Apply print_info() over temp using lapply()
lapply(temp, print_info)


#vapply 

""" 
vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)
Over the elements inside X, the function FUN is applied. 
The FUN.VALUE argument expects a template for the return 
argument of this function FUN. USE.NAMES is TRUE by default; 
in this case vapply() tries to generate a named array, if possible.

"""

# Definition of basics()
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()
vapply(temp, basics, numeric(3))

# Definition of the basics() function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))

# Convert to vapply() expression
sapply(temp, max)

# Convert to vapply() expression
sapply(temp, function(x, y) { mean(x) > y }, y = 5)

# Convert to vapply() expression
vapply(temp, max, numeric(1))

# Convert to vapply() expression
vapply(temp, function(x, y) { mean(x) > y }, logical(1), y = 5)
