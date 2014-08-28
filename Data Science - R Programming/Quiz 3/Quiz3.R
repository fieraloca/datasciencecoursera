#quiz 3

rm(list = ls())

library(datasets)
data(iris)

# this will split the set with species being the dividing factor
s <- split(iris,iris$Species)

# Question 1 - calculating he averages for each of the species
lapply(s, function(x) colMeans(x[, c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")]))


# Question 2 - what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
apply(iris[, 1:4], 2, mean)



#Question 3
rm(list = ls())

library(datasets)
data(mtcars)

?mtcars

#How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
#this one will do it.
sapply(split(mtcars$mpg, mtcars$cyl), mean)


apply(mtcars, 2, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
sapply(mtcars, cyl, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)


# Question 4 - Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

sapply(split(mtcars$hp, mtcars$cyl), mean)

# this is the answer 126.5779

