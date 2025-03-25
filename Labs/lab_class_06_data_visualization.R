# ------------------------------------------------
# Lab Class 6: Visualization and Group Data Manipulation
# ------------------------------------------------

# ------------------------------------------------
# Reading the data from a file
# ------------------------------------------------
library(tidyverse)

movies <- read.csv("datasets/IMDB_movies.csv")

# ------------------------------------------------
# Output final clean version of dataset
# ------------------------------------------------
# remove duplicate rows, create new budget and gross variables, 
# rename director and title
# remove budgets greater than 400M, 
# remove non-English movies,
# order title, year, budget, director and gross first, then store in new file 
movies_clean <- 
  movies %>% 
  # mutate: creates new variables
  mutate(budgetM = budget/1000000,
         grossM = gross/1000000,
         profitM = grossM - budgetM) %>%
  rename(director = director_name, 
         title = movie_title,
         year = title_year) %>% 
  relocate(title, year, country, director, budgetM, grossM, imdb_score) %>% 
  filter(budgetM < 400, language == "English") 

movies_clean %>% glimpse()

# calculate the summary statistics for the entire dataset
movies_clean %>% summary()

# using dplyr create these summary metrics:
#   average budget (in million $)
#   average gross (in million $)
#   average profit (in million $)
#   highest gross (in million $)
#   number of movies

movies_clean %>% 
  summarize(avg_budget = mean(budgetM, na.rm = TRUE),
            avg_gross = mean(grossM, na.rm = TRUE),
            avg_profit = mean(profitM, na.rm = TRUE),
            max_gross = mean(grossM, na.rm = TRUE),
            num_movies = n())

# ------------------------------------------------
# group_by() and summarize()
# ------------------------------------------------ 
# Now we will summarize the data set FOR each director.
# (Similar to PivotTables in Excel)

# Create a summary dataframe that caclulates:
#   average budget, average gross, highest gross, and number of movies
#   per director

director_summary <-
movies_clean %>% 
  group_by(director) %>% 
  summarize(avg_budget = mean(budgetM, na.rm = TRUE),
            avg_gross = mean(grossM, na.rm = TRUE),
            max_gross = max(grossM, na.rm = TRUE),
            num_movies = n()) # counts num of movies per director

director_summary %>% glimpse()

# Using the dataframe you just created, answer the following questions.
# What are the top 10 directors that have the highest gross sales?
director_summary %>% 
  arrange(-max_gross) %>% 
  slice(1:10)

# sort based on avg gross and return top 10
director_summary %>% 
  arrange(-avg_gross) %>% 
  slice(1:10)

# What are the top 10 directors that have highest number of movies?
director_summary %>% 
  arrange(-num_movies) %>% 
  slice(1:10)

# ------------------------------------------------
# Exercises 
# ------------------------------------------------
# 1. Print a dataframe with George Lucas' average budget, gross, 
#           profit and number of films.
movies_clean %>% 
  filter(director == "George Lucas") %>% 
  summarize(avg_budget = mean(budgetM, na.rm = TRUE),
            max_gross = mean(grossM, na.rm = TRUE),
            num_movies = n()) # counts num of movies per director

# 2. Print a dataframe with the film director name, and number of films 
#           for the 10 directors with the most films in the dataset.

director_summary %>% 
  arrange(-num_movies) %>% 
  slice(1:10)


# 3. What movie content ratings have the highest average profit?  
#           (hint: must use a new group_by() command)

movies_clean %>% 
  mutate(profitM = grossM - budgetM) %>% 
  group_by(content_rating) %>% 
  summarize(avg_profitM = mean(profitM, na.rm = TRUE)) %>%
  arrange(-avg_profitM)
  
# 4. calculate the median gross for every year in the data and sort them
#           from recent to older titles. What do you observe?

movies_clean %>% 
  group_by(year, title) %>% 
  summarize(median_gross = median(grossM, na.rm = TRUE)) %>% 
  select(title, year, median_gross) %>% 
  arrange(-year)


# ------------------------------------------------
# ggplot2
# ------------------------------------------------

# ggplot is a more advanced approach to R graphics
# It uses ggplot(df) function plus layers that can go on the main layer.
# aes: you can set up main aesthetic features of the plot: x, y, color, ...
# This this the reference guide on layers:
# https://ggplot2.tidyverse.org/reference/
library(ggplot2)

University <- read.csv("datasets/University.csv")


# using University dataframe plot a scatterplot of GPA against GRE



# plot a scatter plot of GPA against GRE with different colors for department



# plot a scatter plot of GPA against GRE with different colors for admitted



# plot a scatter plot of GPA against GRE with a smoothing line



# plot a scatter plot of GPA against GRE with a LINEAR smoothing line



# plot multiple (faceted) scatter plots of GPA against GRE for different departments



# what happens if you add one smoothing line to the plot above?
 


# create a histogram of GRE distribution. Use 50 bins.


 
# options:
#     - no standard error for smoothing line
#     - change size of points
#     - change color transparency
#     - change the theme
#     - location of legend
#     - plot title and axes' labels


# ------------------------------------------------
# Exercises 
# ------------------------------------------------
# Use the diamonds data set. for this exercise.
# 1. Use the ggplot2 package to create a plot with carat on the x axis and 
#   price on the y axis.


# 2. Use the ggplot2 function facet_wrap() to create separate plots of carat 
#   against price by color.


# 3. Create the same plot as above, only this time differentiate color by cut. 
#   What patterns do you notice? 


# 4. Add labels your graph.
