#Introduction and exploring raw data 

#-----------------

#Looking at your data 

# Check the class of bmi
class(bmi)

# Check the dimensions of bmi
dim(bmi)

# View the column names of bmi
names(bmi)

# Check the structure of bmi
str(bmi)

# Load dplyr
library(dplyr)

# Check the structure of bmi, the dplyr way
glimpse(bmi)

# View a summary of bmi
summary(bmi)

#-----------------------

#Exploring your data part 2

#--------------------

#how many rows u want to see at the beginning
head(bmi, n = 15)

#how many rows you want to see at the end
tail(bmi, n = 6)

#-------------------

#Visualizing your data 

--------------------
  
# Histogram of BMIs from 2008
hist(bmi$Y2008)

# Scatter plot comparing BMIs from 1980 to those from 2008
plot(bmi$Y1980, bmi$Y2008)

#--------------------------




