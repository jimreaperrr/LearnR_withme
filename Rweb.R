#Importing data from the web 

#More and more of the information that data scientists are using resides on the web. 
#Importing this data into R requires an understanding of
#the protocols used on the web. 
#In this chapter, you'll get a crash course in HTTP and learn to perform your own HTTP requests from inside R.

#-------------

#HTTP (not safe/secure)

#HyperText Transfer Protocol 
#Language of the web


#read.csv(https:link.csv)
#R see its a url, does a GET request, and reads in the csv file.

#------------

#Import flat files from the web 
#like read_csv for csv files
#like read_tsv for delim text files 


# Load the readr package
library(readr)

# Import the csv file: pools
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/swimming_pools.csv"
pools <- read_csv(url_csv)

# Import the txt file: potatoes
url_delim <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/potatoes.txt"
potatoes <- read_tsv(url_delim)

# Print pools and potatoes
print(pools)
print(potatoes)

#--------

#Importing data from Secure connections (https:) --> read.csv()

# https URL to the swimming_pools csv file.
url_csv <- "https://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/swimming_pools.csv"

# Import the file using read.csv(): pools1
pools1 <- read.csv(url_csv)

# Load the readr package
library(readr)

# Import the file using read_csv(): pools2
pools2 <- read_csv(url_csv)

# Print the structure of pools1 and pools2
str(pools1)
str(pools2)

#-----------

#downloading files  

# Load the readxl and gdata package
library(gdata)
library(readxl)

# Specification of url: url_xls
url_xls <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/latitude.xls"

# Import the .xls file with gdata: excel_gdata
excel_gdata <- read.xls(url_xls)

# Download file behind URL, name it local_latitude.xls
download.file(url_xls, "local_latitude.xls")

# Import the local .xls file with readxl: excel_readxl
excel_readxl <- read_excel("local_latitude.xls")

#---------

#download any files, use load() as well

# https URL to the wine RData file.
url_rdata <- "https://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/wine.RData"

# Download the wine file to your working directory
download.file(url_rdata, "wine_local.RData")

# Load the wine data into your workspace using load()
load("wine_local.RData")

# Print out the summary of the wine data
summary(wine)

#-----------

#httr 

"""
httr provides a convenient function, GET() to execute this GET request. 
The result is a response object, that provides easy access to the status code, content-type and, of course, the actual content.

You can extract the content from the request using the content() function. 
At the time of writing, there are three ways to retrieve this content: as a raw object, as a character vector, 
or an R object, such as a list. 
If you don't tell content() how to retrieve the content through the as argument, 
it'll try its best to figure out which type is most appropriate based on the content-type.

"""

# Load the httr package
library(httr)

# Get the url, save response to resp
url <- "http://www.example.com/"
resp <- GET(url)

# Print resp
print(resp)

# Get the raw content of resp: raw_content
raw_content <- content(resp, as = "raw")

# Print the head of raw_content
head(raw_content)

#---------

#download and retreieve content as a different format like txt

# Get the url
url <- "http://www.omdbapi.com/?apikey=ff21610b&t=Annie+Hall&y=&plot=short&r=json"
resp <- GET(url)

# Print resp
print(resp)

# Print content of resp as text
content(resp, as = "text")

# Print content of resp
content(resp)

#------------

