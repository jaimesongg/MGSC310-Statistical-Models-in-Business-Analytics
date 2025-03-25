#--------------------------------------------------
# Lab Class 4: Data Manipulation (Dplyr)
#--------------------------------------------------
x <- c(12, 35, 65, 73, 21)

length(x)
sum(x)
mean(x)
median(x)
min(x)

# ------------------------------------------------
# Missing data
# ------------------------------------------------

# MISSING VALUES are values that are unknown in your dataset
# R stores missing values as as NAs
y <- c(45, 54, 52, NA, 98, NA)

print(y)

# use is.na() function to check whether a value is missing or not
is.na(y)

# count NAs
sum(is.na(y))

# calculate average of y
mean(y)
mean(y, na.rm = TRUE)

# ------------------------------------------------
# Installing new packages
# ------------------------------------------------

# Packages are modules that come with a set of useful commands for a specific tasks
# to install new packages use install.packages() command
# use double quotation sign

# install tidyverse for data manipulation
# install ISLR (textbook package)

# type it in the CONSOLE
# install.packages("ISLR")

# NOTE: you need to install a package ONCE on your machine.
#       next time you open a new R session, the package is installed!
#       you just need to load it.

# to load a package use library()
library(ISLR)

# Access Auto dataset stored in ISLR
ISLR::Auto
data(Auto)
?Auto

# Explore the dataset

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
# find name of columns
names(movies)

# find dimensions
dim(movies)

# find num rows
nrow(movies)

# find num columns
ncol(movies)

# get summary of datads
summary(movies)

# calculate the average budget across movies


# ------------------------------------------------
# Data Manipulation with dplyr (tidyverse)
# ------------------------------------------------
# install tidyverse package using: 
# install.packages("tidyverse")
library(tidyverse)

# let's summarize the data using the glimpse function
glimpse(movies)

# Pipe Operator!  

# The pipe operator "%>%" is super useful!
# It allows us to execute a series of functions on an object in stages
# The general recipe is Data_Frame %>% function1() %>% function2() etc
# Functions are applied right to left
movies %>% glimpse()

# shortcut  shift + ctrl + m (Windows)
#           shift + cmd  + m (Mac)  
movies %>% glimpse() 


# ------------------------------------------------
# Slice function: to select ROWS 
# ------------------------------------------------
head(movies)
head(movies, 10)
movies %>% head(10)

# SLICE: slice to view only the first 10 rows
movies %>% slice(1:10)

# SLICE to view only rows 300 to 310 
movies %>% slice(300:310)

# ------------------------------------------------
# Arrange function: to ORDER dataset
# ------------------------------------------------

# arrange the dataframe in descending order by budget, and store this back as movies
movies %>% arrange(budget) # ascending: smallest to largest
movies %>% arrange(desc(budget)) # descending: largest to smallest
movies %>% arrange(-budget) # descending

# arrange the dataframe by budget and print the top 5 rows
movies %>% arrange(-budget) %>% slice(1:5)

# arrange via multiple columns, by budget and title year, then output rows 1 to 10
movies %>% 
  arrange(-title_year, -budget) %>% 
  slice(1:10)

# ------------------------------------------------
# SELECT columns of the dataset using the 'select' function
# ------------------------------------------------
# selecting columns using the select() function
# here we create a subset of the original dataset that only contains director_name and movie title
movies %>% select(director_name, movie_title)

directors <- movies %>% select(director_name, movie_title)

# using select to programmatically select several variables that 'starts_with' a certain string
movies %>% 
  select(starts_with("actor")) %>% 
  glimpse()
  
# ------------------------------------------------
# RENAME variables using the RENAME function
# ------------------------------------------------

# use the rename function to rename variables
# rename(new name = old name)
movies %>% 
  rename(title = movie_title) %>% 
  glimpse()

# ------------------------------------------------
# FILTER and ONLY allow certain rows using the FILTER function
# ------------------------------------------------
# filter removes any rows that DO NOT meet the logical operator

# ONLY select Spanish language movies
movies %>% 
  filter(language == "Spanish") %>% 
  nrow()

# ONLY select large budget movies and store this as a new data frame


# ONLY select English language films and store this as a new data frame


# select both ENGLIGH and SPANISH films



# ------------------------------------------------
# MUTATE to Transform variables in your dataset
# ------------------------------------------------

# adding new variables using mutate()
# let's create new varibles budgetM and grossM that are budget and gross in units of millions


# Highest imdb_score movies (top 5)
movies %>% 
  arrange(-imdb_score) %>% 
  select(movie_title, imdb_score) %>% 
  slice(1:5)
# ------------------------------------------------
# Exercises (to upload)
# ------------------------------------------------
# 1. What are the highest grossing Steven Spielberg films?


# 2. Print a dataframe that only lists the films with the highest 10 budgets, 
#     the movie title, and the country of origin (hint, use select). 


# 3. How many "PG-13" movies are there in the database? (hint: use nrow())


# 4. Change the name of the variable “content_rating” to “rating”


# 5. Create a new dataframe called “movies_actors” that contains all the actor variables, 
#    and the movie title. (hint use select(starts_with(…))

