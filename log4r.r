# Load required libraries
library(shiny)
library(log4r)

# Create a logger with a file appender
appender <- fileAppender("app.log", threshold = "INFO", append = TRUE)
logger <- logger("shiny_app")
addAppender(logger, appender)

# Define the Shiny server function
server <- function(input, output, session) {
  
  # Log session information at the start of the app
  loginfo(logger, "Shiny app started.")
  loginfo(logger, "Session ID:", session$token)
  loginfo(logger, "Client address:", session$clientData$session$clientAddress)
  loginfo(logger, "User agent:", session$clientData$session$userAgent)
  loginfo(logger, "Server address:", session$clientData$url_protocol$HTTP_HOST)
  loginfo(logger, "App path:", session$clientData$url_pathname)
  
  observe({
    # Some computation or data manipulation
    loginfo(logger, "Data manipulation completed.")
    # More code...
  })
  
  output$plot <- renderPlot({
    # Some plotting code
    logdebug(logger, "Plot rendering started.")
    # More code...
  })
  
  observeEvent(input$button, {
    # Some action taken upon button click
    logwarn(logger, "Button clicked with input:", input$button)
    # More code...
  })
  
  # More server code...
  
  # Log session information when the app is closed
  session$onSessionEnded(function() {
    loginfo(logger, "Shiny app session ended.")
  })
}

# Run the Shiny app
shinyApp(ui, server)
