# Class 11 Lab: Regression Diagnostics

# Load libraries
library(tidyverse)
library(ISLR)
library(rsample)
library(caret)

install.packages("lindia")
library(lindia)

# load the dataset
data(Credit)

Credit %>% glimpse()

# Data splitting: 75% Training, 25% Testing
set.seed(310)
Credit_split <- initial_split(Credit, prop = 0.75)
Credit_train <- training(Credit_split)
Credit_test <- testing(Credit_split)

Credit_train %>% glimpse()
Credit_train %>% head()

# Train a linear model to predict Balance
model1 <- lm(Balance ~ Income + Age + Student,
             Credit_train)

summary(model1)

# Predict Balance for train and test
pred_balance_train <- predict(model1, newdata = Credit_train)
pred_balance_test <- predict(model1, newdata = Credit_test)

# RMSE (do it on your own) train and test
RMSE(pred_balance_train, Credit_train$Balance)
RMSE(pred_balance_test, Credit_test$Balance)

# Predicted vs Actual: outcome
results_train <- Credit_train %>% 
  mutate(Predicted = pred_balance_train)

results_train %>% glimpse()

# Scatter plot predcited vs true (actual)
ggplot(results_train, aes(x = Balance, y = Predicted)) +
  geom_point() +
  geom_abline(color = 'red', linetype = 'dashed') +
  xlab("Actual Balance ($)") +
  ylab("Predicted Balance ($)")

# Diagnostics
gg_diagnose(model1)

# Residual histogram
gg_reshist(model1)

gg_resfitted(model1)

# In-Class Exercise: MPG Prediction
data(Auto)

Auto %>% glimpse()

# Convert origin to factor
Auto_clean <- Auto %>% 
  mutate(origin = factor(origin, labels=c("American", "European", "Japanese")))

Auto_clean %>% glimpse()

# Correlation table
cor.table <- cor(Auto_clean %>% select_if(is.numeric))
print(car.table)

# create a correlation
set.seed(310)
Auto_split <- initial_split(Auto, prop = 0.75)
Auto_train <- training(Auto_split)
Auto_test <- testing(Auto_split)

Auto_train %>% glimpse()
Auto_train %>% head()

model2 <- lm(horsepower ~ origin + mpg,
             Auto_train)
summary(model2)

pred_mpg_train <- predict(model2, newdata = Auto_train)
pred_mpg_test <- predict(model2, newdata = Auto_test)

# RMSE (do it on your own) train and test
RMSE(pred_mpg_train, Auto_train$mpg)
RMSE(pred_mpg_test, Auto_test$mpg)

# Predicted vs Actual: outcome
results_mpg_train <- Auto_train %>% 
  mutate(Predicted2 = pred_mpg_train)

results_mpg_train %>% glimpse()


ggplot(results_mpg_train, aes(x = mpg, y = Predicted2)) +
  geom_point() +
  geom_abline(color = 'red', linetype = 'dashed') +
  xlab("Actual mpg") +
  ylab("Predicted mpg")








