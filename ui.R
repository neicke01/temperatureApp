library(shiny)
shinyUI(fluidPage(
  titlePanel("Temperature Unit Translator"),
  sidebarLayout(
    sidebarPanel(
      selectInput("inputunit", "Choose a input unit:",
                  choices = c("Kelvin", "Celsius", "Fahrenheit")),
      selectInput("outputunit", "Choose a output unit:",
                  choices = c("Kelvin", "Celsius", "Fahrenheit")),
      numericInput("inputvalue", "enter value:", value = 0),
	  checkboxInput("roundoutput", "round output", value = TRUE)
    ),
    mainPanel(
      h3("input unit:"),
      textOutput("inputunit"),
      h3("value of source temperature unit:"),
      textOutput("inputvalue"),
      h3("output unit:"),
      textOutput("outputunit"),
      h3("value of translated temperature unit:"),
      textOutput("outputvalue")
    )
  )
))
