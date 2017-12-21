"""
A list in R allows you to gather a variety of objects under one name (that is, the name of the list) 
in an ordered way. These objects can be matrices, vectors, data frames, even other lists, etc. 
It is not even required that these objects are related to each other in any way.

You could say that a list is some kind super data type: you can store practically any piece 
of information in it!
"""

# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

"""
Just like on your to-do list, you want to avoid not knowing or remembering 
what the components of your list stand for. That is why you should give names to them:
"""

# Construct list with these different elements:
my_list <- list(vec = my_vector,mat = my_matrix, df = my_df)
print(my_list)

"""
Besides selecting components, you often need to select specific elements out of 
these components. For example, with shining_list[[2]][1] you select from the 
second component, actors (shining_list[[2]]), the first element ([1]).
When you type this in the console, you will see the answer is Jack Nicholson.
"""
# Print out the vector representing the actors
shining_list$actors

# Print the second element of the vector representing the actors
shining_list$actors[2]

"""
To conveniently add elements to lists you can use the c() function, 
that you also used to build vectors:

ext_list <- c(my_list , my_val)

This will simply extend the original list, my_list, with the component my_val. 
This component gets appended to the end of the list 

"""

# We forgot something; add the year to shining_list
shining_list_full <- c(shining_list, year = 1980)

# Have a look at shining_list_full
str(shining_list_full)
