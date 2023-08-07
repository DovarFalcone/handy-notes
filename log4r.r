# Load required libraries
library(shiny)
library(log4r)

# Create a logger instance
logger <- log4r::logger()

# Initialize the logger to log to a file
appender <- log4r::file_appender("app.log", append = TRUE)
log4r::add_appender(logger, appender)

# Set the logging level
log4r::log_threshold(logger, "INFO")

# Define the Shiny server function
server <- function(input, output, session) {
  
  # Log session information at the start of the app
  log4r::loginfo(logger, "Shiny app started.")
  log4r::loginfo(logger, "Session ID:", session$token)
  log4r::loginfo(logger, "Client address:", session$clientData$session$clientAddress)
  log4r::loginfo(logger, "User agent:", session$clientData$session$userAgent)
  log4r::loginfo(logger, "Server address:", session$clientData$url_protocol$HTTP_HOST)
  log4r::loginfo(logger, "App path:", session$clientData$url_pathname)
  
  observe({
    # Some computation or data manipulation
    log4r::loginfo(logger, "Data manipulation completed.")
    # More code...
  })
  
  output$plot <- renderPlot({
    # Some plotting code
    log4r::logdebug(logger, "Plot rendering started.")
    # More code...
  })
  
  observeEvent(input$button, {
    # Some action taken upon button click
    log4r::logwarn(logger, "Button clicked with input:", input$button)
    # More code...
  })
  
  # More server code...
  
  # Log session information when the app is closed
  session$onSessionEnded(function() {
    log4r::loginfo(logger, "Shiny app session ended.")
  })
}

# Run the Shiny app
shinyApp(ui, server)
