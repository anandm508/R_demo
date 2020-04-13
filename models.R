data(iris)

head(iris)

#Create a scatterplot petal length and width
plot(x = iris$Petal.Length, 
     y = iris$Petal.Width, 
     main = "Iris petal length vs width", 
     xlab = "Petal length",
     ylab = "Petal width")

#Create a linear regression model
model <- lm(formula = Petal.Width~Petal.Length, data = iris)

#Summarize the model
summary(model)

#Draw a regression line on the plot
lines(x = iris$Petal.Length,
     y = model$fitted,
     col = "red",
     lwd = 3)

#Get the correlation between petal length and width
cor(x = iris$Petal.Length, y = iris$Petal.Width)

#Predict new values from the model
predict(object = model, newdata = data.frame(Petal.Length=c(2,5,7)))

#Solve the same senario using big data extensions.

#Creating a CSV file with iris data.
write.csv(x = iris,
          file = "iris.csv",
          row.names = FALSE)

library("ff")

#load data using ff extension
irisff <- read.table.ffdf(file = "iris.csv" , FUN = "read.csv" )

#Check the class
class(irisff)

#check the column names
names(irisff)

#inspect the first five rows
irisff[1:5,]

#load the biglm package
library("biglm")

#Create a linerar regression model
modelff <- biglm(formula = Petal.Width~Petal.Length, data = irisff)

#Summarize the model
summary(modelff)

#Create a scatterplot petal length and width
plot(x = irisff$Petal.Length[], 
     y = irisff$Petal.Width[], 
     main = "Iris petal length vs width", 
     xlab = "Petal length",
     ylab = "Petal width")

#Get Y intercept from the model
b = summary(modelff)$mat[1,1]

#Get the slope from the model
m = summary(modelff)$mat[2,1]

#Draw a regression line on the plot
lines(x = iris$Petal.Length[],
      y = m*iris$Petal.Length[] + b,
      col = "red",
      lwd = 3)

#Predict new values from the model
predict(object = modelff, newdata = data.frame(Petal.Length=c(2,5,7), Petal.Width=c(0,0,0)))

