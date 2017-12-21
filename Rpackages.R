""" Load an R Package

There are basically two extremely important functions when it comes down to R packages:

install.packages(), which as you can expect, installs a given package.
library() which loads packages, i.e. attaches them to the search list on your R workspace.
To install packages, you need administrator privileges. This means that install.packages() will thus not work in the DataCamp interface. However, almost all CRAN packages are installed on our servers. You can load them with library().

In this exercise, you'll be learning how to load the ggplot2 package, a powerful package for data visualization. You'll use it to create a plot of two variables of the mtcars data frame. The data has already been prepared for you in the workspace.

Before starting, execute the following commands in the console:

search(), to look at the currently attached packages and
qplot(mtcars$wt, mtcars$hp), to build a plot of two variables of the mtcars data frame.

"""

# Load the ggplot2 package
library(ggplot2)

# Retry the qplot() function
qplot(mtcars$wt, mtcars$hp)

# Check out the currently attached packages again
search()

#Different ways to load a package
"""
The library() and require() functions are not very picky when it comes down to argument types: 
both library(rjson) and library("rjson") work perfectly fine for loading a package.

Have a look at some more code chunks that (attempt to) load one or more packages:
  #Chunk 1
  library(data.table)
  require(rjson)

  # Chunk 2
  library("data.table)
  require(rjson) """

