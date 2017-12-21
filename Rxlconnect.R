#Next to importing data from Excel,
#you can take things one step further with XLConnect. Learn all about it and bridge the gap between R and Excel!
#Work with excel through R
#Bridge between Excel and R

#---------

#installation 

install.packages("XLConnect")
#---------

#load workbook()

library("XLConnect")
#book <- loadWorkbook("cities.xlsx")
#str(book)

# Load the XLConnect package
library(XLConnect)

# Build connection to urbanpop.xlsx: my_book

my_book <- loadWorkbook("urbanpop.xlsx")
# Print out the class of my_book
print(class(my_book))

#---------

#getSheets(book) 

#or 

#library("readxl")
#excel_sheets("cities.xlsx")

#--------

#readWorksheets()

#readWorksheets(book, sheet = "year_2000")

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("urbanpop.xlsx")

# List the sheets in my_book
getSheets(my_book)

# Import the second sheet in my_book

readWorksheet(my_book, sheet =2)

#-----------

#Customize Worksheet

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("urbanpop.xlsx")

# List the sheets in my_book
getSheets(my_book)

# Import the second sheet in my_book

readWorksheet(my_book, sheet =2)

#-------------

#Add worksheet 

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("urbanpop.xlsx")

# Add a worksheet to my_book, named "data_summary"
createSheet(my_book, "data_summary")

# Use getSheets() on my_book
getSheets(my_book)

#----------

#adding data to worksheet 

# Add a worksheet to my_book, named "data_summary"
createSheet(my_book, "data_summary")

# Create data frame: summ
sheets <- getSheets(my_book)[1:3]
dims <- sapply(sheets, function(x) dim(readWorksheet(my_book, sheet = x)), USE.NAMES = FALSE)
summ <- data.frame(sheets = sheets,
                   nrows = dims[1, ],
                   ncols = dims[2, ])

# Add data in summ to "data_summary" sheet
writeWorksheet(my_book, summ, "data_summary")

# Save workbook as summary.xlsx
saveWorkbook(my_book, "summary.xlsx")


#---------------

#Renaming sheets

# Rename "data_summary" sheet to "summary"
renameSheet(my_book, "data_summary", "summary")

# Print out sheets of my_book
getSheets(my_book)

# Save workbook to "renamed.xlsx"
saveWorkbook(my_book, "renamed.xlsx")

#-------------

#removing sheet


# Rename "data_summary" sheet to "summary"
renameSheet(my_book, "data_summary", "summary")

# Print out sheets of my_book
getSheets(my_book)

# Save workbook to "renamed.xlsx"
saveWorkbook(my_book, "renamed.xlsx")

