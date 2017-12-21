#Importing data from flat files with utils

#-------

#read.csv
#utils is automatically loaded when you start up R

# Import swimming_pools.csv: pools
pools <- read.csv("swimming_pools.csv")

# Print the structure of pools
str(pools)

#------------

#Strings as factors 

#With stringsAsFactors, you can tell R whether it should convert strings in the flat file to factors.

# Import swimming_pools.csv correctly: pools
pools <- read.csv("swimming_pools.csv", stringsAsFactors = FALSE)

# Check the structure of pools
str(pools)

#-----------

#read.delim() for .txt files 

# Import hotdogs.txt: hotdogs
hotdogs <- read.delim("hotdogs.txt", header = FALSE)

# Summarize hotdogs
summary(hotdogs)

#-------

#read.table() 

"""
If you're dealing with more exotic flat file formats, you'll want to use read.table(). 
It's the most basic importing function; you can specify tons of different 
arguments in this function. Unlike read.csv() and read.delim(), 
the header argument defaults to FALSE and the sep argument is "" by default.

"""

# Path to the hotdogs.txt file: path
path <- file.path("data", "hotdogs.txt")

# Import the hotdogs.txt file: hotdogs
hotdogs <- read.table(path, 
                      sep = "\t", 
                      col.names = c("type", "calories", "sodium"))

# Call head() on hotdogs
head(hotdogs)

#--------------

#Using agrugmens in read.table()

# Finish the read.delim() call
hotdogs <- read.delim("hotdogs.txt", header = FALSE, col.names = c("type", "calories","sodium"))

# Select the hot dog with the least calories: lily
lily <- hotdogs[which.min(hotdogs$calories), ]

# Select the observation with the most sodium: tom
tom <- hotdogs[which.max(hotdogs$sodium),]

# Print lily and tom
print(lily)
print(tom)

#---------

#column classes 
#specify column types or classes by setting an agrument called colClasses 

#read.delim("my_file.txt", colClasses = c("character", "numeric", "logical"))

# Previous call to import hotdogs.txt
hotdogs <- read.delim("hotdogs.txt", header = FALSE, col.names = c("type", "calories", "sodium"))

# Display structure of hotdogs
str(hotdogs)


# Edit the colClasses argument to import the data correctly: hotdogs2
hotdogs2 <- read.delim("hotdogs.txt", header = FALSE, 
                       col.names = c("type", "calories", "sodium"),
                       colClasses = c("factor", "NULL", "numeric"))


# Display structure of hotdogs2
str(hotdogs2)

#----------



