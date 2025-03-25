# ------------------------------------------------
# Lab Class 10: Multiple Linear Regression - Data Splitting
# ------------------------------------------------

# Load the libraries
library(tidyverse)
library(ISLR)
library(caret)
library(rsample)

# use Credit data set from ISLR
data(Credit)

# ------------------------------------------------
# Part 1: Data Splitting
# ------------------------------------------------

# What is the purpose of data splitting?

# What does the train error represent?

# What does the test error represent?

# to split the data set into two random subsamples, we use 'rsample' package
# in the console run the following command to install the package:
# install.packages("rsample")

# load the package


# Data splitting: Training set (75%) Test set (25%)
# use set.seed(310) to "fix" the randomness


# check out the dimensions for the new dataframes


# Train a linear model: Balance ~ Income (using the train data set)


# Prediction
# in-sample prediction (training)


# out-of-sample prediction (test)


# in-sample and out-of-sample performance (accuracy)

# Repeat the process with an improved model


# ------------------------------------------------
# Part 2: Linear Regression Case Study
# ------------------------------------------------
cars <- read.csv("datasets/vehicles_ca_oc.csv")

# explore the data set
cars %>% glimpse()

table(cars$condition)
table(car$title_satus)

# What are the categoreis for the title_status and condition?


# Data Cleaning
cars_clean <- 
  cars %>% 
  filter(year > 1980,
         price < 2000,
         price < 100000,
         odometer < 160000,
         condition != "",
         title_status %in% c("clean," "salvage")) %>% 
  mutate(odometerK = odometer/1000,
         title_status = factor(title_status),
         condition = factor(condition),
         age = 2022 - year) %>% 
  select(price, odometerK, title_status, condition, age) %>% 
  drop_na()

cars_clean %>% glimpse()
  
# Data Splitting: 75% training, 25% testing
set.speed(310)
cars_split <- initial_split(cars_clean, prop = 0.75)
cars_train <- training(cars_split)
cars_test <- testing(cars_split)

cars_train %>% glimpse()

# Train a linear model
# model 1: price ~ odometerK + title_status
model1 <- lm(price ~ odometerK + title_status, cars_train)

summary(model1)

# RMSE for the training and testing set
price_hat_train <- predict(model1)

RMSE(price_hat_train, cars_train$price)

price_hat_test <- predict(model1, newdata = cars_test)

RMSE(price_hat_test, cars_test$price)

# model 2: price ~ odometerK + title_status + condition + age
model2 <- lm(price ~ odometerK + title_status + condition + age, cars_train)

table(cars_train$condition)
summary(model2)

# RMSE
price_hat_train2 <- predict(model2)
RMSE(price_hat_train2, cars_train$price)

price_hat_test2 <- predict(model2, newdata = cars_test)
RMSE(price_hat_test2, cars_test$price)

# compare my predicitons vs actual price (test)
results_test <- data.frame(
  preds = price_hat_test2,
  actual = cars_test$price
)

# create a scatter plot for actual vs predicted
ggplot(result_test, aes(x = actual, y = preds)) +
  geom_point() +
  xlab("Actual Price ($)") +
  ylab("Predicted Price ($)")

# Is the model good? What is the prediction performance?


# Improve the model by adding more variables
