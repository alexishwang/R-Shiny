library(shiny)


shinyServer(function(input, output) {
   
  output$is_prime <- renderDataTable({
    datatable(iris)
  })

  output$prime_checker <- renderUI({
    paste(input$range[2])
  })
  
})


is_prime <- function(num) {
  # Base case
  if (num < 2) return(FALSE)
  if (num == 2) return(FALSE)
  
  for (div in 2 : (num-1)) {
    if (num %% div == 0) {
      return(FALSE)
    }
  }
  return(TRUE)
}