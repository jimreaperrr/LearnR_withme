#S3 for OOP

"""

S3 uses a strict naming convention: all S3 methods have a name of the form generic.class

The converse is not true: a function can have a name containing a dot without being an S3 method. 
This is the case with many of the functions that have been around since the early days of the S language. 
For example, all.equal() is actually an S3 generic, not a method.
(This is an example of how leopard.case can be confusing.)

You can check if a function is an S3 generic by calling is_s3_generic() from the pryr package. 
You can also print it (by typing its name in the console), then looking to see if it calls UseMethod().


Similarly, you can check if a function is an S3 method by calling is_s3_method() from pryr
"""


#-------
#Ex: Checking if its a generic or a method 

library(pryr)

is_s3_generic("is.complex")
is_s3_generic("sort")


#--------

#Creating a generic function

"""
The first argument to an S3 generic is usually called x, 
though this isn't compulsory. It is also good practice to include a ... 
('ellipsis', or 'dot-dot-dot') argument, in case arguments need to be passed from one method to another.

"""

# Create get_n_elements
get_n_elements <- function (x, ...) {
  UseMethod("get_n_elements")
} 

#------------

#Creating an S3 Method(1)


# View get_n_elements
get_n_elements

# Create a data.frame method for get_n_elements
get_n_elements.data.frame <- function (x,...) {
  nrow(x) * ncol(x) # or prod(dim(x))
}

# Call the method on the sleep dataset
n_elements_sleep <- get_n_elements(sleep)

# View the result
n_elements_sleep

#----------

#Creating an S3 method(2)

# View pre-defined objects
ls.str()

# Create a default method for get_n_elements
get_n_elements.default <- function(x, ...) 
{
  length(unlist(x, use.names = FALSE))
}

# Call the method on the ability.cov dataset
n_elements_ability.cov <- get_n_elements(ability.cov)


#----------

#methods("function") 

#Finding Available Methods(1)
#To find all the avaiable methods for an S3 generic, call the methods() function

#It takes one agrument that can be passed with or without quotes

#Ex:
methods(print)

#------------

#R vs. C
#primitive functions 
.S3PrimitiveGenerics

#some R functions are written in C because its easier and faster 
#--------

#Method lookup for Primitive Generics

# View the structure of hair
str(hair)

# What primitive generics are available?
.S3PrimitiveGenerics

# Does length.hairstylist exist?
exists("length.hairstylist")

# What is the length of hair?
length(hair)

#---------

#Checking the classes of a variable

"""
Variables can have more than one class. In this case, class() returns a character vector of length
greater than one.

Likewise you can set multiple classes by assigning a character vector to class().
The classes should be ordered from more specific to more general as you move left to right,
since you want to begin with the behavior most targetted to your object.

"""

# View the kitty
kitty

# Assign classes
class(kitty) <- c("cat", "mammal", "character")

# Does kitty inherit from cat/mammal/character vector?
inherits(kitty, "cat" )
inherits(kitty, "mammal" )
inherits(kitty, "character" )

# Is kitty a character vector?
is.character(kitty)

# Does kitty inherit from dog?
inherits(kitty, "dog")

#--------------

#Writing the Next Method 


"""

When objects have multiple classes, you may wish to call methods for several of these classes. 
This is done using NextMethod().
"""

# Inspect your workspace
ls.str()

# cat method
what_am_i.cat <- function(x, ...)
{
  # Write a message
  message("I'm a cat")
  # Call NextMethod
  NextMethod("what_am_i")
}

# mammal method
what_am_i.mammal <- function(x, ...)
{
  message("I'm a mammal")
  NextMethod("what_am_i")
}

# character method
what_am_i.character <- function(x, ...)
{
  message("I'm a character vector")
}

# Call what_am_i()
what_am_i(kitty)

#-----------