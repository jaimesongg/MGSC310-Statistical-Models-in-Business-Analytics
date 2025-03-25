# ------------------------------------------------
# Lab Class 8: Linear Regression
# ------------------------------------------------
library(MASS)
data(Boston)

# Load the libraries
library(tidyverse)
library(ISLR)

# Data Exploration
Boston %>% glimpse()
?Boston # dont use ? in markdown

# summary stats
summary(Boston)

# explore relationship between age and medv
ggplot(Boston, aes(x = age, y = medv)) +
  geom_point() +
  geom_smooth(method = "lm")

# build (Estimate) a linear model to predict medv by age
  # lm(formula, data) 
  # formula x -> y
  # formula y ~ x
model1 <- lm("formula" = "medv ~ age", data = Boston)
# same thing
model1 <- lm("medv ~ age", Boston)
  
# report of results
summary(model1)

# get coefficient
coef(model1)

# interpret the coefficient:
# intercept (30.9): $31k for brand new house
# slope (-0.123): a typical house would depreciate by $123 with an additional of 1 year
predicted_value <- predict(model1)

head(predicted_value)

# compare prdicted outcome with the actual outcome
Boston <- 
  Boston %>% 
  mutate(predicted = predicted_value)

Boston %>% head()

Boston %>% glimpse()

# add number of rm and crim
model3 <- lm("medv ~ age + rm + crim", Boston)
summary(model3)

# Use Credit data set from ISLR package
data(Credit)

# Check out the description
?Credit

# Explore the data set
Credit %>% glimpse()

# Explore the relationship between Income and Balance
ggplot(Credit, aes(x = Income, y = Balance)) +
  geom_point() +

# Estimate a linear regression model to predict Balance using Income
  geom_smooth(method = "lm")

# lm(formula, data)
# y ~ x
model2 <- lm("Balance ~ Income", Credit)

# Report the results
summary(model2)

# How do you interpret the coefficients
coef(model2)

# Use the mode and balance to predict Income (to compare to true Income)
predicted_income <- predict(model2)

head(predicted_income)

# Check out the actual balance vs the predicted balance


# Calculate error and save it in another column


# Is this a good model? How can you improve it?










