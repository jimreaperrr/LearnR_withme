#Importing data from databases Part 1

#Many companies store their information in relational databases. 
#The R community has also developed R packages to get data from these architectures. 
#You'll learn how to connect to a database and how to retrieve data from it


#---------------
#install.packages("RMySQL")

# Load the DBI package
library(DBI)

# Edit dbConnect() call
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "tweater", 
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                 port = 3306,
                 user = "student",
                 password = "datacamp")

#----------

#list and import tables 

# Build a vector of table names: tables
tables <- dbListTables(con)

# Display structure of tables
str(tables)

#---------

#Importing a table

# Import the users table from tweater: users
users <- dbReadTable(con, "users")

# Print users
print(users)

#--------

#Import all tables 

# Get table names
table_names <- dbListTables(con)

# Import all tables
tables <- lapply(table_names, dbReadTable, conn = con)

# Print out tables
print(tables)

#-----------
