library(shiny)


shinyServer(function(input, output) {
   
  output$is_prime <- renderDataTable({
    start = input$range[1]
    end = input$range[2]
    df = data.frame(Number = c(start:end), 
                    Prime = c(start:end))
    for (i in 1 : nrow(df)) {
      if (is_prime(start+i-1)) {
        df[i,2] = "True"
      } else {
        df[i,2] = "False"
      }
    }
    datatable(df)
  })

  output$prime_checker <- renderUI({
    paste(input$range[2])
  })
  
})


is_prime <- function(num) {
  # Base case
  if (num < 2) return(FALSE)
  if (num == 2) return(TRUE)
  
  for (div in 2 : (num-1)) {
    if (num %% div == 0) {
      return(FALSE)
    }
  }
  return(TRUE)
}