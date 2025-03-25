# ------------------------------------------------
# Lab Class 13: Classification II
# ------------------------------------------------


# load the libraries
library(tidyverse)
library(ISLR)
library(rsample)
library(caret)

# install.packages("pROC")
library(pROC)

# load the data set: Default
data(Default)
head(Default)

# split the data set into Training (80%) and Testing (20%)
set.seed(310)
Default_split <- initial_split(Default, prop = 0.8)
Default_train <- training(Default_split)
Default_test <- testing(Default_split)

dim(Default_split)

# Logistic Model: default ~ balance + income + student
logit <- glm(default ~ balance + income + student,
             data = Default_train,
             family = binomial)

summary(logit)

# interpret the coefficients
exp(logit$coefficients)

# Scores (predicting probabilities)
scores_train <- predict(logit, newdata = Default_train, type="response")
head(scores_train)

# Assign classes (cutoff = 0.5)
table(Default_train$default)
predicted_default <- factor(ifelse(scores_train > 0.5, "Yes", "No"))

head(predicted_default)

# create a vector for true outcome
true_default <- Default_train$default

# check out the distribution of the outcome for both True and Predicted
table(true_default)
table(predicted_default)

# create a confusion matrix 
cm <- confusionMatrix(predicted_default, 
                      true_default,
                      positive = "Yes")
print(cm)

TN <- 7699
TP <- 87
FN <- 184
FP <- 30

# calculate Accuracy, Sensitivity, and Specificity by hand

# acc = (TN + TP) / N
acc <- (TN + TP) / (TN + TP + FN + FP)
print(acc)

# sen = (TP/P)
sen <- TP / (TP + FN)
print(sen)

# spe = (TN/N)
spe <- TN / (TN + FP)
print(spe)

# Create ROC curves using roc function


# What is AUC value?
















