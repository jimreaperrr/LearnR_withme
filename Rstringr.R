#R stringr package 
#All functions start with str_ 
#All functions take a vector of string as the first agrument 

#----------

#str_c() -- another way to paste 

library(stringr)

my_toppings <- c("cheese", NA, NA)
my_toppings_and <- paste(c("", "", "and "), my_toppings, sep = "")

# Print my_toppings_and
my_toppings_and

# Use str_c() instead of paste(): my_toppings_str
my_toppings_str <- str_c(c("", "", "and "), my_toppings)

# Print my_toppings_str
my_toppings_str

# paste() my_toppings_and with collapse = ", "
paste(my_toppings_and, collapse = ", ")

# str_c() my_toppings_str with collapse = ", "
str_c(my_toppings_str, collapse = ", ")

#-----------

#babynames package 

library(stringr)
library(babynames)
library(dplyr)

# Extracting vectors for boys' and girls' names
babynames_2014 <- filter(babynames, year == 2014)
boy_names <- filter(babynames_2014, sex == "M")$name
girl_names <- filter(babynames_2014, sex == "F")$name

# Take a look at a few boy_names
head(boy_names)

# Find the length of all boy_names
boy_length <- str_length(boy_names)

# Take a look at a few lengths
head(boy_length)

# Find the length of all girl_names
girl_length <- str_length(girl_names)

# Find the difference in mean length
mean(girl_length) - mean(boy_length)

# Confirm str_length() works with factors
head(str_length(factor(boy_names)))

#----------

#Extracting substrings 

# Extract first letter from boy_names
boy_first_letter <- str_sub(boy_names, 1, 1)

# Tabulate occurrences of boy_first_letter
table(boy_first_letter) 

# Extract the last letter in boy_names, then tabulate
boy_last_letter <- str_sub(boy_names, -1, -1)
table(boy_last_letter) 

# Extract the first letter in girl_names, then tabulate
girl_first_letter <- str_sub(girl_names, 1, 1)
table(girl_first_letter) 

# Extract the last letter in girl_names, then tabulate
girl_last_letter <- str_sub(girl_names, -1, -1)
table(girl_last_letter)

#----------

#Deteching Matches 

# Look for pattern "zz" in boy_names
contains_zz <- str_detect(boy_names, fixed("zz"))

# Examine str() of contains_zz
str(contains_zz)

# How many names contain "zz"?
sum(contains_zz)

# Which names contain "zz"?
boy_names[contains_zz]

# Which rows in boy_df have names that contain "zz"?
boy_df[contains_zz, ]

#------------

#Subsetting strings based on match 

# Find boy_names that contain "zz"
str_subset(boy_names, fixed("zz"))

# Find girl_names that contain "zz"
str_subset(girl_names, fixed("zz"))

# Find girl_names that contain "U"
starts_U <- str_subset(girl_names, fixed("U"))
starts_U

# Find girl_names that contain "U" and "z"
str_subset(starts_U, fixed("z"))

#-------

#Counting matches 

# Count occurrences of "a" in girl_names
number_as <- str_count(girl_names, fixed("a"))

# Count occurrences of "A" in girl_names
number_As <- str_count(girl_names, fixed("A"))

# Histograms of number_as and number_As
hist(number_as)
hist(number_As)

# Find total "a" + "A"
total_as <- number_as + number_As

# girl_names with more than 4 a's
girl_names[total_as > 4]

#-----------

#Parsing strings into variables 

date_ranges <- c("23.01.2017 - 29.01.2017", "30.01.2017 - 06.02.2017")

# Split dates using " - "
split_dates <- str_split(date_ranges, fixed(" - "))

# Print split_dates
split_dates

# Split dates with n and simplify specifed
split_dates_n <- str_split(date_ranges, fixed(" - "), n = 2, simplify = TRUE)
split_dates_n

# Subset split_dates_n into start_dates and end_dates
start_dates <- split_dates_n[ , 1]
end_dates <- split_dates_n[ , 2]

# Split start_dates into day, month and year pieces
str_split(start_dates, fixed("."), n = 3, simplify = TRUE)

# Split both_names into first_names and last_names
both_names <- c("Box, George", "Cox, David")
both_names_split <- str_split(both_names, fixed(", "), n = 2, simplify = TRUE)
first_names <- both_names_split[, 2]
last_names <- both_names_split[, 1]

#-----------

#Some simple text statistics 

# Split lines into words
words <- str_split(lines, " ")

# Number of words per line
lapply(words, length)

# Number of characters in each word
word_lengths <- lapply(words, str_length)

# Average word length per line
lapply(word_lengths, mean)

#------------

#Replacing to tidy strings

ids <- c("ID#: 192", "ID#: 118", "ID#: 001")

# Replace "ID#: " with ""
id_nums <- str_replace(ids, "ID#: ", "")

# Turn id_nums into numbers
id_ints <- as.numeric(id_nums)

# Some (fake) phone numbers
phone_numbers <- c("510-555-0123", "541-555-0167")

# Use str_replace() to replace "-" with " "
str_replace(phone_numbers, fixed("-"), " ")

# Use str_replace_all() to replace "-" with " "
str_replace_all(phone_numbers, fixed("-"), " ")

# Turn phone numbers into the format xxx.xxx.xxxx
str_replace_all(phone_numbers, fixed("-"), ".")

#----------

#Review 

"""
str_c()
str_length()
str_sub()
str_detect()
str_subset()
str_count()
str_split()
str_replace()

"""

# Find the number of nucleotides in each sequence
str_length(genes)

# Find the number of A's occur in each sequence
str_count(genes, fixed("A"))

# Return the sequences that contain "TTTTTT"
str_subset(genes, fixed("TTTTTT"))

# Replace all the "A"s in the sequences with a "_"
str_replace_all(genes, fixed("A"), "_")

#---------

#Final practice 

# --- Task 1 ----
# Define some full names
names <- c("Diana Prince", "Clark Kent")

# Split into first and last names
names_split <- str_split(names, fixed(" "), simplify = TRUE)

# Extract the first letter in the first name
abb_first <- str_sub(names_split[, 1], 1, 1)

# Combine the first letter ". " and last name
str_c(abb_first, ". ", names_split[, 2])

# --- Task 2 ----
# Use all names in babynames_2014
all_names <- babynames_2014$name

# Get the last two letters of all_names
last_two_letters <- str_sub(all_names, -2, -1)

# Does the name end in "ee"?
ends_in_ee <- str_detect(last_two_letters, "ee")

# Extract rows and "sex" column
sex <- babynames_2014$sex[ends_in_ee]

# Display result as a table
table(sex)

#----------




