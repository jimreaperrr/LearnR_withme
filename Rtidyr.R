#Tidyr
#package for tidying data

#------------------

#Gathering columns into key-value pairs
#gather ()


"""
The most important function in tidyr is gather(). 
It should be used when you have columns that are not variables and you want to collapse them into key-value pairs.

gather(wide_df, my_key, my_val, -col)

"""

#Ex. 

# Apply gather() to bmi and save the result as bmi_long
bmi_long <- gather(bmi, year, bmi_val, -Country)

# View the first 20 rows of the result
head(bmi_long, n= 20)

#---------------------

#Spreading key-value pairs into columns
#Spread 

"""
spread(), which takes key-values pairs and spreads them across multiple columns. 
This is useful when values in a column should actually be column names (i.e. variables). 
It can also make data more compact and easier to read.

"""

#Ex.

# Apply spread() to bmi_long
bmi_wide <- spread(bmi_long, year, bmi_val)

# View the head of bmi_wide
head(bmi_wide)

#--------------

#When variables are stored in both rows and columns

#Ex.

# View first 50 rows of census_long
head(census_long, n=50)

# Spread the type column
census_long2 <- spread(census_long, type, amount )

# View first 20 rows of census_long2
head(census_long2, n=20)

#-------------
#Seperate columns 
#seperate () 

"""
The separate() function allows you to separate one column into multiple columns. 
Unless you tell it otherwise, it will attempt to separate on any character that is not a letter or number. 
You can also specify a specific separator using the sep argument.

separate(treatments, year_mo, c('year', 'month'))

"""

#Ex:

# Apply separate() to bmi_cc
bmi_cc_clean <- separate(bmi_cc, col = Country_ISO, into = c("Country", "ISO"), sep = "/")

# Print the head of the result
head(bmi_cc_clean)

#---------------

#Uniting columns 
#Unite () 

"""
which takes multiple columns and pastes them together. 
By default, the contents of the columns will be separated by underscores in the new column, 
but this behavior can be altered via the sep argument.

"""

#Ex.

# Apply unite() to bmi_cc_clean
bmi_cc <- unite(bmi_cc_clean, Country_ISO, Country, ISO, sep = "-")

# View the head of the result
head(bmi_cc)

#---------------

#How to reassemble column headers 

# View the head of census
head(census)

# Gather the month columns
census2 <- gather(census, month, amount, -YEAR)

# Arrange rows by YEAR using dplyr's arrange
census2 <- arrange(census2, YEAR)

# View first 20 rows of census2
head(census2, n = 20)
#--------------------

#Too much variables in one column

#Ex:

# View the head of census_long3
head(census_long3)

# Separate the yr_month column into two
census_long4 <- separate(census_long3, yr_month, c("year","month"), sep ="_" )

# View the first 6 rows of the result
head(census_long4, n=6)

#---------------



