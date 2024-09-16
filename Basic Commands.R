#commands using iris package

library(datasets)
head(iris)
summary(iris)
plot(iris)
detach("package=datasets",unload = TRUE)
dev.off()
cat("\014")

#commands to install & use packages

installed.packages("pacman")
require(pacman)
pacman::p_load(pacman,dplyr,GGally,ggplot2,ggthemes,ggvis,httr,lubridate,plotly,rio,rmarkdown,shiny,stringr,tidyr)
library(datasets)
p_unload(dplyr,tidyr)
p_unload(all)
detach("package:datasets",unload=TRUE)

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
plot(dnorm, -3, 3, col="#cc0000",lwd=5,main = "Standard Normal Distribution",xlab="z-scores",ylab="Density")

