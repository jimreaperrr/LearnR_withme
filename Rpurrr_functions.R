#Advanced inputs and outputs

"""
Now you've seen how useful the map functions are for reducing duplication, 
we'll introduce you to a few more functions in purrr that allow you to handle more 
complicated inputs and outputs. In particular, you'll learn how to deal with functions 
that might return an error, how to iterate 
over multiple arguments and how to iterate over functions that have no output at all.

"""

#When map functions fail hard 

#safely() --> always succeed whether it fails or not 
#Takes a function and returns a function
#Always returns two elements: result and error like NULL

#possibly() always succeeds, you give it a default value to return when there is an error.

#-------------


#safely()

"""

#safely() is an adverb; it takes a verb and modfies it.
That is, it takes a function as an agruement and it returns a function
as its output. The function that is return is modified, so it never throws
an error

"""

library(purrr)

# Create safe_readLines() by passing readLines() to safely()
safe_readLines <- safely(readLines())

# Call safe_readLines() on "http://example.org"
safe_readLines("http://example.org")

# Call safe_readLines() on "http://asdfasdasdkfjlda"
safe_readLines("http://asdfasdasdkfjlda")


#--------

#Using map safely()

"""
One feauture of safely() is that it plays nicely with the map()
functions.

"""

#Define safe_readLines()
safe_readLines() <- safely(readLines)

#Use the safe_readLines() function with map (): html
html <- map(urls, safe_readLines)

#call str() on html
str(html)

# Extract the result from one of the successful elements
html[["example"]][["result"]]

# Extract the error from the element that was unsuccessful
html[["asdf"]][["error"]]

#--------------


#Working with safe output 
#transpose () -> reshapes a list so the 
#inner-most level becomes the outer-most level("turns a list insideout")


# Define save_readLines() and html
safe_readLines <- safely(readLines)
html <- map(urls, safe_readLines)

# Examine the structure of transpose(html)
str(transpose(html))

# Extract the results: res
res <- transpose(html)[["result"]]

# Extract the errors: errs
errs <- transpose(html)[["error"]]

#--------

#Working with errors and results 


# Initialize some objects
safe_readLines <- safely(readLines)
html <- map(urls, safe_readLines)
res <- transpose(html)[["result"]]
errs <- transpose(html)[["error"]]

# Create a logical vector is_ok
is_ok <- map_lgl(errs, is_null)

# Extract the successful results
res[is_ok]

# Extract the input from the unsuccessful results
urls[!is_ok]

#------------

#map2() -->  iterate over two agruements 
#pmap() - iterate over many arguments 
#invoke_map() - iterate over functions and agruments 
#like map(), each has a whole family of functions --> map2_dbl()..etc.


#map()
# Create a list n containing the values: 5, 10, and 20
n <- list(5,10,20)

# Call map() on n with rnorm() to simulate three samples
map(n, rnorm)


#map2()
# Initialize n
n <- list(5, 10, 20)

# Create a list mu containing the values: 1, 5, and 10
mu <- list(1,5,10)

# Edit to call map2() on n and mu with rnorm() to simulate three samples
map2(n, mu, rnorm)

#pmap()

# Initialize n and mu
n <- list(5, 10, 20)
mu <- list(1, 5, 10)

# Create a sd list with the values: 0.1, 1 and 0.1
sd <- list(0.1, 1, 0.1)

# Edit this call to pmap() to iterate over the sd list as well
pmap(list(n, mu, sd), rnorm)

#---------------

#Argument matching 

# Name the elements of the argument list
pmap(list(mean = mu, n = n, sd = sd), rnorm)

#--------

#invoke_map() --> iterate over mutiple functions

# Define list of functions
f <- list("rnorm", "runif", "rexp")

# Parameter list for rnorm()
rnorm_params <- list(mean = 10)

# Add a min element with value 0 and max element with value 5
runif_params <- list(min = 0, max = 5)

# Add a rate element with value 5
rexp_params <- list(rate = 5)

# Define params for each function
params <- list(
  rnorm_params,
  runif_params,
  rexp_params
)

# Call invoke_map() on f supplying params as the second argument
invoke_map(f,params, n = 5)

#---------

#Map with side effects 
#Describe things that happen beyond the results of a function
#Examples include: printing output, plotting, and saving files to disk

#walk () 

#works just like map(), but is designed for functions called for
#their side effects. 

#--------------

#Walk() 

# Define list of functions
f <- list(Normal = "rnorm", Uniform = "runif", Exp = "rexp")

# Define params
params <- list(
  Normal = list(mean = 10),
  Uniform = list(min = 0, max = 5),
  Exp = list(rate = 5)
)

# Assign the simulated samples to sims
sims <- invoke_map(f, params, n = 50)

# Use walk() to make a histogram of each element in sims
walk(sims, hist)

#----------

#Walking over two or more agruments --> use map2()

# Replace "Sturges" with reasonable breaks for each sample
breaks_list <- list(
  Normal = seq(6, 16, 0.5),
  Uniform = seq(0, 5, 0.25),
  Exp = seq(0, 1.5, 0.1)
)

# Use walk2() to make histograms with the right breaks
walk2(sims, breaks_list, hist)

#-----------

#Putting together writing functions and walk 

"""
In the previous exercise, we hard-coded the breaks, 
but that was a little lazy. Those breaks probably won't be great 
if we change the parameters of our simulation.
A better idea would be to generate reasonable breaks based on the actual 
values in our simulated samples. This is a great chance to review our function
writing skills and combine our own function with purrr.

"""

# Turn this snippet into find_breaks()
find_breaks <- function (x) {
  rng <- range(x, na.rm = TRUE)
  seq(rng[1], rng[2], length.out = 30)
}

# Call find_breaks() on sims[[1]]
find_breaks(sims[[1]])

#-------------


#Do this again with walk2() --> because we have the sample breaks

# Use map() to iterate find_breaks() over sims: nice_breaks
nice_breaks <- map(sims, find_breaks)

# Use nice_breaks as the second argument to walk2()
walk2(sims, nice_breaks, hist)

#--------

#cleaning the plot axis labels --> pwalk()

# Increase sample size to 1000
sims <- invoke_map(f, params, n = 1000)

# Compute nice_breaks (don't change this)
nice_breaks <- map(sims, find_breaks)

# Create a vector nice_titles
nice_titles <- c("Normal(10, 1)", "Uniform(0, 5)", "Exp(5)")

# Use pwalk() instead of walk2()
pwalk(list(x = sims, breaks = nice_breaks, main = nice_titles), hist, xlab = "")

#---------

#Pipelines -> a pipeline is just a short way of saying "a statement with lots of pipes"

# Pipe this along to map(), using summary() as .f
sims %>%
  walk(hist) %>%
    map(summary)


#-------------