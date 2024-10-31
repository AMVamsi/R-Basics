# Task 1 #######################################################################


























################# ENTRY -- $ -- EXCERCISES ##############################################################

library(datasets)
head(iris)
length(iris$Species)
count <- sum(iris$Species == 'setosa')
count
# Load the iris dataset
data(iris)
?sort
# Count the number of instances in the 'setosa' category
setosa_count <- sum(iris$Species == "setosa")

# Print the result
setosa_count

sort(iris$Sepal.Length)

# Load the iris dataset
data(iris)

# Sort the dataset in ascending order by Sepal.Length
iris_sorted <- iris[order(iris$Sepal.Length), ]

# View the sorted dataset
head(iris_sorted)
print(iris_sorted$Sepal.Width)
###############################################################################
g <- function(a,b){
  totalMean = mean(iris$Sepal.Length)
  partMean = mean(iris$Sepal.Length[iris$Sepal.Length > a & iris$Sepal.Length < b ])
  return (totalMean - partMean)
}

g(4,5)
?return
?and
mean(iris$Sepal.Length)
mean(iris$Sepal.Length[iris$Sepal.Length > '2' & iris$Sepal.Length < '5' ])

newOne <- length(iris$Petal.Length=='1.1')
newOne
ncol(iris)
sum[iris$Species == 'setosa']

library(datasets)

newOrder <- iris[order(iris$Sepal.Length, decreasing = TRUE),]

newOrder(iris$Sepal.Width)

############################################################################
nrow(swiss)
ncol(swiss)
?stderr
?sd()
sd(swiss$Fertility)
?hist()
hist(swiss$Agriculture)
boxplot(swiss$Agriculture)
cat <- swiss$Catholic[swiss$Catholic > 50]
cat
length(cat)
length(swiss$Catholic)
length(cat)/length(swiss$Catholic)

sorted=sort(swiss$Infant.Mortality) 
sorted
middlesized=sorted[22:26] 
middlesized

sum(swiss$Examination[swiss$Examination == ''])
?which
?is
?na
##########################################################################
library(readr)
tomato_data <- read.csv("tomatoes.csv",sep=";",dec=".",header=TRUE)
tomato_data
setwd("C:/Vamsi/Github/R-Basics")
getwd()
print(tomato_data)
newTomato <-read.delim("tomatoes.csv",sep=";",dec=".",header=TRUE)
newTomato
?sep
?delim
?read.delim
str(newTomato)
newTomato$color = as.factor(newTomato$color)
###############################################################################

