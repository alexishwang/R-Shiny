library(shiny)
library(tidyverse)
library(DT)
shinyUI(fluidPage(
  
  titlePanel("Prime number Checker"),
    sidebarPanel(
      selectInput("prime", "Select the type of number",
                  choice = c("Prime", 'Composite')),
      sliderInput("range", "Range of numbers",
                  min = 1, max = 1000, value = c(3,75))
  ),
  mainPanel(
    htmlOutput("prime_checker"),
    DTOutput("is_prime")
  )
  
))
