#--------------------------------------------------
# Lab Class 2: Introduction to R 
#--------------------------------------------------

# this is a comment 


# You can think of R like a fancy calculator!
# executing each of these lines generates output
# to the console (the screen)
2 + 3
4 * 5
5^2
log(2)

# help documents
# help(log)
# ?log
# change base of log to 10
log(2, base = 10)
sqrt(25)


# In-Class Exercise
#1 
1 + 2 * (3 + 4)

#2
log(4^3 + 3^(2 + 1))

#3
sqrt((4 + 3) * (2 + 1))

#4
((1 + 2) / (3 + 4))^2

# To create variables and other re-usable objects 
# you can either use "<-" or "="
# by convention R uses "<-" but if you find it weird, you can use "="

# assign the value of 1 to the variable x
# R is case sensitive
x <- 1
print(x)
x + 2

# see the type or class of an object you created
class(x)
y = 3
z <- 5

(x + y) * z

# There are five basic data types in R: 
# character, double, integer, logical, and factors
class_name <- "MGSC 310"
print(class_name)
cat(class_name) # print without ""

class(class_name)
class(x)

# two more functions to check data types
is.numeric(x)
is.numeric(class_name)

is.character(x)
is.character(class_name)

# bonus point
z <- "5"
x + z

# convert z into a numeric variable
z <- as.numeric(z)

# functions in R:
print_class_name <- function(name) {
  print("This is the name of the class: ")
  print(name)
}

print_class_name(class_name)

# create a function that gets a numeric variable and adds 2
num <- 1
adding_two <- function(num) {
  print("This is the answer: ")
  print(num + 2)
}

adding_two(num)

# We can create a function in the following way



# execute the function

### Vectors # 
# vectors are a collection of a single kind of basic type of data
# We can include all strings or all numerics, but not one of each

# create a vector 
x <- (1,2,3,4)
# This will give an error

# Make sure you know why ;) 
x <- c(1,2,3,4)
y <- c(2,4,6,8)

print(x)
print(y)

x + y
(x + y) * z

JohnDoe <- c(3.8, 3.5, 4.0, 3.6, 3.9)

### Series and sequences: special forms of vector
# using : operator we can create a vector containing a sequence of numbers.
x <- 1:4
print(x)

y <- 6:9
print(y)

# rep() and seq() functions can generate more general sequences

# seq() function
seq(from = 1, to = 10)
seq(from = 1, to = 10, by = 2)
seq(5,15)

# rep() function
rep(x,2)
rep(3:7, 3)
rep(x, each = 2)

# Vector operations
# We can apply arithmetic functions on vectors too. All the calculations will
#   be done element by element.

#--------------------------------------------------
# In-Class Exercise
#--------------------------------------------------
# Create vectors using seq(), rep(), and mathematical operators. Only use c() when absolutely necessary.
seq(1:10)*2
rep(7, 6)^2

# Positive integers from 1 to 99
seq(1,99)
1:99

# Odd integers between 1 and 99
seq(1, 99, 2)
# or
seq(from = 1, to = 99, by = 2)

# The numbers 1,1,1, 2,2,2, 3,3,3
# rep(vector, times)
rep(1:3, each = 3)
# or
rep(1,3)
rep(2,3)
rep(3,3)

# The numbers 1,2,3,4,5,4,3,2,1,0
c(1:5, 4:0)
# or
1:5
4:0
# The fractions 1, 1/2, 1/3, 1/4, ., 1/10
1/seq(1:10)
1/1:10

# The cubes 1, 8, 27, 64, 125, 216
seq(1,6)**3
(1:6)^3

#--------------------------------------------------
# Built-in Datasets
#--------------------------------------------------

# example: islands  (land area of islands by regions)
islands

## Arithmetic function

# min of land area

# mean of land area

# median of land area

# variance

# standard deviation

# range of land area

# length() function gets the number of elements in a vector
# check the length of islands

# create a sequence from 1 to the length of islands vector

# create a sequence of year starting from 2015 and adding by one for all the islands


#--------------------------------------------------
# Vector Indexing and Subsetting
#--------------------------------------------------

x <- c(3,4,2,1,10,7)

# find the first element of x

# find the third element of x

# find the first to fifth elements of x

# find the second and fifth elements of x

# exclude the second and fifth elements of x


#--------------------------------------------------
# installing and loading external packages
#--------------------------------------------------
# R has many number of helpful packages created by other users. 
# to use these packages we first need to install them using the command 
# install.packages()

# to see where the packages are installed
.libPaths()

# The only argument this function takes is the name of the package 
# we want to install


# Installing the package doesn't load it into the current working session.
# To do that we type library('packagename') or require('packagename')


