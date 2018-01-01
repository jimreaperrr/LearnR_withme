#R introduction to object-oriented programming 


#------------


#A method is just a function, talked about in an OOP context 
#Two important variable types: list, environment

#Warning: OOP is usually not needed for data analysis
#OOP is a good idea when accessing web data, like api, gui, etc.
#OOP --> building tools --> use object-oriented programming
#analyzing data --> data science --> use functional programming

#Summary

# Functional programming --> think about the functions first

# OOP --> think about the data structures first.

# Data analyses --> Don't use OOP
#-----------


#Reference classes 
# S3 (fundamentals, use it regulary for OOP), S4 (Bioconducters), R6 (easier to work with, high performance)

#--------

# Explore the structure of chess
str(chess)

# Override the class of chess
class(chess)

# Is chess still a list?
is.list(chess)

# How many pieces are left on the board?
length(unlist(chess))
