#Mathematical utilities 

"""
abs(): Calculate the absolute value.
sum(): Calculate the sum of all the values in a data structure.
mean(): Calculate the arithmetic mean.
round(): Round the values to 0 decimal """

# The errors vector has already been defined for you
errors <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)

# Sum of absolute rounded values of errors
sum(abs(round(errors)))

# Don't edit these two lines
vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)

#THIS NEEDS TO BE FIXED 
mean(abs(vec1), abs(vec2))

#NEW FIX 
mean(c(abs(vec1), abs(vec2)))


#Data Utilities 

""" 
seq(): Generate sequences, by specifying the from, to, and by arguments.
rep(): Replicate elements of vectors and lists.
sort(): Sort a vector in ascending order. Works on numerics, but also on character strings and logicals.
rev(): Reverse the elements in a data structures for which reversal is defined.
str(): Display the structure of any R object.
append(): Merge vectors or lists.
is.*(): Check for the class of an R object.
as.*(): Convert an R object from one class to another.
unlist(): Flatten (possibly embedded) lists to produce a vector.

"""

# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec

li_vec <- unlist(linkedin)
fb_vec <- unlist(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec, fb_vec)

# Sort social_vec
sort(social_vec, decreasing = TRUE)

#Using rep and seq 
rep(seq(1, 7, by = 2), times = 7)

# Create first sequence: seq1
seq1 <- seq(1,500, by = 3)

# Create second sequence: seq2
seq2 <- seq(1200, 900, by = -7)

# Calculate total sum of the sequences
sum(append(seq1,seq2))

#grepl & grep (regular expressions)

"""
In their most basic form, regular expressions can be used to see whether
a pattern exists inside a character string or a vector of character strings. 
For this purpose, you can use:

grepl(), which returns TRUE when a pattern is found in the corresponding character string.
grep(), which returns a vector of indices of the character strings that contains the pattern.

"""

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl("edu", emails)

# Use grep() to match for "edu", save result to hits
hits <- grep("edu", emails)

# Subset emails using hits
emails[hits]

#grepl & grep (2)

"""
You can use the caret, ^, and the dollar sign, $ to match the content 
located in the start and end of a string, respectively. 
This could take us one step closer to a correct pattern for matching 
only the ".edu" email addresses from our list of emails. 
But there's more that can be added to make the pattern more robust:

@, because a valid email must contain an at-sign.
.*, which matches any character (.) zero or more times (*). 

Both the dot and the asterisk are metacharacters. 
You can use them to match any character between the at-sign and the ".edu" 
portion of an email address.

\\.edu$, to match the ".edu" part of the email at the end of the string. 
The \\ part escapes the dot: it tells R that you want to use the . as an actual character.

"""

# Use grepl() to match for .edu addresses more robustly
grepl("@.*\\.edu$", emails)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep("@.*\\.edu$", emails)

# Subset emails using hits
emails[hits]

#sub & gsub

"""
sub() and gsub() take it one step further: you can specify a replacement argument. 
If inside the character vector x, the regular expression pattern is found, 
the matching element(s) will be replaced 

"""

# Use sub() to convert the email domains to datacamp.edu
sub("@.*\\.edu$", "@datacamp.edu", emails)

#sub & gsub (2)
"""
.*: A usual suspect! It can be read as any character that is matched zero or more times.

\\s: Match a space. The 's' is normally a character, escaping it (\\) makes it a metacharacter.

[0-9]+: Match the numbers 0 to 9, at least once (+).

([0-9]+): The parentheses are used to make parts of the matching string 
available to define the replacement. 

The \\1 in the replacement argument of sub() gets set to the string that 
is captured by the regular expression [0-9]+.
"""

awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)

#ANSWER = A vector of character strings containing "Won 1 Oscar.", "24", "2", "3", "2", "1".