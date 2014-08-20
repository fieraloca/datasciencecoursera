# test_pollutant_part2



# clearing the environment
rm(list = ls())

#setwd("E:/COFRE_37666/PROJECTS/!COURSERA/Data Science - R Programming/Assignment Week 2")


source("complete.R")
a <- complete("specdata", 1)
b <- complete("specdata", c(2, 4, 8, 10, 12))
c <- complete("specdata", 30:25)
d <- complete("specdata", 3)
a
b
c
d


   