library(shiny)
library(tidyverse)
library(DT)
shinyUI(fluidPage(
    titlePanel("Prime number Checker"),
    fluidRow(
      column(5,
             # selectInput("prime", "Select the type of number",
             #             choice = c("Prime", 'Composite')),
             sliderInput("range", "Range of numbers",
                         min = 1, max = 500, value = c(100,200))),
      column(5,
             # htmlOutput("prime_checker"),
             DTOutput("is_prime"))

  )
))
