# logs is already available in your workspace

# Print the structure of logs
str(logs)

# Use list subsetting to print the details part of 11th logs entry
print(logs[[11]]$details)

# Print the class of the timestamp component of the first entry
print(class(logs[[1]]$timestamp))


# """ iterator i """ 

# Initialize the iterator i to be 1
i <- 1

# Code the while loop
while (logs[[i]]$success == TRUE ) {
  print(i)
  i <- i + 1
  
}


"""Change the print(i) call with a call that 
   prints the MESSAGE element of the DETAILS element of each log entry. """

# Adapt the while loop
i <- 1
while (logs[[i]]$success) {
  print(logs[[i]]$details$message)
  i <- i + 1
}

""" ADVANCE WHILE LOOP """


# Initialize i and found
i <- 1
found <- FALSE

# Code the while loop
while (!found) {
  if (!logs[[i]]$success && logs[[i]]$details$location == "waste") {
    print("found")
    found <- TRUE  
  } else {
    print("still looking")
    i <- i + 1
  }
}