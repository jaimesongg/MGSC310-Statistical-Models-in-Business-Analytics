# IMDB-5000 Movie Revenue Prediction

## Question 1: Predicting Movie Revenue

### Part 1: Data Splitting
- Run the setup code to generate the cleaned dataset. If `forcats` is not installed, use `install.packages("forcats")`.
- Split the data into 80% training (`movies_train`) and 20% testing (`movies_test`) using `set.seed(310)` for reproducibility.

### Part 2: Linear Regression
- Estimate a linear regression model predicting `grossM` using `imdb_score`, `budgetM`, and `rating_simple`.
- Relevel `rating_simple` to use "R" as the reference category (`relevel(rating_simple, ref = "R")`).
- Print the regression summary and comment on the model’s explanatory power.

### Part 3: Interpretation

#### BudgetM Coefficient:
- Interpret the coefficient for `budgetM`. Does a higher budget lead to higher revenue, holding `imdb_score` constant? Provide examples.

#### Rating Interpretation:
- Interpret the coefficient for movies rated "G". How does it compare to "R"-rated movies in terms of expected revenue?

#### P-value Explanation:
- What is the p-value for `imdb_score`? Explain what a p-value represents and what it implies about the relationship between `imdb_score` and profit.

### Part 4: Prediction and Evaluation
- Use the `predict()` function to generate predictions on both the training and testing sets.
- Create a `ggplot2` visualization comparing predicted vs. actual movie gross revenues in the test set.
- Calculate RMSE for both training and testing sets using the `RMSE` function from the `caret` package.
- What does RMSE tell you about your model’s accuracy? Is your model overfitting? Justify your answer using RMSE results.

