library(shiny)
shinyServer(function(input, output) {
  output$inputunit <- renderText(input$inputunit)
  output$inputvalue <- renderText(input$inputvalue)
  output$outputunit <- renderText(input$outputunit)
  calc_temperature <- reactive({
    if(grepl("Kelvin",input$outputunit) && grepl("Celsius",input$inputunit)) {
      input$inputvalue + 273.15
    } else if(grepl("Celsius",input$outputunit) && grepl("Kelvin",input$inputunit)) {
      input$inputvalue - 273.15
    } else if(grepl("Fahrenheit",input$outputunit) && grepl("Celsius",input$inputunit)) {
        32 + input$inputvalue*9/5
    } else if(grepl("Celsius",input$outputunit) && grepl("Fahrenheit",input$inputunit)) {
        (input$inputvalue - 32)*5/9
    } else if(grepl("Fahrenheit",input$outputunit) && grepl("Kelvin",input$inputunit)) {
      32 + (input$inputvalue - 273.15) *9/5
    } else if(grepl("Kelvin",input$outputunit) && grepl("Fahrenheit",input$inputunit)) {
      (input$inputvalue - 305.15)*5/9
    } else if(grepl(input$inputunit,input$outputunit)) {
        input$inputvalue
    } else {
      0
    }
  })
  calc_round_temperature <- reactive({
    ifelse(input$roundoutput, round(calc_temperature(), digits = 2), calc_temperature())}) 
  output$outputvalue <- renderText(calc_round_temperature())
})
