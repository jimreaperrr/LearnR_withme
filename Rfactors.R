""" The term factor refers to a statistical data type used to store categorical variables. 
The difference between a categorical variable and a continuous variable is that a categorical 
variable can belong to a limited number of categories. A continuous variable, on the other hand,
can correspond to an infinite number of values.

It is important that R knows whether it is dealing with a continuous or a categorical variable,
as the statistical models you will develop in the future treat both types differently. 
(You will see later why this is the case.) """

# Gender vector
gender_vector <- c("Male", "Female", "Female", "Male", "Male")

# Convert gender_vector to a factor
factor_gender_vector <- factor(gender_vector)

# Print out factor_gender_vector
print(factor_gender_vector)

# Animals
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector 

# Temperature
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector

"""  When you first get a data set, you will often notice that it contains factors with specific factor levels. However, sometimes 
you will want to change the names of these levels for clarity or other reasons. R allows you to do this with the function levels():

"""

# Code to build factor_survey_vector
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)

# Specify the levels of factor_survey_vector
levels(factor_survey_vector) <- c("Female", "Male")

factor_survey_vector

# Generate summary for survey_vector
summary(survey_vector)

# Generate summary for factor_survey_vector
summary(factor_survey_vector)

# Create speed_vector
speed_vector <- c("fast", "slow", "slow", "fast", "insane")

# Convert speed_vector to ordered factor vector
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow","fast","insane"))

# Print factor_speed_vector
factor_speed_vector
summary(factor_speed_vector)


"""Comparing ordered factors"""

# Create factor_speed_vector
speed_vector <- c("fast", "slow", "slow", "fast", "insane")
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "fast", "insane"))

# Factor value for second data analyst
da2 <- factor_speed_vector[2]

# Factor value for fifth data analyst
da5 <- factor_speed_vector[5]

# Is data analyst 2 faster than data analyst 5?
da2 > da5 