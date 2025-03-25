#--------------------------------------------------
# Lab Class 4: Data Manipulation (Dplyr)
#--------------------------------------------------

# reminder for the pipe operator %>% shortcut
#           shift + ctrl + m (Windows)
#           shift + cmd  + m (Mac)  

# ------------------------------------------------
# Load a dataset from a file
# ------------------------------------------------

# load the dataset
movies <- read.csv("datasets/IMDB_movies.csv")


# ------------------------------------------------
# Data Manipulation with dplyr (tidyverse)
# ------------------------------------------------
library(tidyverse)

#------------------------------------------------
# Review:
#   glimpse()
#   select()
#   slice()
#   arrange()
# ------------------------------------------------
movies %>% glimpse()
glimpse(movies)

movies %>% dim()

movies %>% summary()

# use slice function to show rows between 100 and 110
movies %>% slice(100:110)

# use select function to print out columns movie_title and director_name
movies %>% select(movie_title, director_name)

# now print out top 10 movies
movies %>% 
  select(movie_title, director_name) %>% 
  slice(1:10)

# ------------------------------------------------
# FILTER and ONLY allow certain rows using the FILTER function
# ------------------------------------------------
# filter removes any rows that DO NOT meet the logical operator

# ONLY select large budget movies and store this as a new data frame
big_movies <-
  movies %>% 
    filter(budget < 1000000)

big_movies %>% glimpse()
big_movies %>% nrow()


# ONLY select English language films and store this as a new data frame
english_movies <-
  movies %>% 
    filter(language == "English")
    

# select both ENGLIGH and SPANISH films
movies %>% 
  filter((language == "English") | (language == "Spanish")) %>% 
  nrow()

# ------------------------------------------------
# MUTATE to Transform variables in your dataset
# ------------------------------------------------

# adding new variables using mutate()
# let's create new varibles budgetM and grossM that are budget and gross in units of millions
movies_clean <-
  movies %>% 
  # mutate(new var =)
  mutate(budgetM = budget/1000000,
         grossM = budget/1000000,
         profitM = grossM - budgetM)

movies_clean %>% 
  glimpse()

# summary statistics on the new columns
movies_clean %>% 
  select(budgetM, grossM, profitM) %>% 
  summary()

# ------------------------------------------------
# RENAME variables using the RENAME function
# ------------------------------------------------

# use the rename function to rename variables
# rename(new_name = old_name)
movies %>% 
  rename(director = director_name) %>% 
  glimpse()

# ------------------------------------------------
# Exercises (to upload)
# ------------------------------------------------
# 1. What are the highest grossing Steven Spielberg films?
movies %>% 
  filter(director_name == "Steven Spielberg") %>% 
  arrange(-gross) %>% 
  select(movie_title, gross) %>% 
  glimpse()

# 2. Print a dataframe that only lists the films with the highest 10 budgets, 
#     the movie title, and the country of origin (hint, use select). 
movies %>% 
  select(budget, movie_title, country) %>% 
  slice(1:10)

# 3. How many "PG-13" movies are there in the database? (hint: use nrow())
movies %>% 
  select("PG-13")
  nrow(movies)

# 4. Change the name of the variable “content_rating” to “rating”
movies %>% 
  rename(rating = content_rating) %>% 
  glimpse()

# 5. Create a new dataframe called “movies_actors” that contains all the actor variables, 
#    and the movie title. (hint use select(starts_with(…))
movie_actors <-
  movies %>% 
  select(starts_with("actor"), movie_title)

# Bonus
  # check out top 10 movies with highest imdb score
movies %>% 
  arrange(-imdb_score) %>% 
  select(movie_title, director_name, title_year, imdb_score) %>% 
  slice(1:10)

# sort based on profit
movies_clean %>% 
  filter(country == "USA") %>% 
  arrange(-profitM) %>% 
  select(movie_title, profitM)
  

# ------------------------------------------------
# Plots with ggplot2
# ------------------------------------------------

# ggplot is a more advanced approach to R graphics
# It uses ggplot(df) function plus layers that can go on the main layer.
# aes: you can set up main aesthetic features of the plot: x, y, color, ...
# This this the reference guide on layers:
# https://ggplot2.tidyverse.org/reference/
library('ggplot2')

# Use Auto data set from ISLR
library(ISLR)

data(Auto)
?Auto

# Creating a scatter chart
ggplot(Auto, aes(x = mpg, y = horsepower))

# First Layer: x and y
ggplot(Auto, aes(x = mpg, y = horsepower)) + 
  geom_point()

# Second Layer: color and shape
ggplot(Auto, aes(x = mpg, y = horsepower)) + 
  geom_point(aes(color = "RED"))

# Third Layer: axes labels
ggplot(Auto, aes(x = mpg, y = horsepower)) + 
  geom_point(aes(color = "RED")) + 
  xlab("MPG (Miles per Gallon)") + 
  ylab("HP (Horsepower)") +
  labs(title = "The Relationship Between MPG and HP")

# Fourth Layer: A trending line (smoothing line)
ggplot(Auto, aes(x = mpg, y = horsepower)) + 
  geom_point(aes(color = "RED")) + 
  xlab("MPG (Miles per Gallon)") + 
  ylab("HP (Horsepower)") +
  labs(title = "The Relationship Between MPG and HP") +
  geom_smooth(method = lm)

# Fifth Layer: changing the theme


# Sixth Layer: multi-facet plots



# One-way densities (Histograms)



# ------------------------------------------------
# Exercises (to upload)
# ------------------------------------------------
# 1. Create a scatter plot with with engine displacement (displacement) on the 
#    x axis and horsepower on the y axis (horsepower)


# 2. Identify the three elements of the plot -- data, aesthetic and geometry


# 3. Add a facet to produce subplots by the origin of the car


# 4. Add a title to the plot. Change x and y labels as well.


# 5. Add a fitted line statistic element using the function 'geom_smooth()' 


# 6. add a dark theme using the "theme_dark()" option 




