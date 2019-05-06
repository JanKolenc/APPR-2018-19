library(shiny)

function(input, output) {
  
  output$zemljevid.leto <- renderPlot({
    zemljevid.leto(input$leto) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
  })
}