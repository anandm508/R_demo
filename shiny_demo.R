#Deploy to production
source("D:/test/ml.R")
library(shiny)

#Create a UI
ui <- fluidPage(
  title = "Hello World"
)

#Create a server
server <- function(input, output, session) {
  
}

shinyApp(ui, server)



ui <- fluidPage(
  titlePanel("Input and output"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "num",
        label = "Choose a number",
        min = 0,
        max = 100,
        value = 25
      )
    ),
    mainPanel(
      textOutput(
        outputId = "text"
      )
    )
  )
)

server <- function(input, output, session) {
  output$text <- renderText({
    paste("You selected", input$num)
  })
}

shinyApp(ui, server)

#---Do the actual thing---
setwd("D:/datascience")

load("Tree.RData")

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

ui <- fluidPage(
  titlePanel("Iris Species Predictor"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "length",
        label = "Choose a petal length",
        min = 1,
        max = 7,
        value = 2.5,
        step = .5
      ),
      sliderInput(
        inputId = "width",
        label = "Choose a petal width",
        min = .5,
        max = 2.5,
        value = 1,
        step = .5
      )
    ),
    mainPanel(
      textOutput(
        outputId = "species"
      ),
      plotOutput(outputId = "plot")
    )
  )
)

server <- function(input, output, session) {
  output$species <- renderText({
    
    predictors <- data.frame(
      Petal.Length = input$length,
      Petal.Width = input$width,
      Sepal.length = 0,
      Sepal.Width = 0
    )
    
   prediction <- predict(
      object = model,
      newdata = predictors,
      type = "class"
      )
    
    
    paste("The predicted species is ", as.character(prediction))
  })
  
  output$plot <- renderPlot({
    
    plot(x = iris$Petal.Length, 
         y = iris$Petal.Width, 
         pch = 19,
         col = pallate[as.numeric(iris$Species)],
         main = "Iris petal length vs width", 
         xlab = "Petal length",
         ylab = "Petal width")
    
    partition.tree(tree = model,label="Species", add=TRUE) 
    
    #Draw predictor on the plot
    points(
      x = input$length,
      y = input$width,
      col = "red",
      pch = 4,
      cex = 2,
      lwd = 2
    )
    
    })
 
}

shinyApp(ui, server)