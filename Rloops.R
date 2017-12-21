
#while loops

# Initialize the speed variable
speed <- 64

# Code the while loop
while (speed >30 ) {
  print("Slow down!")
  speed <- speed - 7
}

#Break statement

# Initialize the speed variable
speed <- 88

while (speed > 30) {
  print(paste("Your speed is", speed))
  
  # Break the while loop when speed exceeds 80
  if ( speed >80) {
    break
  }
  
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}

#Modulus and print i
# Initialize i as 1 
i <- 1

# Code the while loop
while (i <= 10) {
  print(3 * i)
  if ((i *3) %% 8 == 0) {
    break
    
  }
  i <- i + 1
}

#for loops in vectors 
# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Loop version 1

for  (i in linkedin) {
  print(i)
}


# Loop version 2

for (i in 1:length(linkedin)) {
  print(linkedin[i])
}

#for loops in lists

# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1

for (i in nyc) {
  print(i)
}

# Loop version 2
for (i in 1:length(nyc)) {
  print(nyc[[i]])
}

#loop for over matrics 
# The tic-tac-toe matrix ttt has already been defined for you

# define the double for loop
for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste("On row", i, "and column", j, "the board contains", ttt[i,j]))
  }
}


#break and next

"""
The next statement skips the remainder of the code in the loop,
but continues the iteration.
"""

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if(li >16) {
    print("This is ridiculous, I'm outta here!")
    break
  }
  
  # Add if statement with next
  if (li <5) {
    print("This is too embarrassing!")
    next
  }
  
  print(li)
}

#declare a count

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
  if (char == "r") {
    rcount <- rcount + 1
  }
  if (char == "u") {
    break
  }
  
}

# Print out rcount
print(rcount)
