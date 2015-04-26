
library(shiny)

# Define server logic 

BMR <- function(weight, height, age) {66.47+(13.75*weight)+(5.0*height)-(6.75*age)}

        bmr.average <- function(weight, height, age) {
                BMR_value <- 66.47+(13.75*weight)+(5.0*height)-(6.75*age)
                ifelse(BMR_value<1000, "You are burning calories below Average. Disclaimer: This is an estimate only.",
                       ifelse(BMR_value<1200, "Congrats! You are buring calories on Average. Disclaimer: This is an estimate only.",
                              ifelse(BMR_value<1800, "Wow! You are burning calories above Average! Disclaimer: This is an estimate only.")))
        }
        shinyServer(
                function(input, output) {
                output$weight <- renderPrint({input$weight})
                output$height <- renderPrint({input$height})
                output$age <- renderPrint({input$age})
                output$calculate <- renderPrint({BMR(input$weight, input$height, input$age)})
                output$bmr.average <- renderPrint({bmr.average(input$weight, input$height, input$age)})
                output$text4<- renderText({
                        input$submitButton
})
        }
)
