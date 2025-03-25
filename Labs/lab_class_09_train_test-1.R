# ------------------------------------------------
# Lab Class 9: Multiple Linear Regression, Model Improvement, and Bias-Variance Tradeoff
# ------------------------------------------------

# Load the libraries
library(tidyverse)
library(ISLR)
library(caret) # install.packages("caret")
library(rsample) # install.packages("rsample")

# Load Boston data from files
Boston_train <- read.csv("datasets/Boston_train.csv")
Boston_new <- read.csv("datasets/Boston_new.csv")/

Boston_train %>% glimpse()
Boston_train %>% summary()  

# ------------------------------------------------
# Review: Simple linear regression: Predict Housing Value using House Age
# ------------------------------------------------
# model 1: Simple Linear Regression
model1 <- lm(medv ~ age, Boston_train)

# summary of the results
summary(model1)

# Interpretation
# Questions for students:
# - Interpret the coefficient of 'age'.
# - State the null hypothesis. Is 'age' statistically significant?


# Evaluate model accuracy with RMSE

# What is the prediction accuracy? What is the model error?
#   first, we need to calculate housing value prediction using our model.
#   the, we measure the RSME (root mean squared error)
#   RMSE captures the average distance (error) between our prediction and actual values
pred_train1 <- predict(model1)

# Now calculate the average error of the model
#   RMSE(predicted Y values, true Y values) # from caret package
RMSE(pred_train1, Boston_train$medv)

# Discuss:
# - What does RMSE represent?

# ------------------------------------------------
# Model Improvement
# ------------------------------------------------
# How can we improve model1?
#   two approaches:
#       1. flexible model with polynomial terms
#       2. more informative features (variables)

# model 2: use more flexible model. Add higher order terms.
model2 <- lm(medv ~ poly(age, 2), Boston_train)
summary(model2)

# see the model in action: create a scatter plot to show the relationship
ggplot(Boston_train, aes(x = age, y = medv)) +
  geom_point(alpha=0.6) +
  geom_smooth(method = "lm", formula = "y ~ poly(x, 2)", se = FALSE, color = "blue") +
  labs(title = "Housing Value vs Age with Polynomial Fit", 
       x = "House Age", y = "Housing Value ($1000)") 
  ylim(5,50) 

# How is the model fit?


# Evaluate improved model (What is the model Error?)
pred_train2 <- predict(model2)
RMSE(pred_train2, Boston_train$medv)

# Approach 2: add informative variables (model 3)
Boston_train %>% glimpse()
  
model3 <- lm(medv ~ . , Boston_train)
summary(model3)

# Evaluate model 3 accuracy
pred_train3 <- predict(model3)
RMSE(pred_train3, Boston_train$medv)

# Discussion Questions:
# - Which approach improved the model more significantly?
# - Which model is more flexible: Model 1, or 3? Why?


# ------------------------------------------------
# Ultimate Model: High Complexity (Model 4)
# ------------------------------------------------
# Now, let's make an ultimate model to have the best accuracy
model4 <- lm(medv ~ poly(crim,5) + poly(zn,5) + poly(indus,5) + poly(nox,5) + poly(rm,5) + 
                     poly(age,5) + poly(dis,5) + poly(rad,5) + poly(tax,5) + poly(ptratio,5) + 
                     poly(black,5) + poly(lstat, 5) + chas, Boston_train)


# Evaluate highly complex model
pred_train4 <- predict(model4)
RMSE(pred_train4, Boston_train$medv)

# Have we got model improvement?

# ------------------------------------------------
# Model Assessments (out-of-sample predictions)
# ------------------------------------------------
# Are we really improving the model prediction?
# To answer this question, we need to test the model against a new data set.
# That's where the new data set Boston_new comes to play.

# To use the model for new data sets, we need to predict
#   housing values for the new houses.

# Evaluate Model 3 on new data
# use predict function and with newdata argument provide the new data set.
predicted_values3_test <- predict(model3, newdata = Boston_new)
# Now we can calculate the average error (RMSE) for the new dataset
RMSE(predicted_values3_test, Boston_new$medv)

# Evaluate Model 4 on new data
predicted_values4_test <- predict(model4, newdata = Boston_new)
RMSE(predicted_values4_test, Boston_new$medv)

# Discussion Questions:
# - Did complexity lead to better predictions on new data?
# - How does this illustrate bias-variance tradeoff?


# ------------------------------------------------
# Data Splitting Practice with Credit Dataset
# ------------------------------------------------
# Now, we do a regression prediction model using Credit data set from ISLR
data(Credit)

# Split data into training (75%) and test sets (25%)
# use set.seed(310) to "fix" the randomness
set.seed(310)
credit_split <- initial_split(Credit, prop = 0.75)
credit_train <- training(credit_split)
credit_test <- testing(credit_split)

# check out the dimensions for the new dataframes


# Train a linear model: Balance ~ Income + Limit (using the Training data set)


# Calculate in-sample RMSE


# Calculate out-of-sample RMSE


# Discussion Questions:
# - What does train RMSE indicate? What about test RMSE?
# - Why do we split data into training and testing sets?

