# ------------------------------------------------
# Lab Class 12
# ------------------------------------------------

# Load the libraries
library(tidyverse)
library(ISLR)
library(caret)
library(rsample)


# ------------------------------------------------
# Classification
# ------------------------------------------------
# use Default from ISLR
data(Default)

# data description: ?Default
?Default

# explore data set
Default %>% glimpse()

# check frequency of defaulting
table(Default$default)

# percentage frequency
table(Default$default) / nrow(Default)

# split the data set into training (80%) and testing (20%)
set.seed(310)
Default_split <- initial_split(Default, prop = 0.8)
Default_train <- training(Default_split)
Default_test <- testing(Default_split)

Default_train %>% glimpse()

# Build a logistic (logit) model:
# default ~ balance
logit1 <- glm(default ~ balance,
              Default_train,
              family = binomial)

summary(logit1)

# exponentiate the coefficients
exp(coef(logit1))

# prevent scientific format
options(scipen = 99)
exp(coef(logit1))

# prediction: predicted probabilities (scoring)
scores_train <- predict(logit1, newdata = Default_train, type = "response")

scores_train %>% head()

# reformat my results into a dataframe
results_train <- data.frame(
  default = Default_train$default,
  balance = Default_train$balance,
  scores = scores_train
)

results_train %>% head()

# create a scatter plot for predicted probs versus balance
ggplot(results_train, aes(x = balance, y = scores, color = default)) +
  geom_point() +
  xlab("Credit Balance ($)") +
  ylab("Predicted Probability of Defaulting")
  












