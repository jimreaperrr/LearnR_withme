#packages readr &  data.table 


#--------

#readr 
#fast and easy to use compare to util who is slower.

#install.packages("readr")
#library(readr)

#--> USE read_csv() not read.csv() 


# Load the readr package
library(readr)

# Import potatoes.csv with read_csv(): potatoes
potatoes <- read_csv("potatoes.csv")

#------------

#for text files use read_tsv() 

# Column names
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import potatoes.txt: potatoes
potatoes <- read_tsv("potatoes.txt", col_names = properties)

# Call head() on potatoes
head(potatoes)

#-----------

#read_delim is the main readr function
#read_delim takes two mandatory function 
#file and delim

# Column names
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import potatoes.txt using read_delim(): potatoes

potatoes <- read_delim("potatoes.txt", delim = "\t", col_names = properties)
# Print out potatoes
print(potatoes)

#-----------

#skip and n_max 
#Through skip and n_max you can control which part of your flat file you're actually importing into R.

#skip specifies the number of lines you're ignoring in the flat file before actually starting to import data. 
#n_max specifies the number of lines you're actually importing.

# Column names
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import 5 observations from potatoes.txt: potatoes_fragment
potatoes_fragment <- read_tsv("potatoes.txt", skip = 6, n_max = 5, col_names = properties)

#-----

#col_types 

"""
You can also specify which types the columns in your imported data frame should have. You can do this with col_types.
If set to NULL, the default, functions from the readr package will try to find the correct types themselves. 
You can manually set the types with a string, where each character denotes the class of the column: 

character, double, integer and logical. _ skips the column as a whole.

"""

# Column names
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import all data, but force all columns to be character: potatoes_char
potatoes_char <- read_tsv("potatoes.txt", col_types = "cccccccc", col_names = properties)

# Print out structure of potatoes_char
str(potatoes_char)

#-----

#col_types with collectors 

"""

Another way of setting the types of the imported columns is using collectors. 
Collector functions can be passed in a list() to the col_types argument of
read_ functions to tell them how to interpret values in a column.

We gonna be using these for this exercise:

col_integer(): the column should be interpreted as an integer.
col_factor(levels, ordered = FALSE): the column should be interpreted as a factor with levels.

"""

#Import without col_types
hotdogs <- read_tsv("hotdogs.txt", col_names = c("type", "calories", "sodium"))

# Display the summary of hotdogs
summary(hotdogs)

# The collectors you will need to import the data
fac <- col_factor(levels = c("Beef", "Meat", "Poultry"))
int <- col_integer()

# Edit the col_types argument to import the data correctly: hotdogs_factor
hotdogs_factor <- read_tsv("hotdogs.txt",
                           col_names = c("type", "calories", "sodium"),
                           col_types = list(fac, int, int))

# Display the summary of hotdogs_factor
summary(hotdogs_factor)

#--------

#library(data.table)

#use fread() --> works without specifying column types & seperators 
#extremely fast 
#an improved version of data.table

# load the data.table package
library(data.table)

# Import potatoes.csv with fread(): potatoes
potatoes <- fread("potatoes.csv")

# Print out potatoes
potatoes 

#-------

#Importing with specific columns 

# Import columns 6 and 8 of potatoes.csv: potatoes
potatoes <- fread("potatoes.csv", select= c(6, 8))

# Plot texture (x) and moistness (y) of potatoes
plot(potatoes$texture, potatoes$moistness)


#------

# The gdata package is alreaded loaded

# Column names for urban_pop
columns <- c("country", paste0("year_", 1967:1974))

# Finish the read.xls call
urban_pop <- read.xls("urbanpop.xls", sheet = 2,
                      skip = 50, header = FALSE, stringsAsFactors = FALSE,
                      col.names = columns)

# Print first 10 observation of urban_pop
head(urban_pop, n = 10)