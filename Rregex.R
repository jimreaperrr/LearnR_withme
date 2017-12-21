#R regex or regular expressions 

#-----------------

#Matching the start or end of the string 
#package rebus 


library(rebus)
library(stringr)

# Some strings to practice with
x <- c("cat", "coat", "scotland", "tic toc")

# Print END
END

# Run me
str_view(x, pattern = START %R% "c")

# Match the strings that start with "co" 
str_view(x, pattern = START %R% "co")

# Match the strings that end with "at"
str_view(x, pattern = "at" %R% END)

# Match the string that is exactly "cat"
str_view(x, pattern = START %R% "cat" %R% END)


#---------

#Matching any character 

x <- c("cat", "coat", "scotland", "tic toc")

# Match two characters, where the second is a "t"
str_view(x, pattern = ANY_CHAR %R% "t")

# Match a "t" followed by any character
str_view(x, pattern = "t" %R% ANY_CHAR)

# Match two characters
str_view(x, pattern = ANY_CHAR %R% ANY_CHAR)

# Match a string with exactly three characters
str_view(x, pattern = START %R% ANY_CHAR %R% ANY_CHAR %R% ANY_CHAR %R% END)

#-----------

#Combinding with stringr functions

# q followed by any character
pattern <- "q" %R% ANY_CHAR

# Test pattern 
str_view(c("Quentin", "Kaliq", "Jacques",  "Jacqes"), pattern)

# Find names that have the pattern
names_with_q <- str_subset(boy_names, pattern)
length(names_with_q)

# Find part of name that matches pattern
part_with_q <- str_extract(boy_names, pattern)
table(part_with_q)

# Did any names have the pattern more than once?
count_of_q <- str_count(boy_names, pattern)
table(count_of_q)

# Which babies got these names?
with_q <- str_detect(boy_names, pattern)

# What fraction of babies got these names?
mean(with_q)

#--------

#or ()

# Match Jeffrey or Geoffrey
whole_names <- or("Jeffrey", "Geoffrey")
str_view(boy_names, pattern = whole_names, 
         match = TRUE)

# Match Jeffrey or Geoffrey, another way
common_ending <- or("Je", "Geo") %R% "ffrey"
str_view(boy_names, pattern = common_ending, 
         match = TRUE)

# Match with alternate endings
by_parts <- or("Je", "Geo") %R% "ff" %R% or("ry", "ery", "rey", "erey")
str_view(boy_names, 
         pattern = by_parts, 
         match = TRUE)

# Match names that start with Cath or Kath
ckath <- or("C", "K") %R% "ath"
str_view(girl_names, pattern = ckath, match = TRUE)

#----------

#Character classes 

# Create character class containing vowels
vowels <- char_class("aeiouAEIOU")

# Print vowels
vowels

# See vowels in x with str_view()
str_view(x, pattern = vowels)

# See vowels in x with str_view_all()
str_view_all(x, pattern = vowels)

# Number of vowels in boy_names
num_vowels <- str_count(boy_names, pattern = vowels)
mean(num_vowels)

# Proportion of vowels in boy_names
name_length <- str_length(boy_names)
mean(num_vowels/name_length)

#---------

#Repetition 

"""
one_or_more(), zero_or_more() and optional()

"""

# Vowels from last exercise
vowels <- char_class("aeiouAEIOU")

# Use `negated_char_class()` for everything but vowels
not_vowels <- negated_char_class("aeiouAEIOU")

# See names with only vowels
str_view(boy_names, 
         pattern = exactly(one_or_more(vowels)), 
         match = TRUE)

# See names with no vowels
str_view(boy_names, 
         pattern = exactly(one_or_more(not_vowels)), 
         match = TRUE)

#-------------

#Practice 

# Take a look at ALL digits
str_view_all(contact, DGT)

# Create a three digit pattern and test
three_digits <- DGT %R% DGT %R% DGT
str_view_all(contact,
             pattern = three_digits)

# Create four digit pattern
four_digits <- three_digits %R% DGT

# Create a separator pattern and test
separator <- char_class("-.() ")
str_view_all(contact,
             pattern = separator)

# Create phone pattern
phone_pattern <- optional(OPEN_PAREN) %R% 
  three_digits %R% 
  zero_or_more(separator) %R% 
  three_digits %R% 
  zero_or_more(separator) %R%
  four_digits

# Test pattern           
str_view(contact, pattern = phone_pattern)

# Extract phone numbers
str_extract(contact, phone_pattern)

# Extract ALL phone numbers
str_extract_all(contact, phone_pattern)

#--------

#Extracting age and gender from accident narratives 

# Look for two digits
str_view(narratives, DGT %R% DGT)

# Pattern to match one or two digits
age <- DGT %R% optional(DGT)
str_view(narratives, 
         pattern = age)

# Pattern to match units 
unit <- optional(SPC) %R% or("YO", "YR", "MO")

# Test pattern with age then units
str_view(narratives, 
         pattern = age %R% unit)

# Pattern to match gender
gender <- optional(SPC) %R% or("M", "F")

# Test pattern with age then units then gender
str_view(narratives, 
         pattern = age %R% unit %R% gender)

# Extract age_gender, take a look
age_gender <- str_extract(narratives,  age %R% unit %R% gender)
age_gender


#----------


#Parsing age and gender into pieces

# age_gender, age, gender, unit are pre-defined
ls.str()

# Extract age and make numeric
ages_numeric <- as.numeric(str_extract(age_gender, age))

# Replace age and units with ""
genders <- str_replace(age_gender, 
                       pattern = age %R% unit, 
                       replacement = "")

# Replace extra spaces
genders_clean <- str_replace_all(genders, 
                                 pattern = one_or_more(SPC), 
                                 replacement = "")

# Extract units 
time_units <- str_extract(age_gender, unit)

# Extract first word character
time_units_clean <- str_extract(time_units, WRD)

# Turn ages in months to years
ages_years <- ifelse(time_units_clean == "Y", ages_numeric, ages_numeric/12)

#-------------










