# ------------------------------------------------
# Lab Class 7: Visualization Practice - Linear Regression
# ------------------------------------------------

# load the libraries
library(tidyverse)

# load University data set
University <- read.csv("datasets/University.csv")

# quick data exploration
University %>% glimpse()

# Convert admitted to a factor
University <- 
  University %>% 
  mutate(admitted = factor(admitted)) # also use as.factor

# if you want to change the labels for a factor variable
University <- 
  University %>% 
  mutate(admitted = factor(admitted, labels = c("non-admitted,", "admitted")))

University %>% glimpse()

# first graph: scatter plot of the GRE against GPA
ggplot(data = University, mapping = aes(x = GPA, y = GRE)) +
  geom_point(aes(color = admitted)) +
  # multiple scatter plots
  facet_wrap(~department) +
  geom_smooth(method = "lm", se = FALSE) + 
  labs(title = "GRE against GPA") +
  xlab("GPA Score") +
  ylab("GRE Score") +
  theme_dark()

# se in geom_smooth: confidence intervals of the trending line

# second graph: histogram of GPA
ggplot(University, aes(GPA)) +
  geom_histogram(bins  = 50)

ggplot(University, aes(GPA)) +
  geom_histogram(bins  = 20)

# third graph: density plots
# install packages ("ggridges") do not use in markdown
install.packages("ggridges")
library(ggridges)

ggplot(University, aes(x = GRE, y = department)) +
  geom_density_ridges(aes(fill = department)) # smoothed histogram


# load the Diamonds data file
Diamonds <- read.csv("datasets/Diamonds.csv")

# explore the data set
glimpse(Diamonds)

# ------------------------------------------------
# Visualization Practice
# ------------------------------------------------
# 1. Use the ggplot2 package to create a plot with carat on the x axis 
#     and price on the y axis. add a linear trend line.
ggplot(data = Diamonds, mapping = aes(x = carat, y = price)) +
  geom_point(aes(color = color)) +
  geom_smooth(method  = "lm", se= FALSE) +

# 2. Use the ggplot2 function facet_wrap() to create separate plots of 
#     carat against price by color.
  facet_wrap(~color)

# 3. Create the same plot as above, only this time add color by cut. 
#     What patterns do you notice? 
ggplot(data = Diamonds, mapping = aes(x = cut, y = color)) +
  geom_point(aes()) +
  geom_smooth(method  = "lm", se= FALSE) 

# 4. Add labels your graph.

# 5. Using geom_histogram(), create a histogram of price. use 50 bin.

# 6. To the graph in question 5, add color by cut. 


# Cool way to visualize the distribution of a continuous variable (histogram)
#   separated by a categorical variable
#   ggridges package!

# install.packages("ggridges") # do not use in markdown

library(ggridges)

# using ggridges create distribution (density) plots of price grouped
#   by cut

# x = price   (continuous variable)
# y = cut     (grouping variable - factor)

  

# ------------------------------------------------
# Simple Linear Regression
# ------------------------------------------------

