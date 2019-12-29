#Developing Data Products - Week 4 Assignment

#UI.r file

#This application uses Shiny to help users understand the different variables that can affect the Carat vs. Price relationship of Diamonds

#Load Required Packages
library(shiny)
library(ggplot2)

#Load Data

data("diamonds")

#UI for application

shinyUI(fluidPage(
    titlePanel("How the Carat vs Price Relationship of Diamonds is Affected by Cut, Clarity and Color"),
    
    sidebarLayout(
        sidebarPanel(
            h4("Variable Filter"),
            
            selectInput("cut",
                        "Cut",
                        (sort(
                            unique(diamonds$cut), decreasing = T
                        ))),
            
            selectInput("color",
                        "Color",
                        (sort(
                            unique(diamonds$color)
                        ))),
            
            selectInput("clarity",
                        "Clarity",
                        (sort(
                            unique(diamonds$clarity), decreasing = T
                        ))),

            sliderInput(
                "lm",
                "Carat",
                min = min(diamonds$carat),
                max = max(diamonds$carat),
                value = max(diamonds$carat) / 2,
                step = 0.1
            ),
        
        ),
        
        # Show plot of the Carat vs. Price relationship of Diamonds
        
        mainPanel(tabsetPanel(
            tabPanel("Plot", plotOutput("Plot")),
            
            tabPanel(
                "Documentation",
                br(),
                
                helpText(
                    "This Shiny application helps to visualize the Carat vs Price relationship of Diamonds and how other variables (Color, Clarity, Cut) affect this relationship."
                )),
            
            tabPanel(
                "Data Description",
                
                br(),
                
                helpText("This Shiny Application uses the Diamonds dataset that is a part of the GGplot2 package. The Diamonds dataset contains the price, carat and other measurements of over 54,00 diamonds.See furhter description of data at the website below:"),
                
                br(),
                
                tags$a("http://ggplot2.tidyverse.org/reference/diamonds.html",href = "http://ggplot2.tidyverse.org/reference/diamonds.html")
            )
            
        ))
    )
))