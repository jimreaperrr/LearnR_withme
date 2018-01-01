#R6 OOP

#--------


# class generators are templates for objects 
#         a.k.a factories  

library(R6)

#R6Class function 
thing_factory <- R6Class (
  "Thing", 
  private = list ( #always a list to store data --> others public, active.
    a_field = "a value",
    another_field = 123
  )
)

#Create some objects 

a_thing <- thing_factory$new()
another_thing <- thing_factory$new() 


#Summary
# - Load the R6 package to work with R6
# - Define class generators with R6Class()
# - Class names should be UpperCamelCase
# - Data fields stored in private list


#-----------


#Ex: R6Class

# Define microwave_oven_factory
microwave_oven_factory <- R6Class (
  "MicrowaveOven",
  private = list(
    power_rating_watts = 800
  )
)


#----------

#Ex: Make a new object

# View the microwave_oven_factory
microwave_oven_factory

# Make a new microwave oven
microwave_oven <- microwave_oven_factory$new()


#-------

#Encapsulation --> term in OOP where you seperate the implementation object from its user interface.
# - Store data in private list 
# - Store methods in public list 
# - Use private$ to access private elements
# - Use public$ to access public elements 

microwave_oven_factory <- R6Class (
  "MicrowaveOven",
  private = list(
    power_rating_watts = 800,
    door_is_open = FALSE
  ),
  
  public = list (
    open_door = function () {
      private$door_is_open <- TRUE
    }
  )
)

#-------------

#Ex: Encapsulation

# Add a cook method to the factory definition
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    power_rating_watts = 800
  ),
  public = list(
    cook = function(time_seconds) {
      Sys.sleep(time_seconds)
      print("Your food is cooked!")
    }
  )
)

# Create microwave oven object
a_microwave_oven <- microwave_oven_factory$new()

# Call cook method for 1 second
a_microwave_oven$cook(1)


#-----------

#Adding methods to public

# Add a close_door() method
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    power_rating_watts = 800,
    door_is_open = FALSE
  ),
  public = list(
    cook = function(time_seconds) {
      Sys.sleep(time_seconds)
      print("Your food is cooked!")
    },
    open_door = function() {
      private$door_is_open = TRUE
    },
    close_door = function () {
      private$door_is_open = FALSE
    }
    
  )
)


#--------

#Initalize -->  It is called automatically when an object is created; when the user calls new()
# initialize() lets you set the values of the private fields when you create an R6 object. 

# Add an initialize method
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    power_rating_watts = 800,
    door_is_open = FALSE
  ),
  public = list(
    cook = function(time_seconds) {
      Sys.sleep(time_seconds)
      print("Your food is cooked!")
    },
    open_door = function() {
      private$door_is_open = TRUE
    },
    close_door = function() {
      private$door_is_open = FALSE
    },
    # Add initialize() method here
    initialize = function(power_rating_watts, door_is_open) {
      if(!missing(power_rating_watts)) {
        private$power_rating_watts <- power_rating_watts
      }
      if(!missing(door_is_open)) {
        private$door_is_open <- door_is_open
      }
    }
  )
)

# Make a microwave
a_microwave_oven <- microwave_oven_factory$new(650, TRUE)


#------------------

#Getting and Setting with Active Bindings

# - getting = read the data field
# - setting = write the data field 
# - Active Bindings --> defined like functions, accessed like data variables 

#Ex:

#Point of active is have control to the private fields --> this means u can have custom logic before you  assign to it

thing_factory <- R6Class (
  "Thing",
   private = list( 
      a_field = "a value",
      another_field = 123
  ),
  active = list(
    a_field = function () {
      if(is.na(private$a_field)) {
        return("a missing value")
      }
      private$a_field
    },
    another_field = function(value) {
      if(missing(value)) {
        private$another_field
      }else {
        assert_is_a_number(value)
        private$another_field <- value
      }
    }
  )
)

a_thing <- thing_factory$new()
a_thing$a_field

#----------------

#Ex: active binding


# Add a binding for power rating
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    ..power_rating_watts = 800
  ),
  active = list(
    # add the binding here
    power_rating_watts = function () {
      private$..power_rating_watts
    }
  )
)

# Make a microwave 
a_microwave_oven <- microwave_oven_factory$new()

# Get the power rating
a_microwave_oven$power_rating_watts

#-----------

#More practice


# Add a binding for power rating
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    ..power_rating_watts = 800,
    ..power_level_watts = 800
  ),
  # Add active list containing an active binding
  active = list(
    power_level_watts = function(value) {
      if(missing(value)) {
        private$..power_level_watts
      } else {
        assert_is_a_number(value)
        assert_all_are_in_closed_range(
          value, lower = 0, upper = private$..power_rating_watts
        )
        private$..power_level_watts <- value
      }
    }
  )
)

# Make a microwave 
a_microwave_oven <- microwave_oven_factory$new()

# Get the power level
a_microwave_oven$power_level_watts

# Try to set the power level to "400"
a_microwave_oven$power_level_watts <- "400"

# Try to set the power level to 1600 watts
a_microwave_oven$power_level_watts <- 1600

# Set the power level to 400 watts
a_microwave_oven$power_level_watts <- 400


#-------

#Inheritance 

# - Parent --> The class you inherit from
# - Child --> The class that inherits fields and methods

#Ex:

thing_factory <- R6Class( 
  "Thing",
   private = list (
     a_field = "a value",
     another_field = 123
   ),
   public = list(
     do_something = function(x,y,z) {
       #do something here
     }
   )
  )


child_thing_factory <- R6Class( 
  "ChildThing",
  inherit = thing_factory,
  public = list(
    do_something_else = function () {
      #more functionality
    }
  )
)

a_thing <- thing_factory$new()
class(a_thing)
inherits(a_thing, "Thing")
inherits(a_thing,"ChildThing")
#-------

#Ex: of inheritance 

# Explore the microwave oven class
microwave_oven_factory

# Define a fancy microwave class inheriting from microwave oven
fancy_microwave_oven_factory <- R6Class(
  "FancyMicrowaveOven",
  inherit= microwave_oven_factory
)

#------------

#More examples of inheritance

# Explore microwave oven classes
microwave_oven_factory
fancy_microwave_oven_factory

# Instantiate both types of microwave
a_microwave_oven <- microwave_oven_factory$new()
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Get power rating for each microwave
microwave_power_rating <- a_microwave_oven$power_rating_watts
fancy_microwave_power_rating <- a_fancy_microwave$power_rating_watts

# Verify that these are the same
identical(microwave_power_rating, fancy_microwave_power_rating)

# Cook with each microwave
a_microwave_oven$cook(1)
a_fancy_microwave$cook(1)

#----------

#Embrace, Extend, Override 

# - Override by giving the same name
# - Extend by giving a new name

# - private$ accesses private fields
# - self$ accesses public methods in self
# - super$ accesses public methods in parent 


thing_factory <- R6Class(
  "Thing",
  public = list(
    do_something = function() {
      message("the parent do_something method")
    }
  )
)

child_thing_factory <- R6Class(
  "ChildThing",
  inherit = thing_factory,
  public = list(
    do_something = function() {
      message("the child do_something method")
    },
    do_something_else = function () {
      message("the child do_something else method")
      self$do_something()
      super$do_something()
    }
  )
)

a_child_thing <- child_thing_factory$new()
a_child_thing$do_something()
a_child_thing$do_something_else()
#-------------


#Ex: of self$


# Explore microwave oven class
microwave_oven_factory

# Extend the class definition
fancy_microwave_oven_factory <- R6Class(
  "FancyMicrowaveOven",
  inherit = microwave_oven_factory,
  # Add a public list with a cook baked potato method
  public = list(
    cook_baked_potato = function() {
      self$cook(3)
    }
  )
)

# Instantiate a fancy microwave
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Call the cook_baked_potato() method
a_fancy_microwave$cook_baked_potato()

#------------

#Overriding 

# Explore microwave oven class
microwave_oven_factory

# Update the class definition
fancy_microwave_oven_factory <- R6Class(
  "FancyMicrowaveOven",
  inherit = microwave_oven_factory,
  # Add a public list with a cook method
  public = list(
    cook = function(time_seconds) {
      super$cook(time_seconds)
      message("Enjoy your dinner!")
    }
  )
)

# Instantiate a fancy microwave
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Call the cook() method
a_fancy_microwave$cook(1)


#---------------

#Mutiple levels of Inheritance

thing_factory <- R6Class(
  "Thing",
  public = list (
    do_something = function () {
      message("the parent do something method")
    }
  )
)

child_thing_factory <- R6Class(
  "ChildThing",
  inherit = thing_factory,
  public = list (
    do_something = function () {
       message("the child do something method")
    }
  ),
  active = list ( #access parent need this active binding for super_
    super_ = function () super #super_ returns super
  )
)

grand_child_thing_factory <- R6Class(
  "GrandChildThing",
  inherit = child_thing_factory,
  public = list (
    do_something = function () {
      message("the grandchild do something method")
      super$do_something() #parent
      super$super_$do_something() #grandparent
      }
    )
)

a_grand_child_thing <- grand_child_thing_factory$new()
a_grand_child_thing$do_something()

#-----------------

# super_ with active binding example


# Explore other microwaves
microwave_oven_factory
fancy_microwave_oven_factory

# Define a high-end microwave oven class
high_end_microwave_oven_factory <- R6Class (
  "HighEndMicrowaveOven",
  inherit = fancy_microwave_oven_factory,
  public = list (
    cook = function (time_seconds) {
      super$super_$cook(time_seconds)
      message(ascii_pizza_slice)
    }
  )
)




# Instantiate a high-end microwave oven
a_high_end_microwave <- high_end_microwave_oven_factory$new()

# Use it to cook for one second
a_high_end_microwave$cook(1)

#------------


