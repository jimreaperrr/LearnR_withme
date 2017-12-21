#R utilities practice 

#-----

#Calling dim() function --> I think it counts how many observations and variables there are.
#Also generating a histogram 

# Call dim on titanic
dim(titanic) #--> prints 891 (obs) 12 (vars)

# Generate histogram of Age column
hist(titanic$Age)

#----------

#USEFUL MATH FUNCTIONS for exploratory queries 
x <- 0

abs(x) #calculate the absolute value 
sum(x) #calculate the sum of all the values in a data structure.
mean(x)#calculate the arithmetic mean
round(x)#Round the values to 0 decimal places by default.

# Print out total value of fares
sum(titanic$Fare)

#-------------

#Using grep() 

# Extract the name column from titanic
pass_names <- titanic$Name

# Create the logical vectror is_man
is_man <- grepl(", Mr\\.", pass_names)

# Count the number of men
sum(is_man)

# Count number of men based on gender
sum(titanic$Sex == "male")

#----------

#Using gsub and patterns -- look in Rutilities for more info 

# Create titles
titles <- gsub("^.*, (.*?)\\..*$", "\\1", pass_names)

# Call unique() on titles --> get an overview of all different titles found in name vector
unique(titles)

#-----

#vapply with grepl 

pass_names <- titanic$Name
titles <- paste(",", c("Mr\\.", "Master", "Don", "Rev", "Dr\\.", "Major", "Sir", "Col", "Capt", "Jonkheer"))

# Finish the vapply() command
hits <- vapply(titles,
               FUN = grepl,
               FUN.VALUE = logical(length(pass_names)),pass_names
)

# Calculate the sum() of hits
sum(hits)

# Count number of men based on gender
sum(titanic$Sex == "male")

#--------------

#Reformatting passenger names

# pass_names is available in your workspace

# Finish the convert_name() function
convert_name <- function(name) {
  # women: take name from inside parentheses
  if (grepl("\\(.*?\\)", name)) {
    gsub("^.*?\\((.*?)\\)$", "\\1", name)
    # men: take name before comma and after title
  } else {
    gsub("^(.*?),\\s[a-zA-Z\\.]*?\\s(.*?)$", "\\2 \\1", name)
  }
}

# Call convert_name on name
clean_pass_names <- vapply(pass_names, FUN = convert_name,
                           FUN.VALUE = character(1), USE.NAMES = FALSE)

# Print out clean_pass_names
clean_pass_names

#-------

#Converting into dates 

# titanic, dob1 and dob2 are preloaded

# Have a look at head() of dob1 and dob2
head(dob1)
head(dob2)

# Convert dob1 to dob1d, convert dob2 to dob2d

dob1d <- as.Date(dob1)
dob2d <- as.Date(dob2, format = "%B %d, %Y")

# Combine dob1d and dob2d into single vector: birth_dates
birth_dates <- c(dob1d, dob2d)

#------

#Adding a new column & creating a subset 

# titanic, dob1 and dob2 are preloaded
dob1d <- as.Date(dob1)
dob2d <- as.Date(dob2, format = "%B %d, %Y")
birth_dates <- c(dob1d, dob2d)
disaster_date <- as.Date("1912-04-15")

# Add birth_dates to titanic (column Birth)
titanic$Birth <- birth_dates

# Create subset: survivors
survivors <- subset(titanic, Survived == 1)

# Calculate average age of survivors
mean(disaster_date - survivors$Birth, na.rm = TRUE)
