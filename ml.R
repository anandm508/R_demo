


#LOad the data
data(iris)

#Set a seed to make randomness reproducable
set.seed(42)

#Randomly select 100 indexed out of 150 for training the model
indexes <- sample(
    x = 1:150,
    size = 100)

#Print the random indexed
indexes

#Create a traing data set
training <- iris[indexes,]

#Create a test data set
test <- iris[-indexes,]

#Load the descion tree package
library(tree)


#Create a decion tree model
model <- tree(
  formula = Species ~ Petal.Length + Petal.Width, 
  data =  training)

#Summarize the model
summary(model)

#Visualize the decion tree model
plot(model)
text(model)

#Load the color brewer library
library(RColorBrewer)

#Create a color palatte
pallate<-brewer.pal(3, "Set2")

#Create a scatterplot colored by speices
plot(x = iris$Petal.Length, 
     y = iris$Petal.Width, 
     pch = 19,
     col = pallate[as.numeric(iris$Species)],
     main = "Iris petal length vs width", 
     xlab = "Petal length",
     ylab = "Petal width")

#Plot the decion boundaries
# Partioning might fail if the classification model has more than 2 predictors
partition.tree(tree = model,label="Species", add=TRUE) 

#Predict with the model
predictions <- predict(object = model, newdata = test, type= "class")

#Create a confusion matrix
table(x=predictions,y=test$Species)

#Load the caret package
library(caret)

#Evaludate the prediction results
confusionMatrix(data=predictions,reference=test$Species)

#Set the owking directory
setwd("D:/datascience")

#Save the model
save(model, file="Tree.RData")


