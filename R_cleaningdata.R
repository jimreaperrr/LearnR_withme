#Type Conversions

#This chapter will teach you how to prepare your data for analysis. 
#We will look at type conversion, string manipulation, missing and special values, and outliers and obvious errors.

#-------------------


#Types of variables in R

#character = "123" , "abc"
#numeric = 123 , 12.30, NaN
#integer = 4L, 1123L
#factor = factor("Hello"), factor(8)
#logical = TRUE, FALSE, NA

as.character(2016)
as.numeric(TRUE)
as.integer(99)
as.factor("something")
as.logical(1)
#-----------------

#Overview of lubridate package 

library(lubridate)

#experiment with lubridate functions 
ymd("2015 August 25")

mdy("August 25, 2015")

hms("13:33:09")

ymd_hms("2015/08/25 13.33.09")


#------------------

#Type conversion example


# Preview students with str()
str(students)

# Coerce Grades to character
students$Grades <- as.character(students$Grades)

# Coerce Medu to factor
students$Medu <- as.factor(students$Medu)

# Coerce Fedu to factor
students$Fedu <- as.factor(students$Fedu)

# Look at students once more with str()
str(students)


#-------------

#More examples

# Preview students2 with str()
str(students2)

# Load the lubridate package
library(lubridate)

# Parse as date
dmy("17 Sep 2015")

# Parse as date and time (with no seconds!)
mdy_hm("July 15, 2012 12:56")

# Coerce dob to a date (with no time)
students2$dob <- ymd(students2$dob)

# Coerce nurse_visit to a date and time
students2$nurse_visit <- ymd_hms(students2$nurse_visit)


#-----------

#String manipulations 
#stringr package for cleaning data 

#functions 
library(stringr)

#trim leading and trailing white spaces
str_trim("  this is a test   ")

#pad with additional characters, ex: string with zeros  
str_pad("24493", width = 7, side ="left", pad="0")

#search for string in vector 
friends <- c("Sarah", "Tom", "Alice")

str_detect(friends, "Alice")

#replace a string in vector 
str_replace(friends, "Alice", "David")

#Make lowercase
tolower("I")

#Make uppercase 
toupper("i")

#--------------------

#Missing Values 
#in R represented as NA

#Finding missing values 
df <- data.frame(A = c(1, NA, 8, NA),
                 B = c(3, NA, 88, 23),
                 C = c(2, 45, 3, 1))

#check for NAs
is.na.data.frame(df) #-> prints out false false false 

#Are there any NAs?
any(is.na.data.frame(df)) #-> returns a single bool value 

#Count the number of NAs 
sum(is.na.data.frame(df)) #->returns a number of Nas

#This is easier I think
summary(df)

#Dealing with missing values  (removing)

#Find rows with no missing values
complete.cases(df) #-> returns bool
df[complete.cases(df)] #-> keep data with NAs

#Another way to remove NAs
na.omit(df)

#Special values
#Inf - infinite value 
#NaN - not a number 

#----------------

#Outliers 

#Outliers are extreme values distant from other values
#several causes -> valid measurements, variability in measurement, etc.

#obvious errors 

#may appear in many forms
#values so extreme they can't be plausible 
#several causes -> measurement error, data entry error, etc.


#simulate some data
set.seed(10)
x < - c(rnorm(30, mean = 15,  sd = 5), -5, 28, 35)

#view a boxplot
boxplot(x, horizontal = TRUE)


#create another small dataset 
df2 <- data.frame(A = rnorm(100,50,10),
                  B = c(rnorm(99,50,10), 500),
                  C = c(rnorm(99, 50, 0), -1))

#Finding outliers and errors

#Use summary to find werid data 
summary(df2)

#view a histogram
hist(df2) #breaks = number of buckets

# View a histogram of absences, but force zeros to be bucketed to the right of zero

hist(df2$C, right = FALSE)



#------------------
















