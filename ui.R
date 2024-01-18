#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("Box Plot"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("Varname1", "Patient Number:", 1, min = 1, max = length(unique(PCOS.DATA$patient_file_no))),
      verbatimTextOutput("value"),
      
      # selectInput(inputId = "VarName1",
      #             label = "Select Numeric Variable1:",
      #             choices = names(PCOS.DATA)),
      
      selectInput(
        inputId = "VarName2",
        label = "Select Numeric Variable2:",
        choices = names(PCOS.DATA)
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput(outputId = "plot1"),
              plotOutput(outputId = "plot2"))
  )
))