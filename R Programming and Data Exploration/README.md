# IMDB-5000 Dataset Analysis

## Question 1: Data Inspection and Preprocessing

### 1.1 Check Current Working Directory
Ensure that your current working directory is set correctly.

### 1.2 Download and Read the Dataset
- Download the IMDB-5000 dataset from the Canvas site.
- Place this file in a folder named `datasets`.
- Read the dataset into R and assign it to a variable called `movies`.

### 1.3 Dataset Dimensions
Programmatically determine the dimensions of the dataset using the `dim()` function.

### 1.4 Variable Names
Get the names of the variables in the dataset using the `names()` function.

### 1.5 Data Types of Variables
Use the `glimpse()` function (from the `dplyr` package) to inspect the data types of each variable in the dataset. Identify which variables are of character type.

### 1.6 First 5 Rows
Use the `slice()` function to display the first 5 rows of the dataset.

### 1.7 Order by Box Office Revenue
- Use the `arrange()` function to order the dataset by `gross` or total box office revenue in descending order.
- Use `slice()` to show the ten movies with the largest box office revenue in the dataset.
- Identify the director with the highest box office revenue.

### 1.8 Remove Facenumber Variable
- Use the `select()` function to remove the variable `facenumber_in_poster`.
- Store the resulting dataset as `movies_sub`.
- Run the `dim()` function to ensure `movies_sub` has one fewer variable than `movies`.

### 1.9 PG-13 Movies
- Count how many movies are rated as PG-13 using the `content_rating` column.
- Calculate the average revenue (`gross`) for PG-13 movies.

---

## Question 2: Basic Plotting with ggplot2

### 2.1 Scatter Plot of IMDB Score vs. Movie Gross
Use the `ggplot2` package to create a scatter plot of the IMDB score on the x-axis and movie gross on the y-axis.

### 2.2 Adjust Transparency
Reduce the transparency of each data point by using the `alpha = 0.1` option.

### 2.3 Scale Gross in Millions
- Use the `mutate()` function to create a new variable `gross_M`, which represents the gross revenue in millions of dollars.
- Store this new variable in the `movies` dataset.

### 2.4 Scatter Plot with Smoothing Line
Create a scatter plot of `imdb_score` against `gross_M` and use `geom_smooth()` to add a smoothing line. Investigate the relationship between movie gross and IMDB score.

### 2.5 James Cameron Movies
- Use the `filter()` function to include only movies directed by James Cameron.
- Use `geom_text(aes(label = movie_title), color = "blue")` to plot movie gross against IMDB score for James Cameron's films, where the points are labeled with the movie titles.

### 2.6 Adjust Axes
- Use the functions `xlim()` and `ylim()` to set more reasonable axis ranges for the plot to avoid clipping of the text.
- Add better axis titles using `xlab()` and `ylab()`.

---

## Installation and Setup

To run this analysis, ensure that the required R packages are installed:

```r
install.packages(c("dplyr", "ggplot2"))

