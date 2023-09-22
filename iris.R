library(dplyr)
library(datasets)


data(iris)
#attach(df)
names(iris)

#view the number of variables and the data types
str(iris)

#view the first five rows 
head(iris)

#get a summary statistics for the dataset
summary(iris)


#the median of the length of each species.
tapply(iris$Sepal.Width, iris$Species, median)

#count of column and rows
nrow(iris)
ncol(iris)

#%%%%%%%%%Filtering Data%%%%%%%%%%%%%
library(tidyverse)

#filter one species
df <- filter(iris, iris$Species == "setosa")
head(df)

##sepal length greater than 4
sep_iris <- filter(iris, iris$Sepal.Length > 4 & iris$Species=="setosa")

head(iris%>%filter(Species != "setosa"))

#scatter plots to observe relationship between length and width
plot(iris$Sepal.Width, iris$Sepal.Length, xlab = "Sepal.Width",
     ylab = "Sepal.Length", main = "Scatter Plot", pch=19)

#histogram to check the statistical distribution
hist(iris$Sepal.Length, breaks = 20, col = "blue")

hist(iris$Sepal.Length, freq = FALSE, breaks = 20, main = "Histogram")
curve(dnorm(x, mean = mean(iris$Sepal.Length), sd=sd(iris$Sepal.Length)),
      add=TRUE,col= "red")

###summary sepal length
summary(iris$Sepal.Length)

####BOXPLOT####
boxplot(iris$Sepal.Length, ylab = "Sepal Length",
        main = "Boxplot example with sepal length", horizontal = TRUE)

boxplot(Sepal.Length~ Species, data = iris, ylab = "Sepal Length", 
        main = "Sepal Length Distributions", horizontal = FALSE)


###kernel density plots for sepal length
k<- density(iris$Sepal.Length, bw = "sj")
k
plot(k)

#filling a desnity plot using a polygon
#compute density
k <- density(iris$Sepal.Length)

#density plot
plot(k, main = "Density of Sepal Length")
#fill the density with color
polygon(k, col = "maroon", border = 'black')


#check for normality of sepal length using qqplot
qqnorm((iris$Sepal.Length), main="Normal qq plot Plot of Price")
qqline(iris$Sepal.Length)

