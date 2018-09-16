library(shiny)
library(plotly)
distribution = c("Uniform","Bernoulli","Geometric","Exponential",
  "Normal", "Poisson", "Hypergeometric", "Binomial",
  "Negative Binomial","Log Normal","Student's t","Chi-squared",
  "Weibull","Gamma","Beta")

ui <- fluidPage(

   titlePanel("Distribution Generator"),
   navbarPage(title = "Page", tabPanel("tab 1", "contents"), tabPanel("tab 2", "contents"), tabPanel("tab 3", "contents")),
   hr(),
   sidebarLayout(
      sidebarPanel(
        selectInput("dist", "Select Distribution", choice = distribution),
        sliderInput("bins",
                     "Number of bins:",
                     min = 1000,
                     max = 10000,
                     value = 2000)
      ),
      mainPanel(
         plotlyOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlotly({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      # hist(x, breaks = bins, col = 'darkgray', border = 'white')
      if (input$dist == "Poisson") {
        x = rpois(input$bins,15)
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        plot_ly(x = x, type = "histogram", color = "green")
      } else if (input$dist == "Gamma") {
        x= rgamma(input$bins, 10)
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        plot_ly(x = x, type = "histogram", color = "green")
      }
      else if (input$dist == "Gamma") {
        x= rgamma(input$bins, 10)
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        plot_ly(x = x, type = "histogram", color = "red")
      }
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

