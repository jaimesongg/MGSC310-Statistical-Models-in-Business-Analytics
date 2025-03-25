#--------------------------------------------------
# Lab Class 3: Dataframes
#--------------------------------------------------

#--------------------------------------------------
# Notes:
#   - R is case sensitive: 'A' not the same as 'a'
#   - Name variables or dataframe so they are clear
#         what they are.
#   - You can use dot in the names. ex: my.data
#   - We use double quotations " " for string variables
#         and addresses.
#   - Shortcuts: 
#                   <-      :    Alt + -         (Mac: option + -)
#           clear console   :   Ctrl + L         (Mac: Command + L)
#           Command hist.   :   Ctrl + Up        (Mac: Command + Up)
#           Interrupt       :   Esc
#           Run current line:   Ctrl+ Enter  -   (Mac: Command + Enter)
#           options of functions
#           or auto complete:   Tab
#                help       :   help or ?   ex: ?log
#
#--------------------------------------------------

# ------------------------------------------------
# Indexing and Subsetting a Vector
# ------------------------------------------------

# Create a vector x 
x <- c(10,31,85,43,29,68)
print(x)

# find the third element of x
# square bracket for index
x[1]

# find the first to fifth elements of x
x[1:5]

# find the second and fifth elements of x
x[c(2,5)]

# exclude the sixth element of x
x[-6]

# exclude the second and fifth elements of x
x[-c(2,5)]

# exclude the first three elements
x[-1:-3]

# ------------------------------------------------
# Logical Values (TRUE or FALSE)
# ------------------------------------------------

rainy <- TRUE
snowy <- FALSE

## logical comparisons
y <- 2

# if y is greater than 0
y > 0

# if y is less than -1
y < -1

# if y is equal to 3
# double == is for comparing
# = is for assignment
y == 3

# if y is not equal to 5
y != 5

# logical operators
# &: and
# |: or
# recall: 
#    True and True  = TRUE
#    True and False = FALSE
#    True  or True  = TRUE
#    True  or False = TRUE                         


# ------------------------------------------------
# Conditional Indexing
# ------------------------------------------------

# Create a vector
names <- c("Asiya", "Justin", "Andrea", "Edward", "Tarka", "Alex", "Yuri")
colors <- c("BB", "WG", "WG", "BB", "WG", "BG", "BB")

# check vector size
length(names)
length(colors)

# How many students see BB
colors == "BB"
sum(colors == "BB")

# How many students see WG
colors == "WG"
sum(colors == "WG")

# How many students see WG or BG
colors == "WG"
colors == "BG"
(colors == "WG") | (colors == "BG") # | = or
sum((colors == "WG") | (colors == "BG"))

# How many students sees WG and BG
sum((colors == "WG") & (colors == "BG"))

# Conditional Indexing

# Return the student names who see BB
colors == "BB"
names[colors == "BB"]

# Return the student names who either see BB or BG
names[(colors == "BB") | (colors == "BG")]

# Return the student names who do not see BB nor WG
names[(colors != "BB") & (colors != "WG")]

# ------------------------------------------------
# In-Class Exercise
# ------------------------------------------------

y <- c(3,2,15,-1,22,1,9,17,5)

# PART 1 ------

# Display the first and last values
y[c(1,9)]

# Find the last value
length(y)
y[9]

y[length(y)]

# Display the values that are greater than the mean of y
y.mean <- mean(y)
y[y > y.mean]

y[y > mean(y)]

# PART 2 ------

# Are all the values positive?
all(y > 0)

# Are any of the values equal to the median?
y == median(y)

any(y == median(y))

# ------------------------------------------------
# DataFrames
# ------------------------------------------------

# there are different ways of creating a dataframe:
#   1. creating a dataframe from vectors
#   2. using built-in or from a package
#   3. coercing a matrix or table into a dataframe
#   4. reading from a file

# first let's use a built-in a dataframe 
data(mtcars)

# explore the dataframe
?mtcars

# check the column names
names(mtcars)

# Inspect/view the raw datafile
View(mtcars) # Do not use this!

# number of rows
nrow(mtcars)

# see number of columns
ncol(mtcars)

# see both dimensions
# will show number of rows and columns
dim(mtcars)

# check out first fre rows of dataframe
head(mtcars)
head(mtcars, 10)

# check the last observations
tail(mtcars)

# access the mpg column by "$" operator

# recall to index a dataframe
#         df[row, column]
# First column

# First row

# ------------------------------------------------
# Use R Projects
# ------------------------------------------------

# with R projects:
#   1) you have access to your files and codes
#   2) the home directory is set

# check your current working directory using getwd()
getwd()
# alternatively you can set the current working directory by setwd()
# or from menu > Session > Set working directory

# ------------------------------------------------
# Load a dataset from a file
# ------------------------------------------------

# first create a subfolder in your current directory "datasets"
# then download movies dataset from Class 4 Lab page.

# load the dataset
movies <- read.csv("datasets/IMDB_movies.csv")

# explore the dataset


# calculate the average budget across movies


