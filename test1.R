x <- "Hello World"
print(x)
x

l <- TRUE
i <- 123L
n <- 1.23
d <- as.Date("2020-03-25")

# Print the values
l
i
n
d

#Create a function
f <- function(x){x + 1}

#invoke the function

f(2)

# creating a vector
v <- c(1,2,3)
v

#create a sequence
s <- 5:1
s

#create a matrix
m <- matrix(data = 1:6, nrow=2, ncol=3)
m

#create an array
a <- array(data=1:8, dim = c(2,2,2))
a

#create a list of hetrogenous data types
l <- list(TRUE, 123L, 1.23, "Hello", as.Date("2020-03-25"))
l

#factors
categories <- c("Male", "Female", "Male", "Male", "Female")
factor <- factor(categories)
factor
levels(factor)
unclass(factor)

#creating a data frame
df <- data.frame(Name = c("Cat", "Dog", "Cow", "Pig"), HowMany = c(5, 10, 15,20), IsPet=c(TRUE, TRUE, FALSE, FALSE))
df                 
#Indexing data frames
df[1,2]
df[1]
df[1,]
df[,2]
df[["HowMany"]]
df$HowMany

#Subsetting data frames
df[c(2,4),]
df[2:4,]
df[c(FALSE,FALSE,TRUE,FALSE),]
df[df$IsPet == TRUE,]
df[df$HowMany > 10 ,]
df[df$Name %in% c("Cat", "Cow"),]

#R is an vectorized language
1+2
c(1,2,3)+c(4,5,6)

#NAmed vs ordered arguments
m <- matrix(data=1:6, nrow = 2, ncol = 3)
n <- matrix(1:6, 2, 3)
m == n 
identical(m,n)

#Installing pacakges
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ff")

library("dplyr")
?data.frame
