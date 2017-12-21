#Importing data from databases Part 2


#Importing an entire table from a database while you might only need a tiny bit of information
#seems like a lot of unncessary work. 
#In this chapter, you'll learn about SQL queries, which will help you make things more efficient 
#by performing some computations on the database side.


#------------

#dbGetQuery() using =

# Import tweat_id column of comments where user_id is 1: elisabeth

elisabeth <- dbGetQuery(con, "SELECT tweat_id FROM comments WHERE user_id = 1")

# Print elisabeth
print(elisabeth)

#------------

#get queries using > or <

# Import post column of tweats where date is higher than '2015-09-21': latest

latest <- dbGetQuery(con, "SELECT post FROM tweats WHERE date > '2015-09-21' ")

# Print latest
print(latest)

#--------------

#dbGetQuery using AND, also how to create a dataframe

# Create data frame specific
specific <- data.frame(dbGetQuery(con, "SELECT message FROM comments WHERE tweat_id = 77 AND user_id > 4"))

# Print specific
print(specific)

#----------

#Selecting mutiple agruments with ' , ' and using CHAR_LENGTH(name)

# Create data frame short

short <- data.frame(dbGetQuery(con, "SELECT id, name FROM users WHERE CHAR_LENGTH(name) < 5"))

# Print short
print(short)


#------------

#JOIN and INNER JOIN

"""
SELECT name, post
  FROM users INNER JOIN tweats on users.id = user_id
    WHERE date > '2015-09-19'

Here, the users table is joined with the tweats table. 
This is possible because the id column in the users table corresponds to the user_id column in the tweats table.
Also notice how name, from the users table, and post and date, from the tweats table, can be referenced to without problems.


SELECT post, message
  FROM tweats INNER JOIN comments on tweats.id = tweat_id
    WHERE tweat_id = 77

A table with four observations, containing two columns: post and message.


"""
#------------

#Using dbSendQuery() and dbFetch() and dbClearResult

"""
This is tedious to write, but it gives you the ability to fetch the query's result 
in chunks rather than all at once. 
You can do this by specifying the n argument inside dbFetch()

"""

# Send query to the database, * = all columns
res <- dbSendQuery(con, "SELECT * FROM comments WHERE user_id > 4")

# Use dbFetch() twice
dbFetch(res, n = 2) #fetch only two records of the query
dbFetch(res) #fetch the rest of the query 

# Clear res
dbClearResult(res) #clear the query?

#------

#Using dbDisconnect()


# Create the data frame  long_tweats
long_tweats <- data.frame(dbGetQuery(con, "SELECT post, date FROM tweats WHERE CHAR_LENGTH(post) > 40"))

# Print long_tweats
print(long_tweats)

# Disconnect from the database
dbDisconnect(con)

#--------

