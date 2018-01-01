# OOP --> advanced R6 usage


#------------

#Environments, Reference Behavior, and Static Fields 

#Create a new environment

env <- new.env()

#------------

#Working with Environments(1)

# Define a new environment
env <- new.env()

# Add an element named perfect using $
env$perfect <- c(6, 28, 496)

# Add an element named bases using [[
env[["bases"]] <- c("A", "C", "G", "T")

#-------------

#Working with Environments(2)

# Assign lst and env
lst <- list(
  perfect = c(6, 28, 496),
  bases = c("A", "C", "G", "T")
)
env <- list2env(lst)

# Copy lst
lst2 <- lst

# Change lst's bases element
lst$bases[4] <- "U"

# Test lst and lst2 bases identical
identical(lst$bases, lst2$bases)

# Copy env
env2 <- env

# Change env's bases element
env$bases[4] <- "U"  

# Test env and env2 bases identical
identical(env$bases, env2$bases)


#----------------

#Static Electricity 

"""
R6 classes can use environments' copy by reference behavior to share fields between objects. 
To set this up, define a private field named shared. This field takes several lines to define.
It should:

Create a new environment.
Assign any shared fields to that environment.
Return the environment.
The shared fields should be accessed via active bindings. 

These work in the same way as other active bindings that you have seen, but retrieve the fields
using a private$shared$ prefix.

"""

# Complete the class definition
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    shared = {
      # Create a new environment named e
      e <- new.env()
      # Assign safety_warning into e
      e$safety_warning <- "Warning. Do not try to cook metal objects."
      # Return e
      e
    }
  ),
  active = list(
    safety_warning = function(value) {
      if(missing(value)) {
        private$shared$safety_warning
      } else {
        private$shared$safety_warning <- value
      }
    }
  )
)

# Create two microwave ovens
a_microwave_oven <- microwave_oven_factory$new()
another_microwave_oven <- microwave_oven_factory$new()

# Change the safety warning for a_microwave_oven
a_microwave_oven$safety_warning <- "Warning. If the food is too hot you may scald yourself."

# Verify that the warning has change for another_microwave
another_microwave_oven$safety_warning


#-----------------

#Cloning objects 

# Create a microwave oven
a_microwave_oven <- microwave_oven_factory$new()

# Copy a_microwave_oven using <-
assigned_microwave_oven <- a_microwave_oven

# Copy a_microwave_oven using clone()
cloned_microwave_oven <- a_microwave_oven$clone()

# Change a_microwave_oven's power level 
a_microwave_oven$power_level_watts <- 400

# Check a_microwave_oven & assigned_microwave power level same 
identical(a_microwave_oven$power_level_watts, assigned_microwave_oven$power_level_watts)

# Check a_microwave_oven & cloned_microwave_oven power level different 
!identical(a_microwave_oven$power_level_watts, cloned_microwave_oven$power_level_watts) 

#-----------

#Cloning objects (2)


# Create a microwave oven
a_microwave_oven <- microwave_oven_factory$new()

# Look at its power plug
a_microwave_oven$power_plug

# Copy a_microwave_oven using clone(), no args
cloned_microwave_oven <- a_microwave_oven$clone()

# Copy a_microwave_oven using clone(), deep = TRUE
deep_cloned_microwave_oven <- a_microwave_oven$clone(deep = TRUE)

# Change a_microwave_oven's power plug type  
a_microwave_oven$power_plug$type <- "British"

# Check a_microwave_oven & cloned_microwave power plug types same 
identical(a_microwave_oven$power_plug$type, cloned_microwave_oven$power_plug$type)

# Check a_microwave_oven & deep_cloned_microwave power plug types different 
!identical(a_microwave_oven$power_plug$type, deep_cloned_microwave_oven$power_plug$type)  

#----------------

#finalize() 


"""
Just as an R6 class can define a public initialize() method to run custom code when objects
are created, they can also define a public finalize() method to run custom code when objects
are destroyed. finalize() should take no arguments. It is typically used to close connections
to databases or files, 
or undo side-effects such as changing global options() or graphics par()ameters.


The finalize() method is called when the object is removed from memory
by R's automated garbage collector. 
You can force a garbage collection by typing gc().

"""

# Microwave_factory is pre-defined
microwave_oven_factory

# Complete the class definition
smart_microwave_oven_factory <- R6Class(
  "SmartMicrowaveOven",
  inherit = microwave_oven_factory, # Specify inheritance
  private = list(
    # Add a field to store connection
    conn = NULL
  ),
  public = list(
    initialize = function() {
      # Connect to the database
      private$conn <- dbConnect(SQLite(), "cooking-times.sqlite")
    },
    get_cooking_time = function(food) {
      dbGetQuery(
        private$conn,
        sprintf("SELECT time_seconds FROM cooking_times WHERE food = '%s'", food)
      )
    },
    finalize = function() {
      # Print a message
      message("Disconnecting from the cooking times database.")
      # Disconnect from the database
      dbDisconnect(private$conn)
    }
  )
)

# Create a smart microwave object
a_smart_microwave <- smart_microwave_oven_factory$new()

# Call the get_cooking_time() method
a_smart_microwave$get_cooking_time("soup")

# Remove the smart microwave
rm(a_smart_microwave)  

# Force garbage collection
gc() 


#-------------------


