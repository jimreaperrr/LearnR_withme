#Dates and Times

"""

In R, dates are represented by Date objects, while times are represented by POSIXct objects. 
Under the hood, however, these dates and times are simple numerical values. 
Date objects store the number of days since the 1st of January in 1970. 
POSIXct objects on the other hand, store the number of seconds since the 1st of January in 1970.

The 1st of January in 1970 is the common origin for representing times and dates 
in a wide  of programming languages. There is no particular reason for this; 
it is a simple convention. Of course, it's also possible to create dates and times before 1970; 
the corresponding numerical values are simply negative in this case.

"""

# Get the current date: today
today <- Sys.Date()

# See what today looks like under the hood
unclass(today)

# Get the current time: now
now <- Sys.time()

# See what now looks like under the hood
unclass(now)

#Create and Formate dates 

"""
To create a Date object from a simple character string in R, you can use the as.Date() function. 
The character string has to obey a format that can be defined using a set of symbols 
(the examples correspond to 13 January, 1982):

%Y: 4-digit year (1982)
%y: 2-digit year (82)
%m: 2-digit month (01)
%d: 2-digit day of the month (13)
%A: weekday (Wednesday)
%a: abbreviated weekday (Wed)
%B: month (January)
%b: abbreviated month (Jan)
The following R commands will all create the same Date object for the 13th day in January of 1982:

as.Date('1982-01-13')
as.Date('Jan-13-82', format = '%b-%d-%y')
as.Date('13 January, 1982', format = '%d %B, %Y')

In addition to creating dates, you can also convert dates to character strings
that use a different date notation. For this, you use the format() function. 
Try the following lines of code:

today <- Sys.Date()
format(Sys.Date(), format = '%d %B, %Y')
format(Sys.Date(), format = 'Today is a %A!'

"""

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2)
date3 <- as.Date(str3, format = "%d/%B/%Y")

# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")

#Create abd format times 

"""

Similar to working with dates, you can use as.POSIXct() to convert
from a character string to a POSIXct object, and format() to convert
from a POSIXct object to a character string. Again, you have a wide variety of symbols:

%H: hours as a decimal number (00-23)
%I: hours as a decimal number (01-12)
%M: minutes as a decimal number
%S: seconds as a decimal number
%T: shorthand notation for the typical format %H:%M:%S
%p: AM/PM indicator


"""
# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2)

# Convert times to formatted strings
format(time1, "%M")
format(time2, "%I:%M %p")

#Calculation with Dates 

"""
Both Date and POSIXct R objects are represented by simple numerical values 
under the hood. This makes calculation with time and date objects very straightforward: 
R performs the calculations using the underlying numerical values, 
and then converts the result back to human-readable time information again.

You can increment and decrement Date objects, or do actual calculations with them

"""

# day1, day2, day3, day4 and day5 are already available in the workspace

# Difference between last and first pizza day
day5 - day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff <- diff(pizza)

# Average period between two consecutive pizza days
mean(day_diff)

#Calculations with Times 

"""
Calculations using POSIXct objects are completely analogous 
to those using Date objects. Try to experiment with this code to 
increase or decrease POSIXct objects:

now <- Sys.time()
now + 3600          # add an hour
now - 3600 * 24     # subtract a day
Adding or substracting time objects is also straightforward:

birth <- as.POSIXct('1879-03-14 14:37:23')
death <- as.POSIXct('1955-04-18 03:47:12')
einstein <- death - birth
einstein

"""

# login and logout are already defined in the workspace
# Calculate the difference between login and logout: time_online
time_online <- logout - login

# Inspect the variable time_online
time_online

# Calculate the total time online
sum(time_online)

# Calculate the average time online
mean(time_online)

#Time conversions in different seasons using astro

# Convert astro to vector of Date objects: astro_dates
astro_dates <- as.Date(astro, format = "%d-%b-%Y")

# Convert meteo to vector of Date objects: meteo_dates
meteo_dates <- as.Date(meteo, format = "%B %d, %y")

# Calculate the maximum absolute difference between astro_dates and meteo_dates
max(abs(meteo_dates - astro_dates))