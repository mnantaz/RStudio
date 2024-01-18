



data("mtcars")
df <- data.frame(PCOS.DATA)

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    ggplot(
      df,
      aes_string(
        x = df$age_cat,
        y = df$amh_ng_m_l,
        fill = df$patient_file_no,
        color = df$age_cat
      )
    ) + geom_boxplot() + geom_jitter(
      width = 0.2,
      height = 0,
      alpha = 0.5,
      color = "steelblue"
    )  + geom_point(
      df,
      mapping = aes(x = age_cat[input$Varname1], y = amh_ng_m_l[input$Varname1]),
      colour = "red",
      size = 3
    )
    
  })
  output$plot2 <- renderPlot({
    boxplot(
      df[, input$VarName2],
      main = paste("Boxplot of", input$VarName2),
      xlab = input$VarName2,
      col = "grey"
    )
  })
  
})
