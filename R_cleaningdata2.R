
#Practice cleaning data 


#-------------------

#exploratory data

#class () - Class of data object 
#dim () - Dimensions of data 
#names () - column names 
#str() preview of data with helpful details 
#glimpse() - better version of str() from dplyr 
#summary() - summary of data

#Looking at your data 

#names() - view column names 
#head () - View top of dataset , n= ? for number of rows
#tail () - View bottom of dataset 

#visualizing your data 

#hist() - view histogram of a single variable 
#plot () view plot of two variables 

#--------------------

#tidy the data 


library(tidyr)

#gather

# Gather the columns --> getting columns from x1 to  x31 
weather2 <- gather(weather, day, value, X1:X31, na.rm = TRUE)

#spread 

# First remove column of row names
weather2 <- weather2[, -1]

# Spread the data
weather3 <- spread(weather2, measure, value)

# View the head
head(weather3)

#------------------

#Prepare the data for analysis

#ymd () 
#mdy ()
#hms ()
#ymd_hms()


# Load the stringr and lubridate packages
library(stringr)
library(lubridate)

# Remove X's from day column
weather3$day <- str_replace(weather3$day, "X", "")

# Unite the year, month, and day columns
weather4 <- unite(weather3, date, year, month, day, sep = "-")

# Convert date column to proper date format using lubridates's ymd()
weather4$date <- ymd(weather4$date)

# Rearrange columns using dplyr's select()
weather5 <- select(weather4, date, Events, CloudCover:WindDirDegrees)

# View the head of weather5
head(weather5)

# See what happens if we try to convert PrecipitationIn to numeric
as.numeric(weather5$PrecipitationIn)

#-----------------

#Missing, extreme, and unexpected values 

#is.na(df) -> returns false, true... etc 
#sum(is.na(df)) -> counts the number of na
#which(is.na(x$b)) -> Find indices of missing values in column b

# Find row with Max.Humidity of 1000
ind <- which(weather6$Max.Humidity == 1000)

# Look at the data for that day
weather6[ind, ]

# Change 1000 to 100
weather6$Max.Humidity[ind] <- 100

# Look at histogram for MeanDew.PointF
hist(weather6$MeanDew.PointF)

# Look at histogram for Min.TemperatureF
hist(weather6$Min.TemperatureF)

# Compare to histogram for Mean.TemperatureF
hist(weather6$Mean.TemperatureF)

# Clean up column names
names(weather6) <- new_colnames

# Replace empty cells in events column
weather6$events[weather6$events == ""] <- "None"

# Print the first 6 rows of weather6
head(weather6, n=6)





