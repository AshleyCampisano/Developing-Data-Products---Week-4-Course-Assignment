#Developing Data Products - Week 4 Assignment

#Server.r file

#This application uses Shiny to help users understand the different variables that can affect the Carat vs. Price relationship of Diamonds

#Load Required Applications

library(shiny)
library(ggplot2)
library(tidyverse)
library(curl)

#Server

shinyServer(function(input, output) {
    
    #Load Diamonds dataset
    
    data("diamonds")
    
    output$Plot <- renderPlot({
        
        # subset the date based on the inputs
        
        diamonds_sub <-
            subset(
                diamonds,
                cut == input$cut &
                    color == input$color &
                    clarity == input$clarity
            )
        
        #Plot Price vs Carat Relationship
        
        p <- ggplot(data = diamonds_sub, aes(x = carat, y = price, color = price)) + geom_point()
        p <- p + geom_smooth(method = "lm", color = "Black") + xlab("Carat") + ylab("Price")
        p <- p + xlim(0, 6) + ylim (0, 20000)
        p + theme_bw()
    }, height = 650)
})
    