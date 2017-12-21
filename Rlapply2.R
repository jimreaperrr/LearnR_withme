#lapply functions practice 

# logs is available in your workspace

# Call length() on each element of logs
lapply(logs,length)

# Call class() on each element of logs
lapply(logs,class)

#---------------

# Define get_timestamp()
get_timestamp <- function(x) {
  return (x$timestamp)
}

# Apply get_timestamp() over all elements in logs
lapply(logs,get_timestamp)


#--------------
get_timestamp <- function(x) {
  x$timestamp
}
#Using anonymous functions 

# Have lapply() use an anonymous function
lapply(logs, function(x) {x$timestamp})

#---------

#Replace anoymous lapply functions with `[[`

# Replace the anonymous function with `[[` 
lapply(logs, function(x) { x$timestamp })

`[[`(x,"timestamp")


#-----------

#sapply --> bascially tries to simplifiy if a list can be a vector

# Call length() on each element of logs using sapply()
sapply(logs, length)

# Definition of get_timestamp
get_timestamp <- function(x) {
  x$timestamp
}

# Get vector of log entries' timestamps
sapply(logs, get_timestamp)


#-------

#sapply on logs(1)

# Use sapply() to select the success element from each log: results

results <- sapply(logs, `[[`, "success")

# Call mean() on results
mean(results)

# Use sapply() to select the details element from each log
sapply(logs, `[[`,"details")

#----------

#sapply on logs(2)

# Implement function get_failure_loc
get_failure_loc <- function(x) {
  if (x$success == TRUE) {
    return(NULL)
  } else {
    return(x$details$location)
  }
}

# Use sapply() to call get_failure_loc on logs
sapply(logs, get_failure_loc)

#--------

#vapply --> secure version of sapply, specifically have to mention what the outcome of the function you're applying will be with vapply().
#you do this with a third arguement
#vapply(X, FUN, FUN.VALUE)

"""
FUN.VALUE must be a template for the output FUN generates. You can use functions such as 
integer(), numeric(), character() and logical() to do this.
"""

# Convert the sapply call to vapply
vapply(logs, length, FUN.VALUE = integer(1))

# Convert the sapply call to vapply
vapply(logs, `[[`, "success", FUN.VALUE = logical(1))

#------------

#vapply(2)

# Convert the sapply() call to a vapply() or lapply() call
vapply(logs, `[[`, c("details", "message"), FUN.VALUE = character(1))

# Convert the sapply() call to a vapply() OR lapply() call
lapply(logs, function(x) { x$details })

#---------
 #CREATE YOUR OWN USING lapply, sapply, vapply, etc.

# Return vector with uppercase version of message elements in log entries

upper <- function(x) {
  toupper(x$details$message)
}

vapply(logs, upper, FUN.VALUE = character(1))

