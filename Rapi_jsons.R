#Importing data from web part 2 

#Importing data from the web is one thing; actually being able to extract useful information is another. 
#Learn more about the JSON format to get one step closer to web domination.


#--------------

#API 

#Application programming interface 
#Set of routines and protocols for building software 
#How different components interact 


#Web API 

#interface to get or add data to server 
#HTTP verbs (GET and others)

#---------------

#Convert json files to list 
#also using jsonlite

# Load the jsonlite package
library(jsonlite)

# wine_json is a JSON
wine_json <- '{"name":"Chateau Migraine", "year":1997, "alcohol_pct":12.4, "color":"red", "awarded":false}'

# Convert wine_json into a list: wine
wine<-fromJSON(wine_json)

# Print structure of wine
str(wine)

#--------------

#extra practice with link instead for json

# Definition of quandl_url
quandl_url <- "https://www.quandl.com/api/v3/datasets/WIKI/FB/data.json?auth_token=i83asDsiWUUyfoypkgMz"

# Import Quandl data: quandl_data
quandl_data <- fromJSON(quandl_url)

# Print structure of quandl_data
str(quandl_data)

#--------


# Definition of the URLs
url_sw4 <- "http://www.omdbapi.com/?apikey=ff21610b&i=tt0076759&r=json"
url_sw3 <- "http://www.omdbapi.com/?apikey=ff21610b&i=tt0121766&r=json"

# Import two URLs with fromJSON(): sw4 and sw3
sw4 <- fromJSON(url_sw4)
sw3 <- fromJSON(url_sw3)


# Print out the Title element of both lists
print(sw4$Title)
print(sw3$Title)


# Is the release year of sw4 later than sw3?
sw4$Year > sw3$Title

#-----------

#json practice 

#JSON is built on two structures: objects and arrays. 

# Challenge 1
json1 <- '[1, 2, 3, 4, 5, 6]'
fromJSON(json1)

# Challenge 2
json2 <- '{"a": [1, 2, 3], "b": [4, 5, 6]}'
fromJSON(json2)

#------------

#json practice(2)

# Challenge 1
json1 <- '[[1,2],[3,4]]'
fromJSON(json1)

# Challenge 2
json2 <- '[{"a": 1, "b": 2}, {"a": 3, "b": 4}, {"a":5, "b":6}]'
fromJSON(json2)

#--------------

#toJSON()

# URL pointing to the .csv file
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/water.csv"

# Import the .csv file located at url_csv
water <- read.csv(url_csv, stringsAsFactors = FALSE)

# Convert the data file according to the requirements
water_json <- toJSON(water)

# Print out water_json
water_json

#-------

#Minify and Prettify


"""
 Take these two JSONs, that are in fact exactly the same: 
the first one is in a minified format, 
the second one is in a pretty format with indentation, whitespace and new lines:

# Mini
{'a':1,'b':2,'c':{'x':5,'y':6}}

# Pretty
{
  'a': 1,
  'b': 2,
  'c': {
    'x': 5,
    'y': 6
  }
}

"""

# jsonlite is already loaded

# Convert mtcars to a pretty JSON: pretty_json
pretty_json <- toJSON(mtcars, pretty = TRUE)

# Print pretty_json
print(pretty_json)

# Minify pretty_json: mini_json
mini_json <- minify(pretty_json)

# Print mini_json
print(mini_json)

#-------------
