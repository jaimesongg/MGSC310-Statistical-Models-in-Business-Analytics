# Class 14: Classification Lab

# load libraries
library(tidyverse)
library(ISLR)
library(rsample)
library(caret)
library(pROC)

# load data
data(Default)
head(Default)

# data splitting
set.seed(310)
Default_split <- initial_split(Default, prop = 0.8)
Default_train <- training(Default_split)
Default_test <- testing(Default_split)

Default_train %>% head()

# logistic model to predict default
logit1 <- glm(default ~ balance + income + student,
              Default_train,
              family = binomial)

summary(logit1)

# scoring the model (predicted probabilities)
scores_train <- predict(logit1, newdata = Default_train, type = "response")
head(scores_train)

# assign classes (yes/no)
pred_default_train <- factor(ifelse(scores_train > 0.5, "Yes", "No"))
head(pred_default_train)  

true_default_train <- Default_train$default
head(true_default_train)

# confusion matrix
cm_train <- confusionMatrix(pred_default_train,
                            true_default_train,
                            positive = "Yes")
print(cm_train)  


# ROC curve
roc_obj <- roc(true_default_train, scores_train)

print(roc_obj)

plot(roc_obj, col = "blue", main = "ROC Curve", print.thres = c(0.01, 0.03, 0.1, 0.5, 0.8))

# area under curve (AUC)
auc(roc_obj)












  
  

