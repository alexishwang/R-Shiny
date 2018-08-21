library(shiny)
library(tidyverse)
library(DT)
shinyUI(fluidPage(
    fluidRow(
      titlePanel("Prime number Checker"),
      selectInput("prime", "Select the type of number",
                  choice = c("Prime", 'Composite')),
      sliderInput("range", "Range of numbers",
                  min = 1, max = 500, value = c(100,200))
  ),
  fluidRow(
    htmlOutput("prime_checker"),
    DTOutput("is_prime")
  )
  
))
