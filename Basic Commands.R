#commands using iris package

library(datasets)
head(iris)
summary(iris)
plot(iris)
detach("package=datasets",unload = TRUE)
dev.off()
cat("\014")

################################################################################

#commands to install & use packages

installed.packages("pacman")
require(pacman)
pacman::p_load(pacman,dplyr,GGally,ggplot2,ggthemes,ggvis,httr,
               lubridate,plotly,rio,rmarkdown,shiny,stringr,tidyr)
library(datasets)
p_unload(dplyr,tidyr)
p_unload(all)
detach("package:datasets",unload=TRUE)

################################################################################

#basic graphics in R using plot

library(datasets) #Load/Unload base packages manually
?`datasets-package` #command for help
library(help="datasets") #for complete list of packages
head(iris)

?plot #help for plot
plot(iris$Species)
plot(iris$Petal.Length)
plot(iris$Species,iris$Petal.Length)
plot(iris$Petal.Length,iris$Petal.Width)
plot(iris)

#plot with options
plot(iris$Petal.Length,iris$Petal.Width,
     col="#cc0000",pch=19,
     main="Iris: Petal Length vs Width",
     xlab="Length",
     ylab="Width"
     )

#plot formulas with plot()
plot(cos,0,2*pi)
plot(exp,1,5)
plot(dnorm,-3,+3)

#formula plot with options
plot(dnorm, -3, 3, col="#cc0000",lwd=5,
     main = "Standard Normal Distribution",
     xlab="z-scores",ylab="Density")

########################################################################

#barcharts graphics
library(datasets)
?mtcars
head(mtcars)
barplot(mtcars$cyl) #doesn't work

#Need a table with frequencies for each category
cylinder <-table(mtcars$cyl) #create table
barplot(cylinder) #barchart
plot(mtcars$mpg,mtcars$cyl)

################################################################################

#Histogram chart
?iris
head(iris)
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Width)

#Histogram by Group

#put graphs in 3 rows and 1 column
?par
par(mfrow = c(3,1))

#Histograms for each species using options
hist(iris$Petal.Width[iris$Species == 'setosa'],
     xlim = c(0,3), breaks=9, main = 'Petal Width for Setosa',xlab ='',col='red')
hist(iris$Petal.Width[iris$Species == 'versicolor'],
     xlim = c(0,3), breaks=9, main = 'Petal Width for Versicolor',xlab ='',col='purple')
hist(iris$Petal.Width[iris$Species == 'virginica'],
     xlim = c(0,3), breaks=9, main = 'Petal Width for Verginica',xlab ='',col='yellow')

#Restore graphics parameter
par(mfrow=c(1,1))

#Clear Packages
detach("package:datasets",unload=TRUE) #For base

############################################################

#Scatter Plot Graphs
## Check for (Linear, Spread, Outliers, Correlation)
library(datasets)
?mtcars
head(mtcars)

#Good to first check univariate distributions
hist(mtcars$wt)
hist(mtcars$mpg)

# Basic X-Y plot for two quantitative variables
plot(mtcars$wt,mtcars$mpg)

#Add some options
plot(mtcars$wt,mtcars$mpg,
     col='red',pch=19,#Solid circle
     cex=1.5, #Make 150% size
     main='MPG as a Function of Weight of Cars',
     xlab = 'Weight (in 1000 pounds)',
     ylab = 'MPG')

#######################################################

#Overrlaying Plots
?lynx
head(lynx)

#default plot using histogram
hist(lynx)

#Add options
hist(lynx, breaks =14, #'suggests' 14 bins
     freq = FALSE, #axis shows density, not freq
     col = 'thistle1',
     main=paste('Histogram of Annual Canadian Lync Trappings,1821-1934'),
     xlab='Number of Lynx Trapped')

# Add a normal distribution
curve(dnorm(x,mean=mean(lynx),sd=sd(lynx)),
      col='thistle4', #color of curve
      lwd=2, #line width of pixels
      add=TRUE)#superimpose on previous graph

#Add two kernel density estimators
lines(density(lynx),col='blue',lwd=2)
lines(density(lynx,adjust=3),col='purple',lwd=2)

#Add a rug plot
rug(lynx,lwd=2,col='grey')
############################################################
library(datasets)
head(iris)

#summary
summary(iris$Species)
summary(iris$Sepal.Length)
summary(iris)

############################################################
#Describe using psych package

library(datasets)
head(iris)

install.packages('BiocManager')
# PSYCH PACKAGE #############################
p_load(psych)
#Get info on package

p_help(psych) #pdf in web
p_help(psych,web=F) #help in R view

# DESCRIBE() #################################

describe(iris$Sepal.Length) #one quantitative variable
describe(iris)
###########################################################

head(iris)
hist(iris$Petal.Length)
summary(iris$Petal.Length)

summary(iris$Species)

# SELECT BY CATEGORY #######################

#Versicolor
hist(iris$Petal.Length[iris$Species=='versicolor'],
     main = 'Petal Length: Versicolor')

#Setosa
hist(iris$Petal.Length[iris$Species=='setosa'],
     main = 'Petal Length: Setosa')

#Virginica
hist(iris$Petal.Length[iris$Species=='virginica'],
     main = 'Petal Length: Virginica')


# SELECT BY VALUE #########################

#Short petals only (all Setosa)

hist(iris$Petal.Length[iris$Petal.Length<2],
     main = 'Petal Length < 2: Setosa')

# MULTIPLE SELECTORS ######################

#short virginica petals only
hist(iris$Petal.Length[iris$Species=='virginica' & iris$Petal.Length<5.5],
     main='Petal Length: Short Virginica')


# CREATE SUBSAMPLE #############################################################

#Format: data[rows,columns]
#Leave rows or columns blank to select all
i.setosa <- iris[iris$Species == 'setosa',]

head(i.setosa)
summary(i.setosa$Petal.Length)
hist(i.setosa$Petal.Length)

# CLEAN UP ########################################
p_unload(dplyr,tidyr)
p_unload(all)
detach("package:datasets",unload=TRUE)

################################################################################

# DATA TYPES #######################################

# Numeric
n1 <- 15 #double precision by default
n1
typeof(n1)

n2 <- 1.5
n2
typeof(n2)

# Character

c1 <- "c"
c1
typeof(c1)

c2 <- "a string of text"
c2
typeof(c2)

# Logical
l1 <- TRUE
l1
typeof(l1)

l2 <- F
l2
typeof(l2)


# DATA STRUCTURES ##############################################

v1 <- c(1,2,3,4,5)
v1
is.vector(v1)

v2 <- c('a','b','c')
v2
is.vector(v2)

v3 <- c(TRUE,FALSE,FALSE,FALSE<TRUE)
v3
is.vector(v3)

# MATRIX #################################################

m1 <- matrix(c(T,T,F,F,T,F),nrow=2)
m1

m2 <- matrix(c('a','b','c','d'),nrow=2,byrow=T)
m2


# ARRAY ###################################################
# Give data, then dimensions (rows,columns,tables)

a1 <- array(c(1:24),c(4,3,2))
a1

## Date Frame #############################################

# can combine vectors of the same length
vNumeric <- c(1,2,3)
vCharacter <- c('a','b','c')
vLogical <- c(T,F,T)

dfa <- cbind(vNumeric,vCharacter,vLogical)
dfa #Matrix of one data type

df <- as.data.frame(cbind(vNumeric,vCharacter,vLogical))
df #makes a data frame with three different data types


# List ###################################################

o1 <- c(1,2,3)
o2 <- c('a','b','c','d')
o3 <- c(T,F,T,T,F)

list1 <- list(o1,o2,o3)
list1

list2 <- list(o1,o2,o3,list1) #Lists within lists!
list2

# COERCING TYPES ###########################################

## Automatic coercion ##############################

#goes to "least restrictive" data type

(coerce1 <- c(1,'b',TRUE))
typeof(coerce1)

(coerce2 <- 5)
typeof(coerce2)

(coerce3 <- as.integer(5))
typeof(coerce3)

## Coerce character to numeric ##############################

(coerce4 <- c('1','2','3'))
typeof(coerce4)

(coerce5 <- as.numeric(c('1','2','3')))
typeof(coerce5)


## Coerce matrix to data frame ##############################

(coerce6 <- matrix(1:9,nrow=3))
is.matrix(coerce6)


(coerce7 <- as.data.frame(matrix(1:9, nrow= 3)))
is.data.frame(coerce7)

################################################################################

(x1 <-1:3)
(y<-1:9)

# combine variables
(df1<-cbind.data.frame(x1,y))
typeof(df1$x1)
str(df1)


################################################################################

# IMPORTING USING RIO #######################################

#CSV
rio_csv <- import('tomatoes.csv')
head(rio_csv)

#TXT
rio_txt <- import("location.txt")
head(rio_txt)

#XLSX
rio_xlsx <- import(location.xlsx)
head(rio_xlsx)


# DATA VIEWER ###############################################
?View
View(rio_csv)

# READ>TABLE FOR TXT FILES #################################

#R's built-in function for text files (used by rio)

# TEXT FILES

# Load a spreadsheet that has been saved as tab-delimited
# tex file. Need to give complete address to file. This
# command gives an error on missing data but works on complete data.

r_txt1 <- read.table('location.txt', header = TRUE)

# This works with missing data by specifying the separators:
# \t is for tabs, sep = "," for commas. R converts missing to "NA"

r_txt2 <- read.table("loaction.txt",header=TRUE, sep = '\t')


#CSV FILES

r_csv <- read.csv("location.csv",header=TRUE)



################################################################################

#commands to install & use packages

installed.packages("pacman")

require(pacman)
pacman::p_load(pacman,dplyr,GGally,ggplot2,ggthemes,ggvis,httr,
               lubridate,plotly,rio,rmarkdown,shiny,stringr,tidyr)
library(datasets)

?USJudgeRatings
head(USJudgeRatings)

data <- USJudgeRatings

# Define variable groups

x <- as.matrix(data[-12])
y <- data[,12]

# REGRESSION WITH SIMULTANEOUS ENTRY

# Using variable groups
reg1 <- lm(y~x)

# Or specify variables individually
reg1 <- lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG + DECI + PREP + FAMI +
             ORAL + WRIT + PHYS, data = USJudgeRatings)

# Results
reg1            #coefficients only
summary(reg1)   #inferential tests


# More Summaries 

anova(reg1)
coef(reg1)
confint(reg1)
resid(reg1)
hist(residuals(reg1))

# ADDITIONAL MODELS ############################################################

# Use two additional libraries
p_load(lars,caret)


#Conventional stepwise regression
stepwise <- lars(x,y, type = 'stepwise')


# Stagewise: Like stepwise but with better generalizability
forward <- lars(x,y,type='forward.stagewise')


# LAR: Least Angle Regression
lar <- lars(x,y,type='lar')


#LASSO: Least Absolute Shrinkage and Selection Operator
lasso <- lars(x,y, type = "lasso")

# Comparison of R^2 for new models
r2comp <- c(stepwise$R2[6], forward$R2[6], lar$R2[6],lasso$R2[6]) %>% round(2)

names(r2comp) <- c("stepwise", "forward", "lars","lasso")
r2comp #show values of R^2

# CLEAN UP

p_unload(dplyr,tidyr)
p_unload(all)
detach("package:datasets",unload=TRUE)


# Clear Environment
rm(list = ls())
