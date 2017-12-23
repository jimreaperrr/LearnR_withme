#R functions fundamentals (basic)

#------------

my_func <- function(arg1, arg2) {
  body
}

#Ex: 

add <- function (x, y = 1) {
  x + y 
}

#To call add 

add(1)


#Output: return value 

f <- function (x) {
  if (x < 0) {
    -x
  } else {
    x
  }
}

#return forces the function to stop the execution and return the value

#Function are objects
#function without names are called anoymouse function where you have to do it all in one line 

(function (x) {x + 1})(2) #returns 3 



#------------------

#Environment or scoping inside/outside function 

#first looks locally then globally then return error 


l <- function(x) {x + 1}

m <- function () { 
  l <- function(x) x * 2
   l(10) #--> locally returns 20 
}

#Each call to a function has its own clean environment 

#-------------


#Two types of vectors in R 

#Two key properties: type, and length

#Atomic vectors (homogenous) --> 6 types : logical, integer, double, character, complex, and raw

#Lists: aka recursive vectors (hetrogenous), because lists can contain other lists. 

#-----------

#Lists 
# Created with list(), subset with [,[ ], or $

# 2nd element in tricky_list
tricky_list[[2]]

# Element called x in tricky_list
tricky_list[["x"]]

# 2nd element inside the element called x in tricky_list
tricky_list[["x"]][[2]]


#Exploring lists


# Guess where the regression model is stored
names(tricky_list)

# Use names() and str() on the model element
names(tricky_list$model)
str(tricky_list$model)

# Subset the coefficients element
tricky_list$model$coefficients

# Subset the wt element
tricky_list[["model"]][["coefficients"]][["wt"]]



#---------------

#for loops in R

primes_list <- list(2,3,5,7,11,13)

for(i in 1:length(primes_list)) { #Review what for loops look like in java: for (int i = 1, i < length(array), i++)
  print(primes_list[[i]])
}

#Looping over columns in a data frame = this is a bad way of doing it 

dt <- data.frame(
      a = rnorm(10),
      b = rnorm(10),
      c = rnorm(10),
      d = rnorm(10)
      )

for (i in 1:ncol(df)) {
  print(median(df[[i]])) #output will be nothing yet 
}


#DO THIS INSTEAD : seq_along(df) --> generates a sequence along the index of the object passed to it, but handles the empty case much better.

# Replace the 1:ncol(df) sequence
for (i in seq_along(df)) {
  print(median(df[[i]]))
}

# Change the value of df
df <- data.frame()

# Repeat for loop to verify there is no error
for (i in seq_along(df)) {
  print(median(df[[i]]))
}


#vector() 


# Create new double vector: output
output <- vector("double", ncol(df))

# Alter the loop
for (i in seq_along(df)) {
  # Change code to store result in output
  output[[i]] <- median(df[[i]])
}

# Print output
output


#---



