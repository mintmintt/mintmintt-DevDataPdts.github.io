
library(shiny)
shinyUI(pageWithSidebar(
        titlePanel("My Shiny Basal Metabolic Rate (BMR) App!"),
        sidebarPanel(
                numericInput('weight', 'Your Weight in kg (not pounds)', 65),
                numericInput('height', 'Your Height in cm (not feet) ', 180, min = 0.1, max = 300, step = NA),
                numericInput('age', 'Your Age in years', 25),
                submitButton("Go Calculate!")
        ),
                mainPanel(
                        p('The Basal Metabolic Rate (BMR) is an indication of how many calories your body 
                          burns at rest within a 24 hour period.'),
                        p('The human body uses about 60% calories for natural processes at rest.'),
                        h4('After calculating your Weight, Height and Age:'),
                        ## Renders a reactive output as verbatim text within an application page
                        p('Weight'), verbatimTextOutput("weight"),
                        p('Height'), verbatimTextOutput("height"),
                        p('Age'), verbatimTextOutput("age"),
                        h5('Your BMR is:'),verbatimTextOutput("calculate"),
                        p('How you measure for your Age:'), (verbatimTextOutput("bmr.average")),
                        br(),
                        img(src = "bigorb.png", height = 72, width = 80)
                )
)
)
