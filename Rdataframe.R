"""A data frame has the variables of a data set as columns and the observations as rows."""

# Call head() on mtcars
head(mtcars)

"""The function str() shows you the structure of your data set. For a data frame it tells you:

The total number of observations (e.g. 32 car types)
The total number of variables (e.g. 11 car features)
A full list of the variables names (e.g. mpg, cyl ... )
The data type of each variable (e.g. num)
The first observations

""" 

# Investigate the structure of mtcars
str(mtcars)

""" You construct a data frame with the data.frame() function. 
As arguments, you pass the vectors from before: they will become the different 
columns of your data frame. Because every column has the same length, 
the vectors you pass should also have the same length. But don't
forget that it is possible (and likely) that they contain different types of data."""

# Definition of vectors
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name,type,diameter,rotation,rings)

# Check the structure of planets_df
str(planets_df)

# The planets_df data frame from the previous exercise is pre-loaded
planets_df[1,3]

# Print out diameter of Mercury (row 1, column 3)
print(planets_df[1.3])

# Select the second column, named day2, from li_df: second
li_df$day2

# Print out data for Mars (entire fourth row)
print(planets_df[4,])

# Select first 5 values of diameter column
print(colnames(planets_df))
print(planets_df[1:5,"diameter"])

# Select the rings variable from planets_df
rings_vector <- planets_df$rings
print(rings_vector)

# Adapt the code to select all columns for planets with rings
planets_df[rings_vector, ]

# Select planets with diameter < 1
subset(planets_df, subset = diameter < 1)

"""
order() is a function that gives you the ranked position of each 
element when it is applied on a variable
"""
a <- c(100,10,1000)
order(a)
#returns > [1] 2 1 3

# Use order() to create positions
positions <-  order(planets_df$diameter)

# Use positions to sort planets_df
print(planets_df[positions,])




