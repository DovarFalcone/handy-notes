ui <- fluidPage(
  # Add inline styles with nonce attribute
  tags$style(HTML('your-inline-css-here', nonce = shiny:::shiny_csp_nonce())),
  # Your Shiny app content goes here
)

# Add the necessary JavaScript libraries
shinyApp(ui, server = function(input, output) {
  # Add inline scripts with nonce attribute
  tags$script(HTML('your-inline-js-here', nonce = shiny:::shiny_csp_nonce()))
  # Your server logic goes here
})
